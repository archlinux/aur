# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>
# Contributor: z3ntu <WEI16416@spengergasse.at>

pkgname=packettracer
pkgver=6.3
pkgrel=2
pkgdesc="Network design and emulation software for Cisco's Networking Academy instructors and students."
arch=( 'i686' 'x86_64' )
depends_x86_64=('lib32-openssl' 'lib32-qt4' 'lib32-libpng') && makedepends_x86_64=('gcc-multilib')
depends_i686=('qtwebkit' 'libpng')
url="http://www.netacad.com/about-networking-academy/packet-tracer"
license=('custom')

source=( 'http://PacketTracer63_linux.tar.gz' 'packettracer' 'linguist' 'packettracer.sh')
sha512sums=('f9c8f5d661d7b812f53e83d87b3cb9d486d51c009c8b840a1dadcf3953b777234af4e243a22b603e6dda42a3961259bd130807fa3f8e9703838b77285f3a5fe6' '8798b38d02268805554e019984418578d7ec94b727f9261b1abbc57651b8d9108414b19fb0b59aa7dd4764c5ca269e5fb30465162ed8e6debf1efab5a868ab24' 'bd800d5335e54436f760e4a21a381c5cca4752c864c559ebc302bdcfc9819a3cf76fecc3b1490fdfd18d0f98e14c0886d8c6b7776dd3814af7ade17b9c85d80a'
'3f4732213a9ca7c95f742edbdccf4d84c95e1c9e00d3dfa72e79b8039ef86bed29bc5b76586402a233ce3af409c0a56c759c2554e17962c292a6bd333654ce71')

# We don't want to strip anything from the static libraries
# We want to keep all binaries orginal (Cisco is goofy)
options=(!strip)
install=pt.install

package() {
  cd ${srcdir}/PacketTracer63

  mkdir -p ${pkgdir}/usr/share/packettracer/{art,backgrounds,bin,extensions,help,LANGUAGES,lib,saves,sounds,templates}

  cp -r ./art/* ${pkgdir}/usr/share/packettracer/art
  cp -r ./backgrounds/* ${pkgdir}/usr/share/packettracer/backgrounds
  cp -r ./bin/* ${pkgdir}//usr/share/packettracer/bin
  cp -r ./extensions/* ${pkgdir}/usr/share/packettracer/extensions
  cp -r ./LANGUAGES/* ${pkgdir}/usr/share/packettracer/LANGUAGES
  cp -r ./saves/* ${pkgdir}/usr/share/packettracer/saves
  cp -r ./sounds/* ${pkgdir}/usr/share/packettracer/sounds
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
  sed 's/\/usr\/local\/PacketTracer6/\/usr\/share\/packettracer/' -i ${pkgdir}/usr/share/applications/Cisco-PacketTracer.desktop 
  rm ${pkgdir}/usr/share/packettracer/bin/Cisco-PacketTracer.desktop
}

