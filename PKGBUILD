# Maintainer: Keith Patton <archlinux at kaipee dot co dot uk>

pkgname=linphone-desktop-gh-git
pkgver=6.2.4
pkgrel=1
pkgdesc='A free VoIP and video softphone based on the SIP protocol (GitHub releases)'
arch=(x86_64)
url='http://linphone.org'
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-networkauth' 'qt6-svg' 'qt6-multimedia' 'qt6-speech' 'qt6-tools' 'libpulse' 'libxcrypt-compat' 'v4l-utils' 'glew')
makedepends=('coreutils' 'git' 'gendesk' 'cmake' 'meson' 'ninja' 'yasm' 'nasm' 'doxygen' 'perl' 'python-pystache' 'python-six')
source=(
  "git+https://github.com/BelledonneCommunications/linphone-desktop.git#tag=${pkgver}"
  "linphone.png::https://raw.githubusercontent.com/BelledonneCommunications/linphone-desktop/refs/heads/master/Linphone/data/icon/hicolor/128x128/apps/icon.png"
)
sha512sums=(
  'SKIP'
  '532aa6e0c37d874eb9f080991bdbdaa7dd1085b37465bda1ecca83c046c9ab756308db28de7b4e7fd301bb161e2f7d1f109cc6931e422d1d85e161b2f8add628'
)
options=(!lto)
provides=(linphone=${pkgver})

prepare() {
    cd "$srcdir/linphone-desktop"
    git submodule update --init --recursive
}

build() {
  cd "$srcdir/linphone-desktop"

  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_PARALLEL_LEVEL=$(nproc) -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build . --target install --parallel $(nproc) --config RelWithDebInfo

  cd "$srcdir"
  gendesk -f -n \
     --pkgname="linphone-desktop" \
     --pkgdesc="$pkgdesc" \
     --name="Linphone Desktop 6" \
     --genericname="VoIP Client" \
     --categories="Network;Telephony" \
     --icon=linphone.png \
     --exec="/opt/linphone/linphone-launcher %u" \
     --terminal=false \
     --startupnotify=true \
     --comment "Linphone" \
     --mimetypes="x-scheme-handler/tel;x-scheme-handler/sip;x-scheme-handler/sips;x-scheme-handler/sip-linphone;x-scheme-handler/callto" 

  sed -i 's/;;/;/g' linphone-desktop.desktop
}

package() {
    mkdir -p "$pkgdir/opt/linphone/"
    cp -r "$srcdir/linphone-desktop/build/OUTPUT/." "$pkgdir/opt/linphone/"

    mkdir -p "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/linphone-desktop.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/pixmaps/"
    install -Dm644 "$srcdir/linphone.png" "$pkgdir/usr/share/pixmaps/"

    echo "#!/bin/bash" > "$pkgdir/opt/linphone/linphone-launcher"
    echo 'export LD_LIBRARY_PATH="/opt/linphone/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"' >> "$pkgdir/opt/linphone/linphone-launcher"
    echo 'exec /opt/linphone/bin/linphone "$@"' >> "$pkgdir/opt/linphone/linphone-launcher"
    chmod +x "$pkgdir/opt/linphone/linphone-launcher"

    mkdir -p "$pkgdir/usr/bin/"
    ln -s /opt/linphone/linphone-launcher "$pkgdir/usr/bin/linphone"
}
