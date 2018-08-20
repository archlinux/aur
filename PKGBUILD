# Maintainer: David Cao <dcao@protonmail.com>
pkgname=timew-git
pkgver=r2331.8cc00ee
pkgrel=1
pkgdesc="A command-line time tracker (also known as timewarrior)"
arch=('i686' 'x86_64')
url="https://taskwarrior.org/docs/timewarrior/index.html"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git')
optdepends=('task: Taskwarrior integration')
provides=('timew')
conflicts=('timew')

install=timew-git.install
source=('git+https://github.com/GothenburgBitFactory/timewarrior'
        'git+https://github.com/GothenburgBitFactory/libshared.git')
        md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "timewarrior"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "timewarrior"
  git submodule init
  git config submodule.src/libshared.url "${srcdir}/libshared"
  git submodule update src/libshared

  patch -p1 -i "${srcdir}/timew-refresh-python2.patch"
  patch -p1 -i "${srcdir}/on-modify-python2.patch"

  cp "${srcdir}/timewarrior/ext/on-modify.timewarrior" "${srcdir}"
}

build() {
  cd "timewarrior"
  cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "timewarrior"
  make DESTDIR="${pkgdir}/" install

  install -Dm644 "${srcdir}/on-modify.timewarrior" \
    "${pkgdir}/usr/share/doc/timew/on-modify.timewarrior"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
