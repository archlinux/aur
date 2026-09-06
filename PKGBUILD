# Maintainer: Assaf Sapir <assaf AT sapir.io>
pkgname=tar1090-git
pkgver=3.14.1820.r2377.g115e40e
pkgrel=1
pkgdesc="Web interface for readsb / dump1090-fa with track history, heatmap, range outline and aircraft database"
arch=('any')
url="https://github.com/wiedehopf/tar1090"
license=('GPL-2.0-or-later')
depends=('bash' 'gzip' 'jq' 'dump1090')
makedepends=('git')
optdepends=('wget: UAT/978 and planefinder data fetch (ENABLE_978, PF_ENABLE)'
            'lighttpd: serve the web interface'
            'nginx: serve the web interface')
backup=('etc/default/tar1090' 'etc/lighttpd/conf.d/tar1090.conf')
install=tar1090.install
source=("tar1090::git+https://github.com/wiedehopf/tar1090.git"
        "tar1090-db::git+https://github.com/wiedehopf/tar1090-db.git"
        'tar1090.sysusers')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

# where dump1090 writes aircraft.json; baked into the web server snippets, the service reads it from /etc/default/tar1090
_srcdir=/run/dump1090
_share=/usr/share/tar1090

pkgver() {
  cd tar1090
  printf '%s.r%s.g%s' "$(cat version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  # mirrors what upstream install.sh does to the html directory
  local dbver ver
  dbver=$(git -C tar1090-db rev-parse --short=7 HEAD)
  ver=$(cat tar1090/version)
  rm -rf html
  cp -r tar1090/html html
  cp -r tar1090-db/db "html/db-$dbver"
  sed -i -e "s/let databaseFolder = .*;/let databaseFolder = \"db-$dbver\";/" \
         -e "s/id=\"webinterface_version\">/&($ver)/" html/index.html
  echo "{ \"tar1090Version\": \"$ver\", \"databaseVersion\": \"$dbver\" }" > html/version.json
  (cd html && bash "$srcdir/tar1090/cachebust.sh" "$srcdir/tar1090/cachebust.list" "$srcdir/html")

  # fill upstream's placeholders
  local subst=(-e "s?/usr/local/share/tar1090?$_share?g" -e "s?SOURCE_DIR?$_srcdir?g" -e "s/SERVICE/tar1090/g" -e "s?HTMLPATH?$_share/html?g")
  sed "${subst[@]}" -e 's/INSTANCE/tar1090/g' \
      -e 's/compress.filetype/deflate.mimetypes/' -e 's/^\([^#]*deflate.mimetypes\)/#\1/' \
      tar1090/88-tar1090.conf > lighttpd-tar1090.conf
  sed "${subst[@]}" -e 's/INSTANCE/tar1090/g' tar1090/nginx.conf > nginx-tar1090.conf
  sed "${subst[@]}" -e 's?ExecStart=.* /run/tar1090 .*?ExecStart='"$_share"'/tar1090.sh /run/tar1090 ${SOURCE_DIR}?' \
      -e 's/^After=dump1090-fa.service/After=dump1090.service/' tar1090/tar1090.service > tar1090.service
  { printf '# Directory where dump1090 writes aircraft.json\nSOURCE_DIR=%s\n\n' "$_srcdir"; cat tar1090/default; } > default
}

package() {
  install -d "$pkgdir$_share"
  cp -r html "$pkgdir$_share/html"
  install -m755 tar1090/tar1090.sh "$pkgdir$_share/"
  install -m644 tar1090/default "$pkgdir$_share/example_config_dont_edit"
  install -m644 tar1090/html/config.js "$pkgdir$_share/example_config.js"
  install -Dm644 default "$pkgdir/etc/default/tar1090"
  install -Dm644 tar1090.service "$pkgdir/usr/lib/systemd/system/tar1090.service"
  install -Dm644 tar1090.sysusers "$pkgdir/usr/lib/sysusers.d/tar1090.conf"
  install -Dm644 lighttpd-tar1090.conf "$pkgdir/etc/lighttpd/conf.d/tar1090.conf"
  install -Dm644 nginx-tar1090.conf "$pkgdir/usr/share/doc/tar1090/nginx-tar1090.conf"
  install -Dm644 tar1090/README.md "$pkgdir/usr/share/doc/tar1090/README.md"
  install -Dm644 tar1090/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
