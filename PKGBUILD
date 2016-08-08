# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Sven Niese <Fd3querm@yahoo.de>
# Contributor: Daniel Murphy <mosquitogang201@gmail.com>

# NOTE: the option "!makeflag" is needed because the compilation
#       may fail if make uses more than one job.

pkgname=calculix
pkgver=2.11
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
_mainver="${pkgver:0:4}"
_ccxver="${pkgver}"
_cgxver="${pkgver}"

source=("http://www.dhondt.de/ccx_${_ccxver}.src.tar.bz2"
      	"http://www.dhondt.de/cgx_${_cgxver}.all.tar.bz2"
        "calculix_${_mainver}_archlinux.patch")

sha256sums=('11588c7a2836cadbc4c6f2b866b0daa67512eebe755887094a76a997e6dc2493'
            '11c6ab303121708463320dbf85ed300caddad02d2388b2920b8b960c5b4c1942'
            'd22826c4e7c5b1e579d49ff2166a0497f67c0a8640ae9376c174a3a8d20bea7f')

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
