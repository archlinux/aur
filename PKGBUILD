# Maintainer: pounceandmiss <pounceandmiss@proton.me>

pkgname=anotherim-desktop-git
pkgver=0.5.104.r0.g466dfcec
pkgrel=1
pkgdesc="AnotherIM Desktop - a modern XMPP/Jabber client, fork of Dino+"
arch=('x86_64')
url="https://dev.narayana.im/anotherim/anotherim-desktop"
license=('GPL-3.0-or-later')
depends=('glib2' 'glib-networking' 'gtk4' 'gpgme'
         'libgee' 'libgcrypt' 'libomemo-c' 'libsoup3' 'sqlite' 'qrencode'
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
        -DUSE_SOUP3=yes \
        -Wno-dev
    cmake --build build
}


package() {
    cd "$pkgname"
    DESTDIR="$pkgdir" cmake --build build --target=install
}
