# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=smooth-git
pkgver=0.9.10.r59.g65e9aee
pkgrel=2
pkgdesc="An object oriented C++ class library"
arch=('x86_64')
url="http://www.smooth-project.org"
license=('Artistic-2.0')
depends=(
  'bzip2'
  'curl'
  'fribidi'
  'gtk3'
  'libcpuid'
  'libjpeg-turbo'
  'libpng'
  'libxml2'
)
makedepends=('git')
provides=("${pkgname%-git}" 'libsmooth-0.9.so=0')
conflicts=("${pkgname%-git}")
source=('git+https://github.com/enzo1982/smooth.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  find . -type f -exec sed -i 's|/usr/local|/usr|g' {} \;
}

build() {
  cd "${pkgname%-git}"
  make config=systemlibcpuid
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install

  ln -sv "/usr/lib/libsmooth-${pkgver%.*.r*}.so.0" "${pkgdir}/usr/lib/libsmooth.so"
}
