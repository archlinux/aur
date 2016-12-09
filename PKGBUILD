# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: François M. <francois5537 @ gmail.com>

pkgname=manager-accounting
pkgver=16.12.31
pkgrel=1
pkgdesc='Manager is free accounting software for small business'
arch=('i686' 'x86_64')
license=('custom')
url="http://www.manager.io/"
depends=('mono' 'gtk2' 'gtk-sharp-2' 'webkit-sharp')
makedepends=('unzip')
install=manager-accounting.install
options=('!makeflags')
source=(
  "LICENSE"
  "fix-path.patch"
  "https://mngr.s3.amazonaws.com/manager-accounting.zip"
)
sha256sums=(
  'bd144763506372341487683b0f28ad627e7e8923ea8ef8569541b55f4b987061'
  '81e73bbae1a386dc76bd1f8b018868864c802cb242667d18b9d6f005518859f7'
  'SKIP'
)

pkgver() {
  cd "$srcdir"
  echo $(ls *.dsc | egrep -o '[0-9]+\.[0-9]+\.[0-9]+')
}

prepare() {
  cd "$srcdir"

  # Get current version of application
  _pkgver=$(ls *.dsc | egrep -o '[0-9]+\.[0-9]+\.[0-9]+')

  # Check checksum
  chksum=($(sed '15q;d' "${pkgname}_${_pkgver}.dsc"))
  filesum=($(sha256sum "${pkgname}_${_pkgver}.tar.gz"))
  if [ $chksum != $filesum  ]; then
      error "Checksums not matching"
      exit
  fi

  # Extract, patch
  tar --strip-components=1 -zxvf "${pkgname}_${_pkgver}.tar.gz"
  patch -p1 -i fix-path.patch

  # Extract libe_sqlite.so by executing ManagerServer.exe
  # on port 1 to fail on purpose.
  cd "$srcdir/opt/manager-accounting"
  mono ManagerServer.exe -port 1 2>&1 > /dev/null
}

package() {
  install -d $pkgdir/usr/{bin,lib,share/{applications,icons}}
  cp -r opt/manager-accounting $pkgdir/usr/lib/
  cp -r usr/share/icons/* $pkgdir/usr/share/icons/
  ln -s /usr/lib/manager-accounting/manager-accounting $pkgdir/usr/bin/manager-accounting
  install -m644 usr/share/applications/$pkgname.desktop $pkgdir/usr/share/applications/
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
