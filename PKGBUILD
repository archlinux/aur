# Maintainer: Perttu Luukko <"perttu.luukko" followed by "@iki.fi">

pkgname=adom-noteye
pkgver=1.2.0_pre23
pkgrel=1
pkgdesc="A roguelike game with a quest-centric, plot driven structure"
arch=('i686' 'x86_64')
conflicts=('adom' 'adom-restricted')
provides=('adom')
depends=('ncurses' 'mesa' 'lua51' 'libtinfo' 'libcaca' 'libmad' 'libpng12')
url="http://www.adom.de/"
license=('custom: "adom"')
sha1sums=('' '51d28fe3f0420cd354113fd7ceb2a1a7abf1b069')
if [ "$CARCH" = x86_64 ]
 then
  _arch_link=64
  sha1sums[0]='746dd07f1f39ff663f136daaa60a073c6feedf3e'
 else
  _arch_link=32
  sha1sums[0]='409e70770cd914c88c28560a817e0ed14b65a265'
fi

source=(http://ancardia.us.to/download/adom_noteye_linux_ubuntu_${_arch_link}_${pkgver}.tar.gz LICENSE)

package() {
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/adom/LICENSE
  # Copy entire contents of the archive to /opt
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/adom" "${pkgdir}/opt/"
  # Remove some bundled libs for which we have perfectly good versions available
  cd "${pkgdir}/opt/adom/lib"
  rm -f "${pkgdir}/opt/adom/lib/libFLAC.so.8"
  rm -f "${pkgdir}/opt/adom/lib/libjpeg.so.8"
  rm -f "${pkgdir}/opt/adom/lib/liblua5.1.so.0"
  ln -s ../../../usr/lib/liblua5.1.so liblua5.1.so.0
  #rm -f "${pkgdir}/opt/adom/lib/libmikmod.so.2"
  # libnoteye.so we keep at this point
  rm -f "${pkgdir}/opt/adom/lib/libogg.so.0"
  #rm -f "${pkgdir}/opt/adom/lib/libSDL-1.2.so.0"
  #rm -f "${pkgdir}/opt/adom/lib/libSDL_image-1.2.so.0"
  #rm -f "${pkgdir}/opt/adom/lib/libSDL_mixer-1.2.so.0"
  #rm -f "${pkgdir}/opt/adom/lib/libSDL_net-1.2.so.0"
  #rm -f "${pkgdir}/opt/adom/lib/libtiff.so.4"
  rm -f "${pkgdir}/opt/adom/lib/libvorbisfile.so.3"
  rm -f "${pkgdir}/opt/adom/lib/libvorbis.so.0"
  # Since the adom binary uses a relative RPATH, it's either
  # this or patching the binary
  install -d "${pkgdir}/usr/bin"
  cat <<EOF > "${pkgdir}/usr/bin/adom"
#!/bin/sh
cd /opt/adom && ./adom
EOF
  chmod 755 "${pkgdir}/usr/bin/adom"
}
