# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>

pkgname=packettracer
pkgver=6.2
pkgrel=1
pkgdesc="Network design and emulation software for Cisco's Networking Academy instructors and students."
arch=( 'i686' 'x86_64' )
url="http://www.netacad.com/about-networking-academy/packet-tracer"
license=('custom')

# Untested
[ "$CARCH" = "x86_64" ] && depends=('lib32-openssl' 'lib32-qt4' 'lib32-libpng') && makedepends=('gcc-multilib')
[ "$CARCH" = "i686" ] && depends=('qtwebkit' 'libpng')

# Requires Netacad Username/Password to download
source=( 'http://Cisco \Packet \Tracer \6.2 \for \Linux \- \Ubuntu \installation \- \Student \version.tar.gz' 'packettracer' 'linguist' )
md5sums=('403fa8f9b1f974935587bf8b8227653a'
	 'e0bdbe6ca4d693f4dde2eab81bb97a74'
         'fd2f166d9b2cfbae0bd4cff792a9a270')

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
  ln -s /opt/pt/packettracer ${pkgdir}/usr/bin/pt

  # Improved version of Cisco's linguist script
  install -D -m755 ${srcdir}/linguist ${pkgdir}/opt/pt/linguist

  # Desktop File
  install -D -m644 ./bin/Cisco-PacketTracer.desktop ${pkgdir}/usr/share/applications/Cisco-PacketTracer.desktop
  sed 's/\/usr\/local\/PacketTracer6/\/opt\/pt/' -i ${pkgdir}/usr/share/applications/Cisco-PacketTracer.desktop 
  rm ${pkgdir}/opt/pt/bin/Cisco-PacketTracer.desktop
}

