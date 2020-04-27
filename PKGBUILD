# Maintainer: ltoenning <dev@ltoenning.de>
pkgname=ripes-git
pkgver=2.0.0
pkgrel=3
pkgdesc="A graphical processor simulator and assembly editor for the RISC-V ISA"
arch=('x86_64')
url="https://github.com/mortbopet/Ripes"
license=('MIT')
depends=('qt5-base' 'qt5-charts')
makedepends=('cmake' 'git')


source=("${pkgname}-${pkgver}::git+https://github.com/mortbopet/Ripes.git"
'git+https://github.com/mortbopet/VSRTL.git'
'ELFIO::git+https://github.com/serge1/ELFIO.git'
'git+https://github.com/pbhogan/Signals.git'
'better-enums::git+https://github.com/mortbopet/better-enums.git'
'cereal::git+https://github.com/USCiLab/cereal.git'
)
sha256sums=('SKIP' 
'SKIP' 
'SKIP' 
'SKIP' 
'SKIP'
'SKIP')

prepare(){
    cp -r $srcdir/VSRTL/* $srcdir/${pkgname}-${pkgver}/external/VSRTL
    cp -r $srcdir/ELFIO/* $srcdir/${pkgname}-${pkgver}/external/ELFIO

    cp -r $srcdir/better-enums/* $srcdir/${pkgname}-${pkgver}/external/VSRTL/external/better-enums
    cp -r $srcdir/cereal/* $srcdir/${pkgname}-${pkgver}/external/VSRTL/external/cereal
    cp -r $srcdir/Signals/* $srcdir/${pkgname}-${pkgver}/external/VSRTL/external/Signals
}

build(){
    cd $srcdir/${pkgname}-${pkgver}
    cmake -DCMAKE_BUILD_TYPE=Release
    make -j $(nproc)
}

package(){
    sed -i 's/Exec=Ripes/Exec=ripes/g' "$srcdir/${pkgname}-${pkgver}/appdir/usr/share/applications/Ripes.desktop"
    install -Dm 755 "$srcdir/${pkgname}-${pkgver}/Ripes" "$pkgdir/usr/bin/ripes"
    install -Dm 644 "$srcdir/${pkgname}-${pkgver}/appdir/usr/share/applications/Ripes.desktop" "${pkgdir}/usr/share/applications/Ripes.desktop"
}
