# Contributor: Max Devaine <max@devaine.cz>

pkgname=openvsp-git
pkgver=20170629
pkgrel=1
pkgdesc='OpenVSP allows the user to create a 3D model of an aircraft defined by common engineering parameters.'
arch=(i686 x86_64)
url='http://www.openvsp.org'
license=('NASA OPEN SOURCE AGREEMENT VERSION 1.3')
makedepends=('cmake' 'git')
depends=('fltk' 'libxml2' 'glew')
provides=('')
conflicts=('')
groups=('')


source=("$pkgname"::'git+https://github.com/OpenVSP/OpenVSP.git')
md5sums=('SKIP')


prepare() {
    if [ -d "${srcdir}/build" ] ; then
        rm -fr "${srcdir}/build"
    fi

    if [ -d "${srcdir}/buildlibs" ] ; then
        rm -fr "${srcdir}/buildlibs"
    fi
    
    mkdir "${srcdir}/buildlibs" 
    mkdir "${srcdir}/build" 
}

build() {
   cd "$srcdir/buildlibs"
   cmake ../$pkgname/Libraries/ \
         -DCMAKE_BUILD_TYPE=Release \
   	 -DCMAKE_PREFIX_PATH='/usr' \
         -DVSP_USE_SYSTEM_FLTK=true \
         -DVSP_USE_SYSTEM_GLEW=true \
         -DVSP_USE_SYSTEM_LIBXML2=true \
         -DVSP_USE_SYSTEM_GLM=true \
         -DVSP_USE_SYSTEM_CPPTEST=false \
         -DVSP_USE_SYSTEM_EIGEN=false \
         -DVSP_USE_SYSTEM_CMINPACK=false \
         -DVSP_USE_SYSTEM_CODEELI=false
   
   make || return 1

   cd "$srcdir/build"
   cmake ../$pkgname/src/ \
         -DVSP_LIBRARY_PATH=$srcdir/buildlibs \
         -DCMAKE_BUILD_TYPE=Release

   make || return 1
}

package() {
  cd "$srcdir/build/"
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/openvsp" -P cmake_install.cmake
  mkdir -p ${pkgdir}/usr/bin
  cd ${pkgdir}/usr/openvsp
  mv vsp vspaero vspscript vspviewer ${pkgdir}/usr/bin/
}
