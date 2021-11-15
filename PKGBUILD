# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: David Cao <dcao@protonmail.com>

pkgname=timew-git
pkgver=r2971.77d4728a
pkgrel=1
pkgdesc="A command-line time tracker (also known as timewarrior)"
arch=('i686' 'x86_64')
url="https://github.com/GothenburgBitFactory/timewarrior"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git')
optdepends=('task: Taskwarrior integration'
            'asciidoctor: Man page generation during compilation')
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
