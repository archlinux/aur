# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Contributor: Lars Hagström <lars@foldspace.nu>
# Contributor: Nephyrin Zey <nephyrin@doublezen.net>
# Contributor: John Schoenick <john@pointysoftware.net>
# Contributor: Geoffrey Teale <tealeg@googlemail.com>
pkgname=google-breakpad-git
pkgver=r2032.afc8daa2
pkgrel=1
pkgdesc="An open-source multi-platform crash reporting system"
arch=('i686' 'x86_64' 'armv7h')
url="https://chromium.googlesource.com/breakpad/breakpad/"
license=('BSD')
makedepends=('git')
depends=('gcc-libs')
conflicts=('google-breakpad')
provides=('google-breakpad')
source=('git+https://chromium.googlesource.com/breakpad/breakpad'
        'git+https://chromium.googlesource.com/linux-syscall-support')
sha256sums=('SKIP'
            'SKIP')

prepare() {
  ln -sfT "$srcdir/linux-syscall-support" "breakpad/src/third_party/lss"
  cd "$srcdir/breakpad"
}

pkgver() {
  cd "$srcdir/breakpad"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/breakpad"

  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  cd "$srcdir/breakpad"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
