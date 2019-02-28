# Mantainer: Giusy Margarita <kurmikon at libero dot it>
# Contributor: Jonian Guveli <jonian at hardpixel dot eu>
# Contributor: Jan Magnus Brevik <janmbrevik at gmail dot com>
# Contributor: Rubén Fdes Moreira <tmp-meteque at openmailbox dot com>
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: MacCyber <jonas dot enge at gmail dot com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Jonas Heinrich <onny at project-insanity dot org>
# Contributor: Antti Hautaniemi <an7oine at me dot com>

_ubuntuver=16.04

pkgname=acestream-engine-stable
pkgver=3.1.16
pkgrel=1
pkgdesc="P2P utility for efficient data storage and transfer (stable version)"
arch=("x86_64")
url="http://acestream.org/"
license=("custom")
depends=(
    "net-tools" 
    "openssl-1.0" 
    "python2-apsw" 
    "python2-lxml" 
    "python2-setuptools" 
    "python2-typing" 
    "python2-xlib")
optdepends=("python2-libappindicator: GTK2 GUI")
provides=("acestream-engine")
conflicts=("acestream-engine")
backup=("opt/acestream/acestream.conf")
install="acestream-engine.install"
source=(
    "acestream-engine.service"
    "$pkgname-$pkgver.tar.gz::http://dl.acestream.org/linux/acestream_${pkgver}_ubuntu_${_ubuntuver}_x86_64.tar.gz"
    "python2-m2crypto-0.24.0.tar.xz::https://archive.archlinux.org/packages/p/python2-m2crypto/python2-m2crypto-0.24.0-4-x86_64.pkg.tar.xz"
    "LICENSE"
)
sha256sums=(
    "9446e4c36c2e92b4253a1c3fea5fa30d366d46295dcd1f1cac4ddfe8f002fcbe"
    "452bccb8ae8b5ff4497bbb796081dcf3fec2b699ba9ce704107556a3d6ad2ad7"
    "177c22681be64a7533b3303652da8724aa20edcbead87be90765bc5040f4cff5"
    "SKIP"
)

package() {
    mkdir -p "$pkgdir/opt/acestream/"
    mkdir -p "$pkgdir/usr/bin"
    
    cd "$srcdir/acestream_${pkgver}_ubuntu_${_ubuntuver}_$CARCH"
    sed -i "/ROOT=/c\ROOT=\/opt\/acestream" "start-engine"
    
    install -Dm755 "acestreamengine" "$pkgdir/opt/acestream/acestreamengine"
    install -Dm755 "start-engine" "$pkgdir/opt/acestream/start-engine"
    install -Dm644 "$srcdir/acestream-engine.service" "$pkgdir/usr/lib/systemd/system/acestream-engine.service"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/opt/acestream/LICENSE"

    cp -a "acestream.conf" "$pkgdir/opt/acestream/acestream.conf"
    cp -a "data" "$pkgdir/opt/acestream/"
    cp -a "lib" "$pkgdir/opt/acestream/"
    cp -a "$srcdir/usr/lib/python2.7/site-packages/M2Crypto" "$pkgdir/opt/acestream/lib"

    rm "$pkgdir/opt/acestream/lib/lxml-3.7.2-py2.7-linux-x86_64.egg"

    ln -sf "/opt/acestream/start-engine" "$pkgdir/usr/bin/acestreamengine"
}
