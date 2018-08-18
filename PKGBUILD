# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=pref-git
pkgver=r575.5761543
pkgrel=1
url='https://pref.github.io/'
arch=('i686' 'x86_64')
pkgdesc='Portable Reverse Engineering Framework'
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
conflicts=(pref)
provides=(pref)
source=(
    'git+https://github.com/PREF/PREF.git'
    'git+https://github.com/PREF/PrefLib.git'
    'git+https://github.com/Dax89/QHexEdit.git'
    'git+https://github.com/PREF/BTVM.git'
    )
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd PREF
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd PREF
    git submodule init
    git config submodule.PrefLib.url "$srcdir/PrefLib"
    git config submodule.PREF/QHexEdit.url "$srcdir/QHexEdit"
    git submodule update
    pushd PrefLib
    git checkout master
    popd

    cd PrefLib
    git config submodule.bt.url "$srcdir/BTVM"
    git submodule update
}

build() {
    cd PREF
    qmake -r
    make
}

package() {
  cd PREF
  pushd PREF
  install -D -m755 PREF ${pkgdir}/usr/bin/PREF
  popd

  install -D -m644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
