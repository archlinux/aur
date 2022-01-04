# Maintainer: ltoenning <dev@ltoenning.de>
pkgname=ripes-git
pkgver=2.2.3
pkgrel=2
pkgdesc="A graphical processor simulator and assembly editor for the RISC-V ISA"
arch=('x86_64')
url="https://github.com/mortbopet/Ripes"
license=('MIT')
depends=('qt5-base' 'qt5-charts')
makedepends=('cmake' 'git')


source=("${pkgname}-${pkgver}::git+https://github.com/mortbopet/Ripes.git"
'VSRTL::git+https://github.com/mortbopet/VSRTL.git'
'ELFIO::git+https://github.com/serge1/ELFIO.git'
'libelfin::git+https://github.com/mortbopet/libelfin.git'
'cpp-mmaplib::git+https://github.com/yhirose/cpp-mmaplib.git'
'Signals::git+https://github.com/pbhogan/Signals.git'
'better-enums::git+https://github.com/mortbopet/better-enums.git'
'cereal::git+https://github.com/USCiLab/cereal.git'
)
sha256sums=('SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP')

prepare(){
    mkdir -p $srcdir/${pkgname}-${pkgver}/build
    cd $srcdir/${pkgname}-${pkgver}

    # Configure git submodules
    git submodule init
    git config submodule.external/ELFIO.url "$srcdir/ELFIO"
    git config submodule.external/VSRTL.url "$srcdir/VSRTL"
    git config submodule.external/libelfin.url "$srcdir/libelfin"
    git submodule update

    # Configure git submodules of VSRTL
    cd $srcdir/${pkgname}-${pkgver}/external/VSRTL
    git submodule init
    git config submodule.external/better-enums.url "$srcdir/better-enums"
    git config submodule.external/cereal.url "$srcdir/cereal"
    git config submodule.external/Signals.url "$srcdir/Signals"
    git submodule update

    # Configure git submodules of libelfin
    cd $srcdir/${pkgname}-${pkgver}/external/libelfin
    git submodule init
    git config submodule.external/cpp-mmaplib.url "$srcdir/cpp-mmaplib"
    git submodule update

}

build(){
    cd $srcdir/${pkgname}-${pkgver}/build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make -j $(nproc)
}

package(){
    sed -i 's/Exec=Ripes/Exec=ripes/g' "$srcdir/${pkgname}-${pkgver}/appdir/usr/share/applications/Ripes.desktop"
    install -Dm 755 "$srcdir/${pkgname}-${pkgver}/build/Ripes" "$pkgdir/usr/bin/ripes"
    install -Dm 644 "$srcdir/${pkgname}-${pkgver}/appdir/usr/share/applications/Ripes.desktop" "${pkgdir}/usr/share/applications/Ripes.desktop"
}
