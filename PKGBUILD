# Maintainer: David Cao <dcao@protonmail.com>
pkgname=timew-git
pkgver=r1752.bce2a58
pkgrel=1
pkgdesc="A command-line time tracker (also known as timewarrior)"
arch=('i686' 'x86_64')
url="https://taskwarrior.org/docs/timewarrior/index.html"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git')
source=('git+https://git.tasktools.org/scm/tm/timew.git'
        'git+https://git.tasktools.org/scm/tm/libshared.git')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config submodule.src/libshared.url "${srcdir}/libshared"
  git submodule update src/libshared
}

build() {
  cd "${pkgname%-git}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="${pkgdir}/" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
