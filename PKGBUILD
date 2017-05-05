# OldMaintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>

pkgname=packettracer62
pkgver=6.2
pkgrel=3
pkgdesc="Network design and emulation software for Cisco's Networking Academy instructors and students."
arch=('i686' 'x86_64')
depends=('perl') # openssl-1.0 dep
depends_x86_64=('lib32-glibc' 'lib32-libpng')
makedepends_x86_64=('gcc-multilib')
depends_i686=('libpng')
conflicts=('packettracer')
replaces=('packettracer')
url="http://www.netacad.com/about-networking-academy/packet-tracer"
license=('custom')
_openssl_ver=1.0.2k
source=(
    # Requires Netacad Username/Password to download
    "local://Cisco Packet Tracer 6.2 for Linux - Ubuntu installation - Student version.tar.gz"
    "packettracer"
    "linguist"
    "packettracer.sh"
    
    # openssl-1.0
    "https://www.openssl.org/source/openssl-${_openssl_ver}.tar.gz"
    "openssl-no-rpath.patch"
)
sha256sums=(
    'bad40dc41e7c2989f96f28b13db871a94a9de35913db2ea15afb1001f6c80082'
    'db71b82fa89364df9695773f730fba59aa4796cf330b638b30548d6b437f1ea0'
    'bfc0c4bc7e4c835d47cfdf82da3a5ff48a9e5cb5071c440fb4bf901ab623e567'
    'ec49170ce2f1d1feea972ce259ad344184cd3fefa13a3df0dac142a8845b4c78'
    
    '6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0'
    '754d6107a306311e15a1db6a1cc031b81691c8b9865e8809ac60ca6f184c957c'
)

# We don't want to strip anything from the static libraries
# We want to keep all binaries orginal (Cisco is goofy)
options=(!strip)
install=pt.install

prepare() {
    # prepare openssl-1.0
    cd "$srcdir/openssl-$_openssl_ver"
    
    # remove rpath: https://bugs.archlinux.org/task/14367
    patch -p0 -i "$srcdir/openssl-no-rpath.patch"
    
    # do not include symbol versioning patch
}

build() {
    # build openssl-1.0
    cd "$srcdir/openssl-$_openssl_ver"
    
    if [ "${CARCH}" == 'x86_64' ]; then
        # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
        export CC='gcc -m32'
        export CXX='g++ -m32'
        export LDFLAGS="-m32 ${LDFLAGS}"
        export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    fi
    
    # mark stack as non-executable: https://bugs.archlinux.org/task/12434
    ./Configure --prefix=/ --openssldir=/etc/ssl --libdir=lib \
        shared no-ssl3-method ${optflags} \
        linux-elf \
        "-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"
    
    make MAKEDEPPROG="${CC}" depend
    make
}

package() {
    # install packettracer files
    cd "${srcdir}/PacketTracer62Student"
    
    local install_dir="${pkgdir}/usr/share/packettracer"
    
    mkdir -p "${install_dir}/"{art,backgrounds,bin,extensions,help,LANGUAGES,lib,saves,sounds,templates}
    
    cp -r ./art/* "${install_dir}/art"
    cp -r ./backgrounds/* "${install_dir}/backgrounds"
    cp -r ./bin/* "${install_dir}/bin"
    cp -r ./extensions/* "${install_dir}/extensions"
    cp -r ./LANGUAGES/* "${install_dir}/LANGUAGES"
    cp -r ./saves/* "${install_dir}/saves"
    cp -r ./sounds/* "${install_dir}/sounds"
    cp -r ./templates/* "${install_dir}/templates"
    cp -r ./lib/* "${install_dir}/lib"
    
    # Help Files that are optinal uncomment to include them (55 MB)
    # cp -r ./help/* "${install_dir}/help"
    
    # Mime Info for PKA, PKT, PKZ
    install -D -m644 ./bin/Cisco-pka.xml "${pkgdir}/usr/share/mime/packages/Cisco-pka.xml"
    install -D -m644 ./bin/Cisco-pkt.xml "${pkgdir}/usr/share/mime/packages/Cisco-pkt.xml"
    install -D -m644 ./bin/Cisco-pkz.xml "${pkgdir}/usr/share/mime/packages/Cisco-pkz.xml"
    
    rm "${install_dir}/bin/Cisco-pka.xml"
    rm "${install_dir}/bin/Cisco-pkt.xml"
    rm "${install_dir}/bin/Cisco-pkz.xml"
    
    # Install Mimetype Icons
    install -D -m644 ./art/pka.png "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-pka.png"
    install -D -m644 ./art/pkt.png "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-pkt.png"
    install -D -m644 ./art/pkz.png "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/application-x-pkz.png"
    
    # EULA
    install -D -m644 eula.txt "${pkgdir}/usr/share/licenses/$pkgname/eula.txt"
    
    # Shell script to start PT and tell it to use included qt files
    # Arch's QT causes PT to crash when saving!
    install -D -m755 "${srcdir}/packettracer" "${install_dir}/packettracer"
    
    # Symlink to /usr/bin
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s /usr/share/packettracer/packettracer "${pkgdir}/usr/bin/packettracer"
    
    # Improved version of Cisco's linguist script
    install -D -m755 "${srcdir}/linguist" "${install_dir}/linguist"
    
    # Add enviroment variable
    install -D -m755 "${srcdir}/packettracer.sh" "${pkgdir}/etc/profile.d/packettracer.sh"
    
    # Desktop File
    install -D -m644 ./bin/Cisco-PacketTracer.desktop "${pkgdir}/usr/share/applications/Cisco-PacketTracer.desktop"
    sed 's,/usr/local/PacketTracer6,/usr/share/packettracer,' -i "${pkgdir}/usr/share/applications/Cisco-PacketTracer.desktop"
    rm "${install_dir}/bin/Cisco-PacketTracer.desktop"
    
    
    # install openssl-1.0 files
    mkdir -p "$srcdir/openssl-tmp"
    
    cd "$srcdir/openssl-$_openssl_ver"
    make INSTALL_PREFIX="$srcdir/openssl-tmp" install_sw
    
    mv "$srcdir/openssl-tmp/lib/libcrypto.so.1.0.0" "$install_dir/lib/"
    mv "$srcdir/openssl-tmp/lib/libssl.so.1.0.0" "$install_dir/lib/"
}
