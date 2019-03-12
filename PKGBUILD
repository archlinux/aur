# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>
# Contributor: z3ntu <WEI16416@spengergasse.at>

pkgname=packettracer
pkgver=7.2.1
pkgrel=1
pkgdesc="Network design and emulation software for Cisco's Networking Academy instructors and students."
arch=( 'x86_64' )
depends=('openssl-1.0' 'libpng12' 'icu')
url="http://www.netacad.com/about-networking-academy/packet-tracer"
license=('custom')

source=('packettracer' 'linguist' 'packettracer.sh' 'local://Packet Tracer 7.2.1 for Linux 64 bit.tar.gz')
sha512sums=('dcfe03ce9594b83963d87a8e79d641745d9b8c6b39dfbec328c17035e2fd1d5b1fa494b2d988c901e0b5d25bc04a601c442a08c7abaec57100c1133e0ac9d228'
	    '1007b2d5268fe252a8f5395bf8a297d8d0d0f37ef74c793021183ba186d2c794e6ab0f3c16dff549a38ddc3446aea7ae7504534e407dd0aee76c5c43301843fb'
	    'dcab77daefe69638fe97e9326b1e107f072a582f58c70fcd04d1590a729fdce7a5041b5b173754f9fc9e055fb22614bea67639cb164fd4e00778d1bb57853499'
	    '359f1b2740459cf58b2e71da3edd52eb8c49c3197c3a5af25682e469c00e8e35de90b2d43cdd8d9c614cbed0aac554b150d578d6a25295ea547025e090b4ff25')

# We don't want to strip anything from the static libraries
# We want to keep all binaries orginal (Cisco is goofy)
options=(!strip)
install=pt.install

package() {
  cd "${srcdir}/"

  mkdir -p "${pkgdir}/opt/packettracer/"{art,backgrounds,bin,extensions,help,languages,saves,Sounds,templates}

  cp -r ./art/* "${pkgdir}/opt/packettracer/art"
  cp -r ./backgrounds/* "${pkgdir}/opt/packettracer/backgrounds"
  cp -r ./bin/* "${pkgdir}/opt/packettracer/bin"
  cp -r ./extensions/* "${pkgdir}/opt/packettracer/extensions"
  cp -r ./languages/* "${pkgdir}/opt/packettracer/languages"
  cp -r ./saves/* "${pkgdir}/opt/packettracer/saves"
  cp -r ./Sounds/* "${pkgdir}/opt/packettracer/Sounds"
  cp -r ./templates/* "${pkgdir}/opt/packettracer/templates"

  # Help Files that are optinal uncomment to include them (55 MB)
  # cp -r ./help/* "${pkgdir}/opt/packettracer/help"

  # Mime Info for PKA, PKT, PKZ
  install -D -m644 ./bin/Cisco-pka.xml "${pkgdir}/usr/share/mime/packages/Cisco-pka.xml"
  install -D -m644 ./bin/Cisco-pkt.xml "${pkgdir}/usr/share/mime/packages/Cisco-pkt.xml"
  install -D -m644 ./bin/Cisco-pkz.xml "${pkgdir}/usr/share/mime/packages/Cisco-pkz.xml"

  rm "${pkgdir}/opt/packettracer/bin/Cisco-pka.xml"
  rm "${pkgdir}/opt/packettracer/bin/Cisco-pkt.xml"
  rm "${pkgdir}/opt/packettracer/bin/Cisco-pkz.xml"

  # Install Mimetype Icons
  install -D -m644 ./art/pka.png "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-pka.png"
  install -D -m644 ./art/pkt.png "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-pkt.png"
  install -D -m644 ./art/pkz.png "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-pkz.png"

  # EULA
  install -D -m644 eula721.txt "${pkgdir}/usr/share/licenses/$pkgname/eula721.txt"

  # Shell script to start PT and tell it to use included qt files
  # Arch's QT causes PT to crash when saving!
  install -D -m755 "${srcdir}/packettracer" "${pkgdir}/opt/packettracer/packettracer"

  # Symlink to /usr/bin
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s /opt/packettracer/packettracer "${pkgdir}/usr/bin/packettracer"

  # Improved version of Cisco's linguist script
  install -D -m755 "${srcdir}/linguist" "${pkgdir}/opt/packettracer/linguist"

  # Add enviroment variable
  install -D -m755 "${srcdir}/packettracer.sh" "${pkgdir}/etc/profile.d/packettracer.sh"

  # Desktop File
  install -D -m644 ./bin/Cisco-PacketTracer.desktop "${pkgdir}/usr/share/applications/Cisco-PacketTracer.desktop"
  sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/usr/share/applications/Cisco-PacketTracer.desktop"
  rm "${pkgdir}/opt/packettracer/bin/Cisco-PacketTracer.desktop"
}
