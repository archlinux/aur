# !!! NOTE !!!
# Please download AMD-APP-SDK-v3.0-0.113.50-Beta-linux<your_bits_here>.tar.bz2 from
# http://developer.amd.com/tools-and-sdks/opencl-zone/amd-accelerated-parallel-processing-app-sdk/
# and paste it next to this PKGBUILD

# Maintainer: Vi0L0 <vi0l093@gmail.com>
# Previous Maintainer: Michael Krause <mk-arch@spline.de>
# Contributor: kralyk
# Contributor: pfdm
# Contributor: caust1c

# PKGEXT=".tar.gz"  # time to pack this pkg into tar.xz is long, unfortunatelly yaourt got problems when ext is different than .pkg.tar.xz - V


pkgbase=amdapp-sdk
pkgname=('amdapp-sdk' 'amdapp-sdk-aparapi' 'amdapp-sdk-opencv' 'amdapp-sdk-nocatalyst' 'amdapp-sdk-docs')
pkgver=3.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://developer.amd.com/tools-and-sdks/opencl-zone/amd-accelerated-parallel-processing-app-sdk/"
license=("custom")
options=('staticlibs' 'libtool' '!strip' '!upx')
groups=('amdapp')
makedepends=('perl' 'llvm' 'amdapp-aparapi' 'apache-ant')

#Architecture resolution
    if [ "$CARCH" = 'i686' ]; then
      _bits=32
      _arch=x86
#       _tarbits=x86
      _tarbits=32-1
	else _bits=64
	     _arch=x86_64
# 	     _tarbits=x64
	     _tarbits=64
     fi

[ "$CARCH" = 'i686' ] && _hash='0520a2fac0e945195419ec560e7d340cbcb2da3a3412cb2f38584263a7198d35' \
                        || _hash='0d806087e5fef7fdfb9372388afe2ff7b382041ba5a23160d58143166005f2d4'

#Sources
source=(
# 	"http://developer.amd.com/wordpress/media/files/AMD-APP-SDK-linux-v2.9-1.599.381-GA-${_tarbits}.tar.bz2"
	"http://developer.amd.com/wordpress/media/files/AMD-APP-SDK-v3.0-0.113.50-Beta-linux${_tarbits}.tar.bz2"
	'amd.icd'
	'amdapp-sdk.sh'
	'amdapp-sdk.conf')

#sha256sums
sha256sums=($_hash
'77cb18c5a588e02c73c2406e1057461b6c030b97534154aa3163cbfb9b7e97b7'
'dffe3d16ae07fafe6571c37f97f73e694891a7ea7888fc7f0a5d0e42b997e50f'
'c871a5044dd19e710b9ff058faa4e40f9b825b27d3928d535bc452116dba3b95')


_subdir="AMD-APP-SDK-v3.0-0.113.50-Beta-linux${_bits}"

#Install path
_ipath='opt/AMDAPP/SDK'


prepare() {
  cd ${srcdir}
#   tar xf ${_subdir}.tgz
#   cd ${_subdir}
#   patch -p0 < ../../01-implicit-linking.patch
#   patch -p0 < ${srcdir}/02-readlink-include.patch
  . /etc/profile.d/aparapi.sh
}


build() {
#----------- >8 --------------
#   cd ${srcdir}/${_subdir}
#   # FIXME - dependency has to move into Makefile
#  make -j1
#----------- >8 --------------
#   bash AMD-APP-SDK-v2.9-1.599.381-GA-linux${_bits}.sh --noexec --target ${srcdir}/${_subdir}
  bash AMD-APP-SDK-v3.0-0.113.50-Beta-linux${_bits}.sh --noexec --target ${srcdir}/${_subdir}
}


