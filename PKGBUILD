# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Sven Niese <Fd3querm@yahoo.de>
# Contributor: Daniel Murphy <mosquitogang201@gmail.com>

# NOTE: !buildflags is needed in order to compile the code

pkgname=calculix-cgx
pkgver=2.20
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

sha256sums=('f4c840c3633718547e33f86b2d7bc6b35608dd8d6cbf9fa192cecef34f2dc908'
            '6d9e86c9bcbe2953a3e7697c3c84945e8abeac4607ca519f69cd6f43cc8eb4e5')

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
