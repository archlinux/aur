# OldMaintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>

pkgname=packettracer62
pkgver=6.2
pkgrel=1
pkgdesc="Network design and emulation software for Cisco's Networking Academy instructors and students."
arch=( 'i686' 'x86_64' )
depends_x86_64=('lib32-openssl' 'lib32-qt4' 'lib32-libpng') && makedepends_x86_64=('gcc-multilib')
depends_i686=('qtwebkit' 'libpng')
conflicts=('packettracer')
replaces=('packettracer')
url="http://www.netacad.com/about-networking-academy/packet-tracer"
license=('custom')
source=(
    # Requires Netacad Username/Password to download
    'http://Cisco Packet Tracer 6.2 for Linux - Ubuntu installation - Student version.tar.gz'
    'packettracer'
    'linguist'
    'packettracer.sh'
)
sha256sums=(
    'bad40dc41e7c2989f96f28b13db871a94a9de35913db2ea15afb1001f6c80082'
    'b3d4379f921d02b16d3e73d13eac39367742efc7ce78cd9ca8d17498c82834e1'
    '350a9ce77e7325364adab789a60ec07ad02b0a89c8ba21602b3c117c7c6503c3'
    '733c69f357d7c3be7e42af27a7c5ffa77fb65e789aab0befeee26af015b00f26'
)

# We don't want to strip anything from the static libraries
# We want to keep all binaries orginal (Cisco is goofy)
options=(!strip)
install=pt.install

package() {
    cd "${srcdir}/PacketTracer62Student"

    mkdir -p "${pkgdir}/opt/pt/"{art,backgrounds,bin,extensions,help,LANGUAGES,lib,saves,sounds,templates}

    cp -r ./art/* "${pkgdir}/opt/pt/art"
    cp -r ./backgrounds/* "${pkgdir}/opt/pt/backgrounds"
    cp -r ./bin/* "${pkgdir}/opt/pt/bin"
    cp -r ./extensions/* "${pkgdir}/opt/pt/extensions"
    cp -r ./LANGUAGES/* "${pkgdir}/opt/pt/LANGUAGES"
    cp -r ./saves/* "${pkgdir}/opt/pt/saves"
    cp -r ./sounds/* "${pkgdir}/opt/pt/sounds"
    cp -r ./templates/* "${pkgdir}/opt/pt/templates"
    cp -r ./lib/* "${pkgdir}/opt/pt/lib"

    # Help Files that are optinal uncomment to include them (55 MB)
    # cp -r ./help/* "${pkgdir}/opt/pt/help"

    # Mime Info for PKA, PKT, PKZ
    install -D -m644 ./bin/Cisco-pka.xml "${pkgdir}/usr/share/mime/packages/Cisco-pka.xml"
    install -D -m644 ./bin/Cisco-pkt.xml "${pkgdir}/usr/share/mime/packages/Cisco-pkt.xml"
    install -D -m644 ./bin/Cisco-pkz.xml "${pkgdir}/usr/share/mime/packages/Cisco-pkz.xml"

    rm "${pkgdir}/opt/pt/bin/Cisco-pka.xml"
    rm "${pkgdir}/opt/pt/bin/Cisco-pkt.xml"
    rm "${pkgdir}/opt/pt/bin/Cisco-pkz.xml"

    # Install Mimetype Icons
    install -D -m644 ./art/pka.png "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-pka.png"
    install -D -m644 ./art/pkt.png "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-pkt.png"
    install -D -m644 ./art/pkz.png "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-pkz.png"

    # EULA
    install -D -m644 eula.txt "${pkgdir}/usr/share/licenses/$pkgname/eula.txt"

    # Shell script to start PT and tell it to use included qt files
    # Arch's QT causes PT to crash when saving!
    install -D -m755 "${srcdir}/packettracer" "${pkgdir}/opt/pt/packettracer"

    # Symlink to /usr/bin
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s /opt/pt/packettracer "${pkgdir}/usr/bin/packettracer"

    # Improved version of Cisco's linguist script
    install -D -m755 "${srcdir}/linguist" "${pkgdir}/opt/pt/linguist"

    # Add enviroment variable
    install -D -m755 "${srcdir}/packettracer.sh" "${pkgdir}/etc/profile.d/packettracer.sh"

    # Desktop File
    install -D -m644 ./bin/Cisco-PacketTracer.desktop "${pkgdir}/usr/share/applications/Cisco-PacketTracer.desktop"
    sed 's/\/usr\/local\/PacketTracer6/\/opt\/pt/' -i "${pkgdir}/usr/share/applications/Cisco-PacketTracer.desktop"
    rm "${pkgdir}/opt/pt/bin/Cisco-PacketTracer.desktop"
}
