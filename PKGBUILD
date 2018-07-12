# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=redasm-git
pkgver=r474.e08b300
pkgrel=1
url='https://github.com/REDasmOrg/REDasm'
arch=('i686' 'x86_64')
pkgdesc='Portable Reverse Engineering Framework'
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
conflicts=(redasm)
provides=(redasm)
source=(
    'git+https://github.com/REDasmOrg/REDasm.git'
    'git+https://github.com/Dax89/QHexEdit.git'
    'git+https://github.com/aquynh/capstone.git'
    )
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd REDasm
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd REDasm
    git submodule init
    git config submodule.widgets/QHexEdit.url "$srcdir/QHexEdit"
    git config submodule.depends/capstone.url "$srcdir/capstone"
    git submodule update
}

build() {
    cd REDasm
    qmake -r
    make
}

package() {
    cd REDasm
    install -D -m755 REDasm ${pkgdir}/usr/bin/REDasm

    install -D -m644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
