# Maintainer: archie <archie@narayana.im>

pkgname=anotherim-desktop-git
pkgver=v0.5.104.r0.g466dfcec
pkgrel=1
pkgdesc="AnotherIM Desktop - a modern XMPP/Jabber client, fork of Dino+"
arch=('x86_64')
url="https://dev.narayana.im/anotherim/anotherim-desktop"
license=('GPL-3.0-or-later')
depends=('glib2' 'glib-networking' 'gtk4' 'gpgme'
         'libgee' 'libgcrypt' 'libsoup' 'sqlite' 'qrencode'
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
    git submodule update --init --recursive
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
        -Wno-dev
    cmake --build build
}


package() {
    cd "$pkgname"
    DESTDIR="$pkgdir" cmake --build build --target=install
}
