# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Sven Niese <Fd3querm@yahoo.de>
# Contributor: Daniel Murphy <mosquitogang201@gmail.com>

# NOTE: the option "!makeflag" is needed because the compilation
#       may fail if make uses more than one job.

pkgname=calculix
pkgver=2.12
pkgrel=2
pkgdesc="CalculiX: 3D finite element solver and post-processor (executables)"
arch=('i686' 'x86_64')
options=(!makeflags !buildflags)
url="http://www.calculix.de/"
license=('GPL2')
depends=('arpack' 'spooles' 'libsnl-svn' 'blas' 'freeglut' 'mesa' 'glu' 'libxmu' )
optdepends=('calculix-doc: documentation and examples')
makedepends=('gcc-fortran')

# This is needed because the minor version of ccx and cgx could differ
_mainver="${pkgver:0:4}"
_ccxver="${pkgver}"
_cgxver="${pkgver}"

source=("http://www.dhondt.de/ccx_${_ccxver}.src.tar.bz2"
      	"http://www.dhondt.de/cgx_${_cgxver}.all.tar.bz2"
        "calculix_${_mainver}_archlinux.patch")

sha256sums=('d75427dfb6db70fdfbb5939df22da8addf0ea4522cff32c9cdc4029e39b6b914'
            '504e5230902fb3c18001807c1394375b1cf81a10a0e99bd03f121c9b38717a83'
            'e99905bacaede0d09a232136b0eef9b53097e73578c3be9478404c646fad24c5')

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
