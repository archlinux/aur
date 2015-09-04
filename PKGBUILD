# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Sven Niese <Fd3querm@yahoo.de>
# Contributor: Daniel Murphy <mosquitogang201@gmail.com>

# NOTE: the option "!makeflag" is needed because the compilation
#       may fail if make uses more than one job.

pkgname=calculix
pkgver=2.8p2
pkgrel=1
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
_cgxver="${_mainver}"

source=("http://www.dhondt.de/ccx_${_ccxver}.src.tar.bz2"
      	"http://www.dhondt.de/cgx_${_cgxver}.all.tar.bz2"
        "calculix_${_mainver}_archlinux.patch")

sha256sums=('a21feb1a498b5925ddc9f7f58cb486d930435db4a47d5c583dd73f5160431eb2'
            '8e605df835f62748b2d7bba00d7c9ef0a2b797fb7f4ba4a8614062c1f0ba0875'
            '6bca58a5d5632d26d926e0348be1fce4eafa27af272df6972f4f8b35b0ce9407')

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
