# Maintainer: envolution

pkgname=wkhtmltopdf
pkgver=0.12.6
pkgrel=3
pkgdesc="Command line tools to render HTML into PDF and various image formats"
arch=('x86_64')
url="https://wkhtmltopdf.org/"
license=('LGPL-3.0-only')
depends=('qt5-webkit' 'qt5-svg' 'qt5-xmlpatterns' 'qt5-base' 'glibc' 'gcc-libs')
makedepends=('git')
optdepends=('xorg-server: wkhtmltopdf needs X or Xvfb to operate')
source=(
  "git+https://github.com/wkhtmltopdf/wkhtmltopdf.git#tag=$pkgver" #clone without signature
  disable_shared_lib.patch
)
sha256sums=('247abeeea1a58fbc0d897b1caddf4d974254d4c21c64141f9ca93ccf1b6f6818'
            '83b2eafdb08fc30b369ea94960abe205489f8187c5505fa7893fc6ab554112d3')
# The following key expired 2024-11-18 and has not been updated
#validpgpkeys=('76C0969C076A23EC4849F462D3E3E8ACF99DE8EA') # Ashish Kulkarni (Open Source) <ashish@kulkarni.dev>

prepare() {
  cd $pkgname
  patch -Np1 -i ../disable_shared_lib.patch
}
build() {
  cd $pkgname
  qmake-qt5 wkhtmltopdf.pro
  make
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir/usr" install

  # Generate and install man pages
  install -d "$pkgdir/usr/share/man/man1"
  LD_LIBRARY_PATH=bin ./bin/wkhtmltopdf --manpage \
    >"$pkgdir/usr/share/man/man1/wkhtmltopdf.1"
  LD_LIBRARY_PATH=bin ./bin/wkhtmltoimage --manpage \
    >"$pkgdir/usr/share/man/man1/wkhtmltoimage.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 AUTHORS CHANGELOG-OLD CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
