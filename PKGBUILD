# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgbase=sourcebans-pp
pkgname=(sourcebans-pp sourcemod-sourcebans-pp)
pkgver=2.2.3
pkgrel=1
pkgdesc="SourceBans++, the admin, ban and communication management of SourceMod game servers"
arch=(any)
url="https://sbpp.github.io"
license=(Elastic-2.0 GPL-3.0-only)
# The panel's PHP libraries (Composer, at the lock file's versions; lcobucci/jwt requires sodium),
# SourceMod's compiler and include files for the plugins, and SourceMod, which the plugins' package
# depends on (makepkg installs the depends of every package of a split PKGBUILD)
makedepends=(composer git php php-sodium sourcemod sourcemod-scripting)
# A database server for upstream's tests and sourcebans-pp's
checkdepends=(mariadb)
source=("git+https://github.com/sbpp/sourcebans-pp.git#tag=$pkgver"
  sourcebans-pp.php
  nginx.conf.example)
sha512sums=('9758c463719adfe1c3115f06026da6034a771814c5c8948547fdb228d86db29ad945b1131b555a35f1446210c8880663cd986d2b4a3f1f14152624344d6c1f85'
  'b4368cfc69b78a727d31f586068aa65de35741171141ca145c5dcbdaa2d068261cc3f6564ac94a38fb1d94c40bdf2bdda98c4623cdf18e90b716d6b40f3a92bf'
  '227373db3705b82b2c44d2d2a0ed7916e35d3c40c2381ee67d0397e23bc1ff4796b6d049aeb6674c0e1e7b9323222e74c0fd90639ea8d6899a58932b05682b19')
b2sums=('9e69911b790cc681f7b7a8790de16fd2a2bd092369b556eb8a5dd98149601fbbcc56604992291380528c7f4683d35d354603ea6e8e0d3e227a07a938a5efce05'
  'bb98ddf6ba5111995ac6128c9dc5d787099f4a250ff4ae29fa15b14c25132ed2bd110b47c459f9bd7453ac2da0dffb69966ef4f9b471944b06c083e704dfe2ee'
  '03f7ce234493a51c3be8b3b5f5b35a287ccbc36f6fbda5b12fabc8bb5608221d9bedc31e291c1838dd4d92c8cf9a2c6df43b357e86313f75c82c20343af1d054')

prepare() {
  cd "$pkgbase" || exit

  # The version of the plugins (their include file) and of the panel (configs/version.json), as
  # upstream's release workflow sets them
  SBPP_RELEASE_VERSION="$pkgver" bash game/addons/sourcemod/scripting/scripts/resolve-plugin-version.sh
  printf '{\n    "version": "%s",\n    "git": "%s",\n    "dev": false\n}\n' \
    "$pkgver" "$(git rev-parse --short HEAD)" >web/configs/version.json

  # Nothing prebuilt: TinyMCE 5.4.2, which nothing loads since the dashboard text's editor was
  # replaced by Markdown (#1113), and the GeoLite2 Country database, geoipupdate's instead
  rm -r web/includes/tinymce
  rm web/data/GeoLite2-Country.mmdb

  # The daily telemetry ping off unless an admin turns it on (Settings, Features): the default of
  # new installs (data.sql) and of the migration adding it to older ones (807)
  local _file
  for _file in web/install/includes/sql/data.sql web/updater/data/807.php; do
    grep -q "('telemetry.enabled', '1')" "$_file" || exit
    sed -i "s/('telemetry.enabled', '1')/('telemetry.enabled', '0')/" "$_file"
  done
}

build() {
  cd "$pkgbase" || exit

  local _src
  cd game/addons/sourcemod/scripting || exit
  for _src in *.sp; do
    spcomp64 -iinclude -o"../plugins/${_src%.sp}.smx" "$_src"
  done
  cd "$srcdir/$pkgbase" || exit

  # The panel's libraries, without the development ones, like upstream's release; the PHP extensions
  # they require, which Arch's PHP doesn't load by default
  local _php=(php -d extension=iconv -d extension=sodium)
  export COMPOSER_HOME="$srcdir/composer"
  "${_php[@]}" /usr/bin/composer install --working-dir=web --no-dev --optimize-autoloader \
    --no-interaction --prefer-dist --no-progress
}

