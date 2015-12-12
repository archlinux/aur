# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Sven Niese <Fd3querm@yahoo.de>
# Contributor: Daniel Murphy <mosquitogang201@gmail.com>

# NOTE: the option "!makeflag" is needed because the compilation
#       may fail if make uses more than one job.

pkgname=calculix
pkgver=2.9
pkgrel=3
pkgdesc="CalculiX: 3D finite element solver and post-processor (executables)"
arch=('i686' 'x86_64')
options=(!makeflags !buildflags)
url="http://www.calculix.de/"
license=('GPL2')
depends=('arpack' 'spooles' 'libsnl-svn' 'blas' 'freeglut' 'mesa' 'glu' 'libxmu' )
optdepends=('calculix-doc: documentation and examples')
makedepends=('gcc-fortran')

# This is needed because the minor version of ccx and cgx could differ
_mainver="${pkgver:0:3}"
_ccxver="${pkgver}"
_cgxver="${pkgver}"

source=("http://www.dhondt.de/ccx_${_ccxver}.src.tar.bz2"
      	"http://www.dhondt.de/cgx_${_cgxver}.all.tar.bz2"
        "calculix_${_mainver}_archlinux.patch")

sha256sums=('755e173cfb712c83cefef22cfa43f06caf495e5dffbecf8df3d47f3cf6e6d44d'
            'eccce9424a05396c218f1c8cb3c3e92ffd847d4c9e24e5fe7e5812688bcc1f69'
            '0f4a6ca904b2a86599b4cd99875bff58e97a928b40e08e01871360a88750ea70')

prepare()
{
    msg "Patching makefiles..."
    cd "${srcdir}"
    rm -rf CalculiX/libSNL
    patch -p0 -f -l -s -i calculix_${_mainver}_archlinux.patch
    msg2 "Done"
}

build()
{   
    msg "Building..."
    
    msg2 "Building solver..."
    cd "${srcdir}/CalculiX/ccx_${_ccxver}/src"
    make
    
    msg2 "Building gui..."
    cd "${srcdir}/CalculiX/cgx_${_cgxver}/src"
    make

    msg2 "Build complete"
}


package() 
{
    msg "Copying files"

    install -d  ${pkgdir}/usr/bin

    install -Dm755 ${srcdir}/CalculiX/ccx_${_ccxver}/src/ccx_${_ccxver} ${pkgdir}/usr/bin/ccx
    install -Dm755 ${srcdir}/CalculiX/cgx_${_cgxver}/src/cgx ${pkgdir}/usr/bin/cgx

    msg2 "Done"  
}
