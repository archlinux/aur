# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Sven Niese <Fd3querm@yahoo.de>
# Contributor: Daniel Murphy <mosquitogang201@gmail.com>

# NOTE: !buildflags is needed in order to compile the code

pkgname=calculix-cgx
pkgver=2.23
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

sha256sums=('04abbe0d2bac6a7bff018238b409568c189ede25589880e8cdd947f56ebd67c7'
            '95d91be0aa1b50a598a9bd19eed6e08fb1016934f7d600248a987db07fe530b6')

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
    make  CFLAGS="-O2 -std=c11 -Wno-narrowing -Wno-old-style-definition \
                  -Wno-implicit-function-declaration -Wno-int-conversion \
                  -I./ -I/usr/include/libSNL -I../../glut-3.5/src" \
          LFLAGS="-lGL -lGLU -lX11 -lXi -lXmu -lXext -lXt -lSM -lICE -lSNL -lm -lpthread -lrt"
}

package() 
{
    install -d  ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/CalculiX/cgx_${pkgver}/src/cgx ${pkgdir}/usr/bin/cgx
}