check() {
  # Upstream's tests, with PHPUnit and the other development libraries in a copy of the checkout, as
  # some of them read files outside the panel
  rm -rf "$srcdir/test"
  cp -a "$srcdir/$pkgbase" "$srcdir/test"
  cd "$srcdir/test/web" || exit
  # The extensions in an ini file rather than php -d, which the tests PHPUnit runs in processes of
  # their own don't get
  mkdir -p "$srcdir/php"
  printf 'extension=%s\n' iconv pdo_mysql sodium >"$srcdir/php/extensions.ini"
  export PHP_INI_SCAN_DIR=":$srcdir/php"
  export COMPOSER_HOME="$srcdir/composer"
  composer install --no-interaction --prefer-dist --no-progress

  # A MariaDB server of the build's own, on a socket: the tests create their database; sourcebans-pp
  # sets up one like an install
  local _db="$srcdir/mariadb"
  rm -rf "$_db"
  mariadb-install-db --no-defaults --datadir="$_db/data" --auth-root-authentication-method=normal \
    --skip-test-db >/dev/null
  mariadbd --no-defaults --datadir="$_db/data" --socket="$_db/socket" --skip-networking \
    --pid-file="$_db/pid" --log-error="$_db/error.log" &
  # Its PID to wait for: a bare wait would also wait for the tee of makepkg's log, forever
  local _pid=$! _status=0
  _check_with_mariadb "$_db/socket" || _status=$?
  kill "$_pid"
  wait "$_pid" || true
  return "$_status"
}

_check_with_mariadb() {
  local _socket=$1 _i
  for _i in {1..30}; do
    mariadb-admin --no-defaults --socket="$_socket" -uroot ping &>/dev/null && break
    sleep 1
  done
  mariadb --no-defaults --socket="$_socket" -uroot -e "
    CREATE USER 'sourcebans'@'localhost' IDENTIFIED BY 'sourcebans';
    GRANT ALL ON *.* TO 'sourcebans'@'localhost';
    CREATE DATABASE sourcebans CHARACTER SET utf8mb4;" || return

  printf 'pdo_mysql.default_socket=%s\n' "$_socket" >>"$srcdir/php/extensions.ini"
  # Without testGitDescribeLeavesTripletAsDevWhenNotExactSemver, which expects git describe of a
  # development checkout, not of the release tag the package is built from
  # (https://github.com/sbpp/sourcebans-pp/issues/1613)
  DB_HOST=localhost includes/vendor/bin/phpunit \
    --exclude-filter testGitDescribeLeavesTripletAsDevWhenNotExactSemver || return

  # sourcebans-pp setup on an empty database, then again and upgrade, which only check the version;
  # the admin it creates
  local _cli=(env SBPP_PANEL_ROOT="$srcdir/test/web" SBPP_SETUP_DIR="$srcdir/test/web"
    SBPP_CONFIG_PATH="$srcdir/config.php" php "$srcdir/sourcebans-pp.php")
  rm -f "$srcdir/config.php"
  DB_HOST=localhost DB_PASS=sourcebans INITIAL_ADMIN_NAME=admin INITIAL_ADMIN_STEAM=STEAM_1:0:1234 \
    INITIAL_ADMIN_EMAIL=admin@example.com INITIAL_ADMIN_PASSWORD=password1234 \
    "${_cli[@]}" setup </dev/null >"$srcdir/databases.cfg" || return
  "${_cli[@]}" setup </dev/null || return
  "${_cli[@]}" upgrade || return
  grep -q '"pass"     "sourcebans"' "$srcdir/databases.cfg" || return
  [[ $(mariadb --no-defaults --socket="$_socket" -uroot -N -e \
    "SELECT authid, extraflags FROM sourcebans.sb_admins WHERE user = 'admin'") == $'STEAM_0:0:1234\t16777216' ]]
}

