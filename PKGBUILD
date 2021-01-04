# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=redasm-git
pkgver=r1590.8526bfd
pkgrel=1
url='https://github.com/REDasmOrg/REDasm'
arch=('i686' 'x86_64')
pkgdesc='The OpenSource Disassembler'
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
conflicts=(redasm)
provides=(redasm)

# TODO: see if we can use system libraries
source=(
    'git+https://github.com/REDasmOrg/REDasm.git'

    'git+https://github.com/REDasmOrg/REDasm-Library.git'
    'git+https://github.com/REDasmOrg/REDasm-Plugins.git'
    'git+https://github.com/REDasmOrg/REDasm-Loaders.git'
    'git+https://github.com/REDasmOrg/REDasm-Assemblers.git'

    'git+https://github.com/Dax89/QHexView.git'

    'git+https://github.com/aquynh/capstone.git'

    'git+https://github.com/taocpp/json.git'
    'git+https://github.com/taocpp/PEGTL.git'

    'git+https://github.com/zyantific/zydis.git'
    'git+https://github.com/zyantific/zycore-c.git'
    )

md5sums=(
    'SKIP'

    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'

    'SKIP'

    'SKIP'

    'SKIP'
    'SKIP'

    'SKIP'
    'SKIP'
)

pkgver() {
  cd REDasm
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd REDasm
    git submodule init
    git config submodule.LibREDasm.url "$srcdir/REDasm-Library"
    git config submodule.QHexView.url "$srcdir/QHexView"
    git config submodule.submodules/plugins.url "$srcdir/REDasm-Plugins"
    git config submodule.submodules/loaders.url "$srcdir/REDasm-Loaders"
    git config submodule.submodules/assemblers.url "$srcdir/REDasm-Assemblers"
    git submodule update

    cd LibREDasm
    git submodule init
    git config submodule.depends/capstone.url "$srcdir/capstone"
    git config submodule.rdcore/libs/taojson.url "$srcdir/json"
    git submodule update

    cd rdcore/libs/taojson
    git submodule init
    git config submodule.external/PEGTL.url "$srcdir/PEGTL"
    git submodule update

    cd "$srcdir"/REDasm/submodules/assemblers
    git submodule init
    git config submodule.x86/zydis.url "$srcdir/zydis"
    git submodule update

    cd x86/zydis
    git submodule init
    git config submodule.dependencies/zycore.url "$srcdir/zycore-c"
    git submodule update
}

build() {
    mkdir -p build
    cd build
    cmake ../REDasm -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    pushd build
    install -D -m755 REDasm ${pkgdir}/usr/bin/REDasm
    install -D -m755 LibREDasm.so ${pkgdir}/usr/lib/LibREDasm.so
    popd

    cd REDasm
    install -D -m644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
