# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Sven Niese <Fd3querm@yahoo.de>
# Contributor: Daniel Murphy <mosquitogang201@gmail.com>

pkgname=calculix
pkgver=2.8
pkgrel=2
pkgdesc="CalculiX: 3D finite element solver and post-processor (executables)"
arch=('i686' 'x86_64')
options=(!makeflags !buildflags)
url="http://www.calculix.de/"
license=('GPL2')
depends=('arpack' 'spooles' 'libsnl-svn' 'blas' 'freeglut' 'mesa' 'glu' 'libxmu' )
optdepends=('calculix-doc: documentation and examples')
makedepends=('gcc-fortran')

_mainver=${pkgver:0:3}

source=("http://www.dhondt.de/ccx_${pkgver}.src.tar.bz2"
	"http://www.dhondt.de/cgx_${pkgver}.all.tar.bz2"
        "calculix_${_mainver}_archlinux.patch")

sha256sums=('4b1d032afbc7e24658824cd0dcf6b4279adb9b1788a0d75111b58cdc40219ced'
            '8e605df835f62748b2d7bba00d7c9ef0a2b797fb7f4ba4a8614062c1f0ba0875'
            '591ae8473400f522a8d45924e0e3be6c92c39c3f9403f9efc93e933dc07cc63a')

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
    cd "${srcdir}/CalculiX/ccx_${_mainver}/src"
    make
    
    msg2 "Building gui..."
    cd "${srcdir}/CalculiX/cgx_${_mainver}/src"
    make

    msg2 "Build complete"
}


package() 
{
    msg "Copying files"

    install -d  ${pkgdir}/usr/bin

    install -Dm755 ${srcdir}/CalculiX/ccx_${pkgver}/src/ccx_${pkgver} ${pkgdir}/usr/bin/ccx
    install -Dm755 ${srcdir}/CalculiX/cgx_${pkgver}/src/cgx ${pkgdir}/usr/bin/cgx

    msg2 "Done"  
}
