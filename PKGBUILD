# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>

pkgname=packettracer
pkgver=6.2
pkgrel=2
pkgdesc="Network design and emulation software for Cisco's Networking Academy instructors and students."
arch=( 'i686' 'x86_64' )
depends_x86_64=('lib32-openssl' 'lib32-qt4' 'lib32-libpng') && makedepends_x86_64=('gcc-multilib')
depends_i686=('qtwebkit' 'libpng')
url="http://www.netacad.com/about-networking-academy/packet-tracer"
license=('custom')

source=( 'https://archive.org/download/Packettracer/Cisco Packet Tracer 6.2 for Linux - Ubuntu installation - Student version.tar.gz' 'packettracer' 'linguist' )
sha512sums=('231ef1cacdb5c77c78fa517ec4c3767cab64cca3d7f519b3c09432a327ed226ba0b9bdda9b5dc9836f87b4529ead6be976a48335860a9d15232fa0a33fa66be8' '0cf78b00428e5a795a29704eacaef1dbf2f93e0758b1e8341c79839ecb699022f0b9d2ba0b9bdbf196ed362fc708ec347624ba7b29033b18f865df0e93c858d3' '2fe30ef63d29903addbe3042aa505e9b1497ce2abc935855c062de1e2582a66425f10844ad38309ad099805a58ed89e47e78c2a943fc45a87d809eb0dfae39a3')

# We don't want to strip anything from the static libraries
# We want to keep all binaries orginal (Cisco is goofy)
options=(!strip)
install=pt.install

package() {
  cd ${srcdir}/PacketTracer62Student

  mkdir -p ${pkgdir}/opt/pt/{art,backgrounds,bin,extensions,help,LANGUAGES,lib,saves,sounds,templates}

  cp -r ./art/* ${pkgdir}/opt/pt/art
  cp -r ./backgrounds/* ${pkgdir}/opt/pt/backgrounds
  cp -r ./bin/* ${pkgdir}/opt/pt/bin
  cp -r ./extensions/* ${pkgdir}/opt/pt/extensions
  cp -r ./LANGUAGES/* ${pkgdir}/opt/pt/LANGUAGES
  cp -r ./saves/* ${pkgdir}/opt/pt/saves
  cp -r ./sounds/* ${pkgdir}/opt/pt/sounds
  cp -r ./templates/* ${pkgdir}/opt/pt/templates
  cp -r ./lib/* ${pkgdir}/opt/pt/lib

  # Help Files that are optinal uncomment to include them (55 MB)
  # cp -r ./help/* ${pkgdir}/opt/pt/help

  # Mime Info for PKA, PKT, PKZ
  install -D -m644 ./bin/Cisco-pka.xml ${pkgdir}/usr/share/mime/packages/Cisco-pka.xml
  install -D -m644 ./bin/Cisco-pkt.xml ${pkgdir}/usr/share/mime/packages/Cisco-pkt.xml
  install -D -m644 ./bin/Cisco-pkz.xml ${pkgdir}/usr/share/mime/packages/Cisco-pkz.xml

  rm ${pkgdir}/opt/pt/bin/Cisco-pka.xml
  rm ${pkgdir}/opt/pt/bin/Cisco-pkt.xml
  rm ${pkgdir}/opt/pt/bin/Cisco-pkz.xml

  # Install Mimetype Icons
  install -D -m644 ./art/pka.png ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-pka.png
  install -D -m644 ./art/pkt.png ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-pkt.png
  install -D -m644 ./art/pkz.png ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-pkz.png

  # EULA
  install -D -m644 eula.txt ${pkgdir}/usr/share/licenses/$pkgname/eula.txt

  # Shell script to start PT and tell it to use included qt files
  # Arch's QT causes PT to crash when saving!
  install -D -m755 ${srcdir}/packettracer ${pkgdir}/opt/pt/packettracer

  # Symlink to /usr/bin
  mkdir -p ${pkgdir}/usr/bin/
  ln -s /opt/pt/packettracer ${pkgdir}/usr/bin/packettracer

  # Improved version of Cisco's linguist script
  install -D -m755 ${srcdir}/linguist ${pkgdir}/opt/pt/linguist

  # Desktop File
  install -D -m644 ./bin/Cisco-PacketTracer.desktop ${pkgdir}/usr/share/applications/Cisco-PacketTracer.desktop
  sed 's/\/usr\/local\/PacketTracer6/\/opt\/pt/' -i ${pkgdir}/usr/share/applications/Cisco-PacketTracer.desktop 
  rm ${pkgdir}/opt/pt/bin/Cisco-PacketTracer.desktop
}