package_sourcebans-pp() {
  pkgdesc="SourceBans++, the admin, ban and communication management of SourceMod game servers (web panel)"
  # The panel (Elastic License 2.0), LightOpenID (MIT) and the PHP libraries: MIT, BSD 3-clause
  # (nette's under BSD or GPL), Apache 2.0 (maxmind-db/reader), LGPL 3.0 (Smarty), LGPL 2.1
  # (xpaw/php-source-query-class)
  license=(Elastic-2.0 MIT BSD-3-Clause Apache-2.0 LGPL-3.0-or-later LGPL-2.1-only)
  # pdo_mysql (in php) and sodium, enabled in php.ini
  depends=(php php-sodium)
  optdepends=(
    'mariadb: the database server'
    'php-fpm: a web server with PHP-FPM, like nginx'
    'geoipupdate: the GeoLite2 Country database of the country flags'
  )
  install=sourcebans-pp.install

  local _name=${FUNCNAME[0]#package_} _src="$srcdir/$pkgbase"
  local _webroot="$pkgdir/usr/share/webapps/$_name"
  local _state="$pkgdir/var/lib/$_name"

  # The panel in /usr/share/webapps, without its tests and development files, the install wizard and
  # the updater, which the panel refuses to run next to: they're sourcebans-pp's, outside the web root
  install -d "$_webroot" "$pkgdir/usr/share/$_name"
  cp -r --no-preserve=ownership "$_src"/web/. "$_webroot/"
  rm -r "${_webroot:?}"/{tests,phpstan,bin,demos} \
    "$_webroot"/{phpstan*.neon,phpstan*.php,phpunit.xml,package.json,package-lock.json} \
    "$_webroot"/{composer.json,composer.lock,config.php.template}
  mv "$_webroot"/{install,updater} "$pkgdir/usr/share/$_name/"
  install -Dm755 "$srcdir/sourcebans-pp.php" "$pkgdir/usr/bin/sourcebans-pp"

  # What the panel writes, in /var/lib for the web server (http): its caches, compiled templates,
  # uploaded demos, and the map images and game icons, which admins upload next to the shipped ones
  install -d -o 33 -g 33 -m750 "$_state"/{cache,templates_c,demos}
  install -d "$_state/images"
  local _dir
  for _dir in images/maps images/games; do
    mv "$_webroot/$_dir" "$_state/$_dir"
    chown 33:33 "$_state/$_dir"
    ln -s "/var/lib/$_name/$_dir" "$_webroot/$_dir"
  done
  for _dir in cache templates_c demos; do
    ln -s "/var/lib/$_name/$_dir" "$_webroot/$_dir"
  done
  # The configuration sourcebans-pp setup writes, readable by the web server; geoipupdate's GeoLite2
  # Country database, which the panel skips while it doesn't exist
  install -d -g 33 -m750 "$pkgdir/etc/webapps/$_name"
  ln -s "/etc/webapps/$_name/config.php" "$_webroot/config.php"
  ln -s /var/lib/GeoIP/GeoLite2-Country.mmdb "$_webroot/data/GeoLite2-Country.mmdb"

  install -Dm644 "$srcdir/nginx.conf.example" -t "$pkgdir/usr/share/doc/$_name"
  local _licenses="$pkgdir/usr/share/licenses/$_name"
  install -Dm644 "$_src"/{LICENSE.txt,THIRD-PARTY-NOTICES.txt} -t "$_licenses"
  local _license
  for _license in "$_src"/web/includes/vendor/*/*/LICENSE*; do
    _dir=${_license#"$_src"/web/includes/vendor/}
    install -Dm644 "$_license" "$_licenses/vendor/$_dir"
  done
}

package_sourcemod-sourcebans-pp() {
  pkgdesc="SourceBans++, the admin, ban and communication management of SourceMod game servers (SourceMod plugins)"
  # The plugins: GPL 3.0, sbpp_comms (from SourceComms) GPL 3.0 or later
  license=(GPL-3.0-only GPL-3.0-or-later)
  depends=(sourcemod)
  optdepends=('sourcemod-sourcebans-pp-discord-forward: for bans, comms and reports forwarded to Discord')

  local _name=${FUNCNAME[0]#package_} _src="$srcdir/$pkgbase/game/addons/sourcemod"
  # In the addons folder of sourcemod: the plugins, their configuration and translations, as in
  # upstream's package; their include files for other plugins with SourceMod's
  local _sm="$pkgdir/usr/lib/sourcemod/addons/sourcemod"
  install -Dm644 "$_src"/plugins/*.smx -t "$_sm/plugins"
  install -Dm644 "$_src"/configs/sourcebans/* -t "$_sm/configs/sourcebans"
  install -Dm644 "$_src"/translations/* -t "$_sm/translations"
  install -Dm644 "$_src"/scripting/include/*.inc -t "$_sm/scripting/include"

  install -Dm644 "$srcdir/$pkgbase/LICENSE-plugins.txt" "$pkgdir/usr/share/licenses/$_name/LICENSE.txt"
  install -Dm644 "$srcdir/$pkgbase/THIRD-PARTY-NOTICES.txt" -t "$pkgdir/usr/share/licenses/$_name"
}
