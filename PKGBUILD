# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: François M. <francois5537 @ gmail.com>

## Dynamically retrieve the download url
_manager_source=$(wget -o /dev/null http://www.manager.io/desktop/download/ -O - \
    | grep -o -P 'https://.*manager-accounting\.zip'
)

pkgname=manager-accounting
pkgver=$(echo "${_manager_source}" \
    | grep -o -P '[0-9]+\.[0-9]+\.[0-9]+'
)
pkgrel=1
pkgdesc='Manager is free accounting software for small business'
arch=('i686' 'x86_64')
license=('custom')
url="http://www.manager.io/"
depends=('mono' 'gtk-sharp-3')
makedepends=('unzip' 'wget' 'gcc')
install=manager-accounting.install
options=('!makeflags')
source=(
  "LICENSE"
  "${_manager_source}"
  "https://raw.githubusercontent.com/ericsink/SQLitePCL.raw/02ae6a75ba254fe1f6bf27495545b5eac79456ac/sqlite3/sqlite3.c"
)
sha256sums=(
  'bd144763506372341487683b0f28ad627e7e8923ea8ef8569541b55f4b987061'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$srcdir"

  # Check checksum
  chksum=($(sed '15q;d' "${pkgname}_${pkgver}.dsc"))
  filesum=($(sha256sum "${pkgname}_${pkgver}.tar.xz"))
  if [ $chksum != $filesum  ]; then
      error "Checksums not matching"
      exit
  fi

  # Extract, patch
  tar --strip-components=1 -Jxvf "${pkgname}_${pkgver}.tar.xz"

  sed -i \
    's|/usr/bin/cli|/usr/bin/mono|g' \
    opt/manager-accounting/manager-accounting

  sed -i \
    's|/opt/|/usr/lib/|g' \
    opt/manager-accounting/manager-accounting

  sed -i \
    's|/opt/|/usr/lib/|g' \
    usr/share/applications/manager-accounting.desktop

  # Extract libe_sqlite.so by executing ManagerServer.exe
  # on port 1 to fail on purpose.
  # ref: https://forum.manager.io/t/manager-does-not-start-after-recent-update-on-ubuntu/7950/19
  #cd "$srcdir/opt/manager-accounting"
  #mono ManagerServer.exe -port 1 2>&1 > /dev/null
}

build() {
  gcc -shared -fPIC -O3 -DNDEBUG -DSQLITE_DEFAULT_FOREIGN_KEYS=1 \
      -DSQLITE_ENABLE_FTS3_PARENTHESIS -DSQLITE_ENABLE_FTS4 \
      -DSQLITE_ENABLE_COLUMN_METADATA -DSQLITE_ENABLE_JSON1 \
      -DSQLITE_ENABLE_RTREE \
      -o libe_sqlite3.so sqlite3.c
}

package() {
  install -d $pkgdir/usr/{bin,lib,share/{applications,icons}}
  cp -r opt/manager-accounting $pkgdir/usr/lib/
  cp -r usr/share/icons/* $pkgdir/usr/share/icons/
  cp libe_sqlite3.so "${pkgdir}/usr/lib/${pkgname}/"
  ln -s /usr/lib/manager-accounting/manager-accounting $pkgdir/usr/bin/manager-accounting
  install -m644 usr/share/applications/$pkgname.desktop $pkgdir/usr/share/applications/
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
