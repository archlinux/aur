# Maintainer: Lars Hagström <lars@foldspace.nu>
# Contributor: Nephyrin Zey <nephyrin@doublezen.net>
# Contributor: John Schoenick <john@pointysoftware.net>
# Contributor: Geoffrey Teale <tealeg@googlemail.com>
_pkgname=breakpad
pkgname=google-${_pkgname}-git
pkgver=r1844.2ffe1163
pkgrel=1
pkgdesc="An open-source multi-platform crash reporting system"
arch=('i686' 'x86_64' 'armv7h')
url="https://chromium.googlesource.com/breakpad/breakpad/"
license=('BSD')
makedepends=('git')
depends=('gcc-libs')
options=('staticlibs' '!strip')
conflicts=('google-breakpad-svn')
source=('git+https://chromium.googlesource.com/breakpad/breakpad'
        'git+https://chromium.googlesource.com/linux-syscall-support')
md5sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir/${_pkgname}"
  ln -sT "${srcdir}/linux-syscall-support" "src/third_party/lss" || true # Don't fail if it exists
}

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"

  echo "Configuring"
  autoreconf
  ./configure --prefix=/usr
  echo "Building"
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
