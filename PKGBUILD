#!/hint/bash
# Maintainer : bartus <arch-user-repository{at}bartus.33mail.com>
# Contributor : Lars Hagström <lars@foldspace.nu>
# Contributor : Nephyrin Zey <nephyrin@doublezen.net>
# Contributor : John Schoenick <john@pointysoftware.net>
# Contributor : Geoffrey Teale <tealeg@googlemail.com>

pkgname=breakpad
pkgver=r1846.2757a2c9
pkgrel=1
pkgdesc="An open-source multi-platform crash reporting system"
arch=('i686' 'x86_64' 'armv7h')
url="https://chromium.googlesource.com/breakpad/breakpad/"
license=('BSD')
makedepends=('git')
depends=('gcc-libs')
options=('staticlibs' '!strip')
conflicts=('google-breakpad-git')
provides=('google-breakpad')
source=('git+https://chromium.googlesource.com/breakpad/breakpad'
        'git+https://chromium.googlesource.com/linux-syscall-support')
sha256sums=('SKIP'
            'SKIP')

prepare() {
  ln -sfT "${srcdir}/linux-syscall-support" "$pkgname/src/third_party/lss"
}

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"

  echo "Configuring"
  autoreconf
  ./configure --prefix=/usr
  echo "Building"
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
