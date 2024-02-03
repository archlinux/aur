# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Sven Niese <Fd3querm@yahoo.de>
# Contributor: Daniel Murphy <mosquitogang201@gmail.com>

# NOTE: !buildflags is needed in order to compile the code

pkgname=calculix-cgx
pkgver=2.21
pkgrel=1
pkgdesc="CalculiX: 3D Structural Finite Element Program - Post Processor"
arch=('i686' 'x86_64')
options=(!buildflags)
url="http://www.calculix.de/"
license=('GPL2')
depends=('libsnl-svn' 'mesa' 'glu' 'libxmu' 'libxi')
optdepends=('calculix-doc: documentation and examples')
makedepends=('gcc-fortran' 'perl')
checkdepends=('perl')

source=("http://www.dhondt.de/cgx_${pkgver}.all.tar.bz2"
        "calculix_cgx_${pkgver}_archlinux.patch")

sha256sums=('55ae561903df011e944d7f82f9e00039dbc4c68ac9195a5a862d446eb56bcfc1'
            'bd7b17e5158220ec214c356a6ae373e7c17cd613dfb21afb6d39b15ddaaa9af4')

prepare()
{
    cd "${srcdir}"

    msg "Patching makefiles..."
    rm -rf CalculiX/libSNL
    patch -p0 -f -l -s -i calculix_cgx_${pkgver}_archlinux.patch
    msg2 "Done"
}

build()
{   
    cd "${srcdir}/CalculiX/cgx_${pkgver}/src"
    make  CFLAGS="-O2 -Wall -Wno-narrowing -I./ -I/usr/include/libSNL -I../../glut-3.5/src" \
          LFLAGS="-lGL -lGLU -lX11 -lXi -lXmu -lXext -lXt -lSM -lICE -lSNL -lm -lpthread -lrt"
}

package() 
{
    install -d  ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/CalculiX/cgx_${pkgver}/src/cgx ${pkgdir}/usr/bin/cgx
}
