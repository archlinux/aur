# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=z-stack-gateway
pkgver=1.0.1
_under_pkgver=${pkgver//./_}
pkgrel=3
pkgdesc="Z-Stack Linux Gateway is TI's ZigBee Home Gateway solution for Linux systems."
arch=(i686 x86_64)
url="https://github.com/greyltc/bitrock-unpacker/"
license=('custom')
makedepends=(bitrock-unpacker)

# go to http://www.ti.com/tool/z-stack-archive and manually download the Z-STACK-LINUX-GATEWAY archive and put it in /tmp
ln -f -s /tmp/Z-Stack_Linux_Gateway-${_under_pkgver}-src-linux-installer.run .
source=(local://Z-Stack_Linux_Gateway-${_under_pkgver}-src-linux-installer.run
	https://github.com/google/protobuf/archive/v2.5.0.tar.gz
	https://launchpad.net/ubuntu/+archive/primary/+files/protobuf-c_0.15.orig.tar.gz
	https://github.com/google/googletest/archive/release-1.5.0.tar.gz
)

md5sums=('13adda2f45efcf0ff093f31db86d3e6e'
         '9c21577a03adc1879aba5b52d06e25cf'
         '73ff0c8df50d2eee75269ad8f8c07dc8'
         '663149f0b0aaa9b4a9382265375587c3')

prepare() {
  msg2 "Unpacking bitrock installer..."
  bitrock-unpacker Z-Stack_Linux_Gateway-${_under_pkgver}-src-linux-installer.run ./unpacked.vfs

  # now we'll fix up the source code
  sed -i 's,export PROTOINC=$SCRIPTPATH,export '"PROTOINC=${srcdir}/protobuf-install-root/include"',g' "${srcdir}/unpacked.vfs/default/programfileslinux/Source/build_all"
  sed -i 's,export PROTOLIB=$SCRIPTPATH/protobuf-c-arm/lib,export '"PROTOLIB=${srcdir}/protobuf-install-root/lib"',g' "${srcdir}/unpacked.vfs/default/programfileslinux/Source/build_all"
  sed -i 's,export TARGET_PLATFORM="BEAGLEBONE_BLACK",export TARGET_PLATFORM="x86",g' "${srcdir}/unpacked.vfs/default/programfileslinux/Source/scripts/package_builder_bbb"
  sed -i 's,make arch-all-armBeagleBone CC_armBeagleBone=$COMPILER |& tee -a $MAKE_LOG_FILE,make $BUILD_TYPE |\& tee -a $MAKE_LOG_FILE,g' "${srcdir}/unpacked.vfs/default/programfileslinux/Source/scripts/package_builder_bbb"
  sed -i 's,cp $NPI_SOURCE/Projects/tools/LinuxHost/out/NPI_lnx_armBeagleBone_server $BINARIES_SERVERS_DIR/NPI_lnx_${PLATFORM_SUBSTRING}_server,cp $NPI_SOURCE/Projects/tools/LinuxHost/out/NPI_lnx_${PLATFORM_SUBSTRING}_server $BINARIES_SERVERS_DIR/NPI_lnx_${PLATFORM_SUBSTRING}_server,g' "${srcdir}/unpacked.vfs/default/programfileslinux/Source/scripts/package_builder_bbb"


  sed -i 's,COMPILO_FLAGS_x86 = "-O0 -g3 -Wall $(INCLUDES) $(DEFINES) -include ../hal/hal_types.h -include f8wConfig.h",COMPILO_FLAGS_x86 = "-O0 -g3 -Wall $(INCLUDES) $(DEFINES) -include ../hal/hal_types.h -include f8wConfig.h -I $(PROTOC_INC_DIR)",g' "${srcdir}/unpacked.vfs/default/programfileslinux/Source/Projects/zstack/linux/zstackserverznp/Makefile"
  sed -i 's,COMPILO_FLAGS_x86 = "-Wall $(INCLUDES) $(DEFINES) -include ../hal/hal_types.h",COMPILO_FLAGS_x86 = "-Wall $(INCLUDES) $(DEFINES) -include ../hal/hal_types.h -I $(PROTOC_INC_DIR)",g' "${srcdir}/unpacked.vfs/default/programfileslinux/Source/Projects/zstack/linux/nwkmgr/Makefile"
  sed -i 's,COMPILO_FLAGS_x86 = "-Wall $(INCLUDES) $(DEFINES) -include ../hal/hal_types.h",COMPILO_FLAGS_x86 = "-Wall $(INCLUDES) $(DEFINES) -include ../hal/hal_types.h -I $(PROTOC_INC_DIR)",g' "${srcdir}/unpacked.vfs/default/programfileslinux/Source/Projects/zstack/linux/hagateway/Makefile"
  sed -i 's,COMPILO_FLAGS_x86 = " -g -Wall $(INCLUDES) $(DEFINES) -include hal_types.h -include AF.h -include zcl.h -include zcl_ota.h ",COMPILO_FLAGS_x86 = " -g -Wall $(INCLUDES) $(DEFINES) -include hal_types.h -include AF.h -include zcl.h -include zcl_ota.h -I $(PROTOC_INC_DIR)",g' "${srcdir}/unpacked.vfs/default/programfileslinux/Source/Projects/zstack/linux/otaserver/Makefile"
}

build() {
  msg2 "Building protobuf"
  cd "${srcdir}/protobuf-2.5.0"
  ln -s ../googletest-release-1.5.0 gtest
  ./autogen.sh
  mkdir -p "${srcdir}/protobuf-install-root"
  ./configure prefix="${srcdir}/protobuf-install-root"
  make
  make install
  
  msg2 "Building protobuf-c"
  cd "${srcdir}/protobuf-c-0.15"
  D_LIBRARY_PATH="${srcdir}/protobuf-install-root/lib" LDFLAGS=-L"${srcdir}/protobuf-install-root/lib" PROTOC="${srcdir}/protobuf-install-root/bin/protoc" CXXFLAGS=-I"${srcdir}/protobuf-install-root/include" ./configure libdir="${srcdir}/protobuf-install-root/lib" includedir="${srcdir}/protobuf-install-root/include" prefix="${srcdir}/protobuf-install-root"
  make
  make install

  msg2 "Building z-stack"
  cd "${srcdir}/unpacked.vfs/default/programfileslinux/Source"
  mkdir -p "${srcdir}/tools"
  TCLIB="${srcdir}/tools" ./build_all
}

package() {
  mkdir -p "${pkgdir}/opt/z-stack-gateway"
  cd "${pkgdir}/opt/z-stack-gateway"
  _OUTDIR=$(find "${srcdir}/unpacked.vfs/default/programfileslinux/Source" -maxdepth 1 -type d -name *out)
  echo "the dir is ${_OUTDIR}"
  mv "$_OUTDIR/Precompiled_x86.tar" "${pkgdir}/opt/z-stack-gateway/."
  bsdtar -x -f Precompiled_x86.tar
  rm Precompiled_x86.tar
  mv "${srcdir}/unpacked.vfs/default/programfileslinux/Documents" "${pkgdir}/opt/z-stack-gateway/."
  mv "${srcdir}/unpacked.vfs/default/programfileslinux/Firmware" "${pkgdir}/opt/z-stack-gateway/."

  msg2 "Edit /opt/z-stack-gateway/servers/NPI_Gateway.cfg as needed"
  msg2 'Then run "cd /opt/z-stack-gateway/servers && LD_LIBRARY_PATH=/opt/z-stack-gateway/protobuf ./zigbeeHAgw x86"'
  msg2 'Then run "cd /opt/z-stack-gateway/servers && LD_LIBRARY_PATH=/opt/z-stack-gateway/protobuf ./start_application"'
}
