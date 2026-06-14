# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Contributor: Lars Hagström <lars@foldspace.nu>
# Contributor: Nephyrin Zey <nephyrin@doublezen.net>
# Contributor: John Schoenick <john@pointysoftware.net>
# Contributor: Geoffrey Teale <tealeg@googlemail.com>
pkgname=google-breakpad-git
pkgver=r2275.5359c233
pkgrel=1
pkgdesc="An open-source multi-platform crash reporting system"
arch=('i686' 'x86_64' 'armv7h')
url="https://chromium.googlesource.com/breakpad/breakpad/"
license=('BSD')
makedepends=('git')
depends=('gcc-libs')
conflicts=('google-breakpad')
provides=('google-breakpad')
source=("git+https://chromium.googlesource.com/breakpad/breakpad"
        "git+https://chromium.googlesource.com/linux-syscall-support"
        "git+https://github.com/google/googletest")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/breakpad"

  git submodule init
  git config submodule.src/third_party/lss.url "$srcdir/linux-syscall-support"
  git config submodule.src/testing.url "$srcdir/googletest"
  git -c protocol.file.allow=always submodule update
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