package_amdapp-sdk() {
pkgdesc="AMD Accelerated Parallel Processing (APP) SDK, 3.0 beta with OpenCL 2.0 support."
install=amdapp-sdk.install
provides=('opencl' 'amdstream')
depends=('libcl' 'libgl' 'llvm' 'gcc-libs' 'mesa' 'glut' 'glew' 'glu')
conflicts=('amdstream')
optdepends=(
	    'opencl-headers: for development'
            'catalyst: for OpenCL on AMD GPU'
	    'libxext: to run some samples'
	    'libsm: to run some samples'
	    'libgl: (or nvidia/catalyst-utils) to run some samples'
)

  cd ${srcdir}/${_subdir}

  #Install SDK
  install -m755 -d ${pkgdir}/${_ipath}
  cp -r include ${pkgdir}/${_ipath}
  install -m755 -d ${pkgdir}/${_ipath}/{bin,samples/opencl/bin,samples/bolt/bin}
  cp -r ./bin/${_arch}/* ${pkgdir}/${_ipath}/bin
#   cp -r ./lib/${_arch}/* ${pkgdir}/${_ipath}/lib
  find ./samples/opencl/ -mindepth 1 -maxdepth 1 -type d -not -name bin -exec cp -r {} ${pkgdir}/${_ipath}/samples/opencl \;
  cp -r ./samples/opencl/bin/${_arch}/* ${pkgdir}/${_ipath}/samples/opencl/bin

# Bolt
  find ./samples/opencl/ -mindepth 1 -maxdepth 1 -type d -not -name bin -exec cp -r {} ${pkgdir}/${_ipath}/samples/bolt \;
  cp -r ./samples/bolt/bin/${_arch}/* ${pkgdir}/${_ipath}/samples/bolt/bin

#----------- >8 --------------
# next 4 lines commented in 2.9.1 -V
#   #Install includes
#   install -m755 -d ${pkgdir}/usr/include/OpenVideo
# #   install -m644 ./include/OpenVideo/{OVDecode.h,OVDecodeTypes.h} ${pkgdir}/usr/include/OpenVideo
#   install -m644 ./include/OpenVideo/OpenVideo/* ${pkgdir}/usr/include/OpenVideo  # why not this way? V

  #Symlink binaries   -- doesn't needed? -V
#  mkdir -p "${pkgdir}/usr/bin"
 # ln -s "/${_ipath}/bin/clinfo" "${pkgdir}/usr/bin/clinfo"
#----------- >8 --------------
 
  #Fix modes
  find ${pkgdir}/${_ipath} -type f -exec chmod 644 {} \;
  chmod 755 ${pkgdir}/${_ipath}/bin/*
  find ${pkgdir}/${_ipath}/samples/opencl/bin -type f -not -name "*.*" -exec chmod 755 {} \;
  find ${pkgdir}/${_ipath}/samples/bolt/bin -type f -not -name "*.*" -exec chmod 755 {} \;

  #AMDAPPSDKROOT env var
  install -m755 -d ${pkgdir}/etc/profile.d
  install -m755 ${srcdir}/amdapp-sdk.sh ${pkgdir}/etc/profile.d
  sed -i -e "s|PATH|${_ipath}|" ${pkgdir}/etc/profile.d/amdapp-sdk.sh

  #License
  install -m755 -d ${pkgdir}/usr/share/licenses/amdapp-sdk
  install -m644 ${srcdir}/${_subdir}/APPSDK-EULA-linux.txt ${pkgdir}/usr/share/licenses/amdapp-sdk/
}


package_amdapp-sdk-nocatalyst() {
pkgdesc="AMD Accelerated Parallel Processing (APP) SDK, 3.0 beta with OpenCL 2.0 support. Libs and ICD for non-catalyst users."
install=amdapp-sdk-nocatalyst.install
depends=('amdapp-sdk')
conflicts=('catalyst-utils')

  #LDCONF
  install -m755 -d ${pkgdir}/etc/ld.so.conf.d
  install -m755 ${srcdir}/amdapp-sdk.conf ${pkgdir}/etc/ld.so.conf.d
  sed -i -e "s|PATH|${_ipath}|" ${pkgdir}/etc/ld.so.conf.d/amdapp-sdk.conf

  #Register ICD
  install -m755 -d ${pkgdir}/etc/OpenCL/vendors
  install -m755 ${srcdir}/amd.icd ${pkgdir}/etc/OpenCL/vendors
  sed -i -e "s|PATH|${_ipath}|" ${pkgdir}/etc/OpenCL/vendors/amd.icd
  sed -i -e "s|BITS|${_bits}|" ${pkgdir}/etc/OpenCL/vendors/amd.icd
  # The OpenCL ICD specifications: http://www.khronos.org/registry/cl/extensions/khr/cl_khr_icd.txt
  
  #Place libs
  install -m755 -d ${pkgdir}/${_ipath}/lib
  cp -r ${srcdir}/${_subdir}/lib/${_arch}/* ${pkgdir}/${_ipath}/lib
  chmod 755 ${pkgdir}/${_ipath}/lib/*

  #License
  install -m755 -d ${pkgdir}/usr/share/licenses
  ln -s amdapp-sdk ${pkgdir}/usr/share/licenses/${pkgname}
}


package_amdapp-sdk-aparapi() {
pkgdesc="AMD Accelerated Parallel Processing (APP) SDK, 3.0 beta with OpenCL 2.0 support. AparapiUtil and aparapi samples"
depends=('libcl' 'libgl' 'llvm' 'gcc-libs' 'mesa' 'glut' 'glew' 'amdapp-aparapi' 'apache-ant')
install=amdapp-sdk-aparapi.install

  cd ${srcdir}/${_subdir}
  install -m755 -d ${pkgdir}/${_ipath}/samples/aparapi
  cp -r ./samples/aparapi/* ${pkgdir}/${_ipath}/samples/aparapi
  find ${pkgdir}/${_ipath}/samples/aparapi -name \*.sh -exec chmod 755 {} \;
  
  #License
  install -m755 -d ${pkgdir}/usr/share/licenses
  ln -s amdapp-sdk ${pkgdir}/usr/share/licenses/${pkgname}
}


package_amdapp-sdk-opencv() {
pkgdesc="AMD Accelerated Parallel Processing (APP) SDK, 3.0 beta with OpenCL 2.0 support. OpenCVUtils and opencv samples"
depends=('libcl' 'libgl' 'llvm' 'gcc-libs' 'mesa' 'glut' 'glew' 'opencv')
install=amdapp-sdk-opencv.install

  cd ${srcdir}/${_subdir}
  install -m755 -d ${pkgdir}/${_ipath}/samples/opencv/bin
  find ./samples/opencv/ -mindepth 1 -maxdepth 1 -type d -not -name bin -exec cp -r {} ${pkgdir}/${_ipath}/samples/opencv \;
  cp -r ./samples/opencv/bin/${_arch}/* ${pkgdir}/${_ipath}/samples/opencv/bin
  find ${pkgdir}/${_ipath}/samples/opencv/bin -type f -not -name "*.*" -exec chmod 755 {} \;
  
  #License
  install -m755 -d ${pkgdir}/usr/share/licenses
  ln -s amdapp-sdk ${pkgdir}/usr/share/licenses/${pkgname}
}


package_amdapp-sdk-docs() {
pkgdesc="AMD Accelerated Parallel Processing (APP) SDK, 3.0 beta with OpenCL 2.0 support. Documentation"
install=amdapp-sdk-docs.install

  cd ${srcdir}/${_subdir}
  install -m755 -d ${pkgdir}/usr/share/doc/amdapp-sdk
  cp -r ./docs/* ${pkgdir}/usr/share/doc/amdapp-sdk
  
  #License
  install -m755 -d ${pkgdir}/usr/share/licenses
  ln -s amdapp-sdk ${pkgdir}/usr/share/licenses/${pkgname}
}