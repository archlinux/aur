# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>
# Contributor: z3ntu <WEI16416@spengergasse.at>

pkgname=packettracer
pkgver=7.0
pkgrel=1
pkgdesc="Network design and emulation software for Cisco's Networking Academy instructors and students."
arch=( 'i686' 'x86_64' )
depends_x86_64=('lib32-openssl' 'lib32-qt4' 'lib32-libpng') && makedepends_x86_64=('gcc-multilib')
depends_i686=('qtwebkit' 'libpng')
url="http://www.netacad.com/about-networking-academy/packet-tracer"
license=('custom')

source=('packettracer' 'linguist' 'packettracer.sh')
source_i686=('local://PacketTracer70_32bit_linux.tar.gz')
source_x86_64=('local://PacketTracer70_64bit_linux.tar.gz')
sha512sums=(
'3fb22457ae4901bd22a8d984da6ae61354fa0c8a1be972a7ab0b48afcb3933bb8c0625dbd4f370fd4da394c8b043724e32ccced93c76f3536fac9defb941ac17' 'bd800d5335e54436f760e4a21a381c5cca4752c864c559ebc302bdcfc9819a3cf76fecc3b1490fdfd18d0f98e14c0886d8c6b7776dd3814af7ade17b9c85d80a'
'3f4732213a9ca7c95f742edbdccf4d84c95e1c9e00d3dfa72e79b8039ef86bed29bc5b76586402a233ce3af409c0a56c759c2554e17962c292a6bd333654ce71')
sha512sums_i686=('2ec0c7c3c6e5c9f95baf39cabb48bb6e5e19423310010f20b295efff09255cbda02b0c165894820f96da554b0d91ed30b54a5a5690baca9d36e90b10dd6a33fd')
sha512sums_x86_64=('fc97ffd272269baf8f2fde3f7a545d07c1913507d0a6013dc862f20fdb3baffe4ebef7c0a0d6faa926daf7ee06ca5acfe15143018b8ee76f3a0b4d3d23ec3b9b')

# We don't want to strip anything from the static libraries
# We want to keep all binaries orginal (Cisco is goofy)
options=(!strip)
install=pt.install

package() {
  cd ${srcdir}/PacketTracer70

  mkdir -p ${pkgdir}/usr/share/packettracer/{art,backgrounds,bin,extensions,help,languages,lib,saves,Sounds,templates}

  cp -r ./art/* ${pkgdir}/usr/share/packettracer/art
  cp -r ./backgrounds/* ${pkgdir}/usr/share/packettracer/backgrounds
  cp -r ./bin/* ${pkgdir}//usr/share/packettracer/bin
  cp -r ./extensions/* ${pkgdir}/usr/share/packettracer/extensions
  cp -r ./languages/* ${pkgdir}/usr/share/packettracer/languages
  cp -r ./saves/* ${pkgdir}/usr/share/packettracer/saves
  cp -r ./Sounds/* ${pkgdir}/usr/share/packettracer/Sounds
  cp -r ./templates/* ${pkgdir}/usr/share/packettracer/templates
  cp -r ./lib/* ${pkgdir}/usr/share/packettracer/lib

  # Help Files that are optinal uncomment to include them (55 MB)
  # cp -r ./help/* ${pkgdir}/usr/share/packettracer/help

  # Mime Info for PKA, PKT, PKZ
  install -D -m644 ./bin/Cisco-pka.xml ${pkgdir}/usr/share/mime/packages/Cisco-pka.xml
  install -D -m644 ./bin/Cisco-pkt.xml ${pkgdir}/usr/share/mime/packages/Cisco-pkt.xml
  install -D -m644 ./bin/Cisco-pkz.xml ${pkgdir}/usr/share/mime/packages/Cisco-pkz.xml

  rm ${pkgdir}/usr/share/packettracer/bin/Cisco-pka.xml
  rm ${pkgdir}/usr/share/packettracer/bin/Cisco-pkt.xml
  rm ${pkgdir}/usr/share/packettracer/bin/Cisco-pkz.xml

  # Install Mimetype Icons
  install -D -m644 ./art/pka.png ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-pka.png
  install -D -m644 ./art/pkt.png ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-pkt.png
  install -D -m644 ./art/pkz.png ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-pkz.png

  # EULA
  install -D -m644 eula.txt ${pkgdir}/usr/share/licenses/$pkgname/eula.txt

  # Shell script to start PT and tell it to use included qt files
  # Arch's QT causes PT to crash when saving!
  install -D -m755 ${srcdir}/packettracer ${pkgdir}/usr/share/packettracer/packettracer

  # Symlink to /usr/bin
  mkdir -p ${pkgdir}/usr/bin/
  ln -s /usr/share/packettracer/packettracer ${pkgdir}/usr/bin/packettracer

  # Improved version of Cisco's linguist script
  install -D -m755 ${srcdir}/linguist ${pkgdir}/usr/share/packettracer/linguist

  # Add enviroment variable
  install -D -m755 ${srcdir}/packettracer.sh ${pkgdir}/etc/profile.d/packettracer.sh

  # Desktop File
  install -D -m644 ./bin/Cisco-PacketTracer.desktop ${pkgdir}/usr/share/applications/Cisco-PacketTracer.desktop
  sed 's/\/usr\/local\/PacketTracer7/\/usr\/share\/packettracer/' -i ${pkgdir}/usr/share/applications/Cisco-PacketTracer.desktop 
  rm ${pkgdir}/usr/share/packettracer/bin/Cisco-PacketTracer.desktop
}

