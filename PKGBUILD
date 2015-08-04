# Maintainer: Grey Christoforo <grey@christoforo.net>

_number_of_bits=32
pkgname=microchip-mplabxc${_number_of_bits}-bin
pkgver=1.40
pkgrel=2
pkgdesc="Microchip's MPLAB XC${_number_of_bits} C compiler toolchain for all of their 32bit microcontrollers"
arch=(i686 x86_64)
url=http://www.microchip.com/xc${_number_of_bits}
license=(custom)
if [[ $CARCH = i686 ]]; then
  depends=(
    'expat'
    'gcc-libs'
  )
else
  depends=(
    'lib32-expat'
    'lib32-gcc-libs'
  )
fi
makedepends=(sdx tcl tcl-vfs) 
options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
source=("installerBlobFromMicrochip::http://ww1.microchip.com/downloads/en/DeviceDoc/xc${_number_of_bits}-v$pkgver-full-install-linux-installer.run" liblzmadec0.2.so)
noextract=(installerBlobFromMicrochip liblzmadec0.2.so)
md5sums=('06f3f019001cee7d8792561dc8a8da80'
         'e43a1f543ba4f67a2d5b2e8d9656a6c7')
install=$pkgname.install

build() {
  # unwrap installer files
  sdx.kit unwrap installerBlobFromMicrochip
  
  # read unpack options
  _unpack_options=$(cat installerBlobFromMicrochip.vfs/cookfsinfo.txt)
  
  # write unpack tcl script to file
cat > unpack.tcl <<EOF
package require vfs::cookfs
package require Tcllzmadec
vfs::cookfs::Mount ${_unpack_options} installerBlobFromMicrochip virtual
file copy virtual unpacked.vfs
EOF

  # if this is a 64bit machine, we need to use the packaged zlma decoder so since the insaller only provides a 32bit one
  if [[ $CARCH = x86_64 ]]; then
    mv liblzmadec0.2.so installerBlobFromMicrochip.vfs/libraries/lzma*/.
  fi

  msg2 "Unpacking installer. This might take a while..."
  LD_LIBRARY_PATH=./usr/lib: TCL_LIBRARY=./installerBlobFromMicrochip.vfs/lib TCLLIBPATH=./installerBlobFromMicrochip.vfs/libraries tclsh unpack.tcl

  # now reassemble files larger than 5MB in the archive, which were split up for whatever reason
  msg2 "Reassembling files..."
  find unpacked.vfs -name '*___bitrockBigFile1' | while read firstChunk
  do
    baseName="${firstChunk%%___bitrockBigFile1}"
    local i=1
    while [[ -f "${baseName}___bitrockBigFile${i}" ]]
    do
      cat "${baseName}___bitrockBigFile${i}" >> "${baseName}"
      i=$((i + 1))
    done
  done
}

package() {
  mv unpacked.vfs/compiler/programfilesosx/* unpacked.vfs/compiler/programfiles/
  mv unpacked.vfs/compiler/programfiles/*License.txt unpacked.vfs/compiler/programfiles/docs/.

  mkdir -p "$pkgdir"/opt/$pkgname
  mv unpacked.vfs/compiler/programfiles/* "$pkgdir"/opt/$pkgname/.
  mv unpacked.vfs/licensecomponent "$pkgdir"/opt/$pkgname/.

  msg2 "Making executables executable"
  find "$pkgdir"/opt/$pkgname/bin -type f -exec /bin/sh -c "file {} | grep -q executable && chmod +x {}" \;
  chmod +x "$pkgdir"/opt/$pkgname/licensecomponent/xclmallBin/bin/xclm
  chmod +x "$pkgdir"/opt/$pkgname/licensecomponent/LinuxLM/xclmcheck.sh

  mkdir -p "$pkgdir/etc/profile.d"
  echo "export PATH="'$PATH'":/opt/${pkgname}/bin" > "$pkgdir/etc/profile.d/${pkgname}.sh"
  echo "export XC${_number_of_bits}_TOOLCHAIN_ROOT=/opt/${pkgname}" >> "$pkgdir/etc/profile.d/${pkgname}.sh" 
 
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  ln -s /opt/$pkgname/docs/$(basename /opt/$pkgname/docs/*icense.txt) $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
