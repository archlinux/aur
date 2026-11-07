# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgbase=sourcebans-pp
pkgname=(sourcebans-pp sourcemod-sourcebans-pp)
pkgver=2.2.3
pkgrel=5
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
  nginx.conf.example
  composer-exclude-legacy-classes.patch
  plugin-validate-steamid.patch
  tests-offline-release-check.patch)
sha512sums=('9758c463719adfe1c3115f06026da6034a771814c5c8948547fdb228d86db29ad945b1131b555a35f1446210c8880663cd986d2b4a3f1f14152624344d6c1f85'
  '2dbfac1a24bc5ca0f17e105a7966182dae8015af86af59d7b2f2839a51f9882de93f353adc7c9385d74c06d28d110bb83ac1689eec2db31260fcd069a5eb21ed'
  '227373db3705b82b2c44d2d2a0ed7916e35d3c40c2381ee67d0397e23bc1ff4796b6d049aeb6674c0e1e7b9323222e74c0fd90639ea8d6899a58932b05682b19'
  '53f2f3f84c5979e391e5e609d991045f356d5a2d26009b882c7143fdb8a1fd8f161f6717d35286471f5ecf61b9bf4dddb08d8f2ea3031e350aca93881183d12e'
  '177e222aeabdcf237bd4cabb55da15a726e5be5fc1b48dbec5b0473202035e4ce55008dac18528a063cf7d09e0d1eb9126475ab0947783b7cb9a0d4090281ee0'
  '08c22d32e26c00cd12038f8ffe869afaa373ef0128fa81627a66c2462629bdc6a3b07d3dba04119ed7e81b7b9f546c3bb71f5412bfe07c8767daacb9ccf59ea4')
b2sums=('9e69911b790cc681f7b7a8790de16fd2a2bd092369b556eb8a5dd98149601fbbcc56604992291380528c7f4683d35d354603ea6e8e0d3e227a07a938a5efce05'
  '517f2f72a01572cd07a1f3af97ddb187eee40834a17658e4ca9a9c83f65cc759327dfb406e21f677e733ce312e03f63713d28778c1e846ded899847f16d589a0'
  '03f7ce234493a51c3be8b3b5f5b35a287ccbc36f6fbda5b12fabc8bb5608221d9bedc31e291c1838dd4d92c8cf9a2c6df43b357e86313f75c82c20343af1d054'
  'c80c9c71dfa20c439a2019e757dce866d836a0c67ca6ff945975ac647d816191e1305ae7d3e60925671280b503eb3ea0a1d8c5f4ec7270e547e3bfc0fe98c0af'
  '0a7098758e232efbc12de03502b8a2da0d8db751797b9f305477b4e4740f8b15620d31174f07e2a02ceedb1ae967f0f4b26867eb59ae878803e5f0091426f218'
  '640fb9b32069140444381159ab87f63b2750812351184d9cb4b36ed562909ea02726d3272645d94511145b29ea0b649e09378a095ed94c6eb6dc15bc7a54a4d2')

