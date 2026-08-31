# Maintainer: pounceandmiss <pounceandmiss@proton.me>

pkgname=anotherim-desktop-git
pkgver=0.5.127.r32.gd5661fe8
pkgrel=1
pkgdesc="AnotherIM Desktop - a modern XMPP/Jabber client, fork of Dino+"
arch=('x86_64')
url="https://dev.narayana.im/anotherim/anotherim-desktop"
license=('GPL-3.0-or-later')
depends=('glib2' 'glib-networking' 'gtk4' 'gpgme'
         'libgee' 'libgcrypt' 'libomemo-c' 'curl' 'sqlcipher' 'qrencode'
         'gst-plugins-base'
         'gst-plugins-good' 'gst-plugin-gtk'
         'libnice' 'libsrtp' 'libadwaita' 'libcanberra')
makedepends=('git' 'cmake' 'vala' 'ninja')
provides=('anotherim-desktop')
conflicts=('dino' 'dino-plus' 'dino-plus-git' 'dino-git')
source=("${pkgname}::git+https://dev.narayana.im/anotherim/anotherim-desktop.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    # Workaround for 7db7a0bc: dino-chain-link-symbolic.svg was removed but
    # left in CMakeLists.txt's RESOURCE_LIST, breaking the build. Drop once fixed upstream.
    sed -i '/icons\/scalable\/actions\/dino-chain-link-symbolic\.svg/d' main/CMakeLists.txt
}

build() {
    cd "$pkgname"
    cmake -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DENABLED_PLUGINS="notification-sound" \
        -DDISABLED_PLUGINS="phone-ringer" \
        -DNO_DEBUG=yes \
        -DPLUGIN_RTP_WEBRTC_AUDIO_PROCESSING=no \
        -DBUILD_TESTS=ON \
        -Wno-dev
    cmake --build build
}

check() {
    cd "$pkgname"
    build/xmpp-vala-test
    build/libdino-test
    build/omemo-test
    build/http-files-test
}

package() {
    cd "$pkgname"
    DESTDIR="$pkgdir" cmake --build build --target=install
}