prepare() {
  cd "$pkgbase" || exit

  # The version of the plugins (their include file) and of the panel (configs/version.json), as
  # upstream's release workflow sets them
  SBPP_RELEASE_VERSION="$pkgver" bash game/addons/sourcemod/scripting/scripts/resolve-plugin-version.sh
  printf '{\n    "version": "%s",\n    "git": "%s",\n    "dev": false\n}\n' \
    "$pkgver" "$(git rev-parse --short HEAD)" >web/configs/version.json

  # Nothing prebuilt: TinyMCE 5.4.2, which nothing loads since the dashboard text's editor was
  # replaced by Markdown (#1113; removed upstream by https://github.com/sbpp/sourcebans-pp/pull/1620),
  # and the GeoLite2 Country database, geoipupdate's instead
  rm -r web/includes/tinymce
  rm web/data/GeoLite2-Country.mmdb

  # The legacy global classes of includes/ out of the PSR-4 classmap, which the optimised autoloader
  # warned about (https://github.com/sbpp/sourcebans-pp/pull/1621)
  patch -Np1 -i "$srcdir/composer-exclude-legacy-classes.patch"

  # sm_addban and sm_unban check SteamIDs and find bans of either universe, so that sm_unban
  # STEAM_1:0:Z lifts a ban the panel stored as STEAM_0:0:Z, and every duplicate
  # (https://github.com/sbpp/sourcebans-pp/pull/1623)
  patch -Np1 -i "$srcdir/plugin-validate-steamid.patch"

  # The tests' release check against a refused port rather than api.github.com, which check() can't
  # reach (https://github.com/sbpp/sourcebans-pp/pull/1624)
  patch -Np1 -i "$srcdir/tests-offline-release-check.patch"

  # maxmind-db/reader 1.14.0 instead of the lock's 1.13.1: its decoder limits the time and memory a
  # lookup can take, which a crafted database could make exponential. Upstream's Dependabot has the
  # update (https://github.com/sbpp/sourcebans-pp/pull/1586): drop this once a release includes it.
  COMPOSER_HOME="$srcdir/composer" php -d extension=iconv -d extension=sodium /usr/bin/composer \
    update --working-dir=web --no-install --no-interaction --no-progress maxmind-db/reader \
    --with maxmind-db/reader:1.14.0

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
  # sets up one like an install. In /dev/shm, a tmpfs: the tests empty the tables before almost every
  # test, and each TRUNCATE replaces the table's file, which a disk syncs (about 2 seconds a reset on
  # btrfs, with or without copy-on-write, 30 milliseconds on a tmpfs)
  local _db
  _db=$(mktemp -d /dev/shm/sourcebans-pp-check.XXXXXX)
  mariadb-install-db --no-defaults --datadir="$_db/data" --auth-root-authentication-method=normal \
    --skip-test-db >/dev/null
  mariadbd --no-defaults --datadir="$_db/data" --socket="$_db/socket" --skip-networking \
    --pid-file="$_db/pid" --log-error="$_db/error.log" &
  # Its PID to wait for: a bare wait would also wait for the tee of makepkg's log, forever
  local _pid=$! _status=0
  _check_with_mariadb "$_db/socket" || _status=$?
  kill "$_pid"
  wait "$_pid" || true
  rm -rf "$_db"
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
  rm -r "${_webroot:?}"/{tests,phpstan,bin,demos,includes/PHPStan} \
    "$_webroot"/{.gitignore,phpstan*.neon,phpstan*.php,phpunit.xml,package.json,package-lock.json}
  # Nor what the libraries ship besides their code and licences: documentation, tests, examples, the
  # configuration of their development tools, the source of maxmind-db/reader's C extension (which
  # upstream ships on purpose, for packagers building it from the archive). Then the autoloader is
  # generated again, so it doesn't list the removed classes
  find "$_webroot/includes/vendor" -mindepth 3 -maxdepth 3 ! -iname 'license*' \( -name '.*' \
    -o -iname '*.md' -o -name '*.txt' -o -name '*.xml' -o -name '*.dist' -o -name '*.dist.php' \
    -o -name '*.neon' -o -name '*.yml' -o -name '*.sh' -o -name Makefile -o -name 'composer.*' \
    -o -iname test -o -iname tests -o -iname examples -o -name docs -o -name guides -o -name demo \
    -o -name changelog -o -path '*/maxmind-db/reader/ext' \) -exec rm -r {} +
  COMPOSER_HOME="$srcdir/composer" composer dump-autoload --working-dir="$_webroot" --no-dev \
    --optimize --no-scripts --no-interaction
  rm "$_webroot"/{composer.json,composer.lock,config.php.template}
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
  # upstream's package; their sources and include files with SourceMod's, like its own plugins'
  local _sm="$pkgdir/usr/lib/sourcemod/addons/sourcemod"
  install -Dm644 "$_src"/plugins/*.smx -t "$_sm/plugins"
  install -Dm644 "$_src"/configs/sourcebans/* -t "$_sm/configs/sourcebans"
  install -Dm644 "$_src"/translations/* -t "$_sm/translations"
  install -Dm644 "$_src"/scripting/*.sp -t "$_sm/scripting"
  install -Dm644 "$_src"/scripting/sbpp_admcfg/*.sp -t "$_sm/scripting/sbpp_admcfg"
  install -Dm644 "$_src"/scripting/include/*.inc -t "$_sm/scripting/include"

  install -Dm644 "$srcdir/$pkgbase/LICENSE-plugins.txt" "$pkgdir/usr/share/licenses/$_name/LICENSE.txt"
  install -Dm644 "$srcdir/$pkgbase/THIRD-PARTY-NOTICES.txt" -t "$pkgdir/usr/share/licenses/$_name"
}
