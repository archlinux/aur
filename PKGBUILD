# Maintainer: Nathan Chere <aur@nathanchere.com.au>

pkgname=linphone-desktop
pkgver=6.2.3
pkgrel=1
pkgdesc='A free VoIP and video softphone based on the SIP protocol'
arch=(x86_64)
url='http://linphone.org'
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-networkauth' 'qt6-svg' 'qt6-multimedia' 'qt6-speech' 'qt6-tools' 'libpulse' 'libxcrypt-compat' 'v4l-utils' 'glew')
makedepends=('coreutils' 'git' 'gendesk' 'cmake' 'meson' 'ninja' 'yasm' 'nasm' 'doxygen' 'perl' 'python-pystache' 'python-six')
source=(
  "git+https://gitlab.linphone.org/BC/public/linphone-desktop.git#tag=${pkgver}"
  "linphone.png::https://gitlab.linphone.org/BC/public/linphone-desktop/-/raw/8dfd384e3df08b200c8eb382b740da6839961bf0/linphone-app/assets/icons/hicolor/128x128/apps/icon.png"
)
sha512sums=('3ad59435c3dfa3cdc30cd1596827c65006eac850ffeb091ac42714054cba414a65db9050a726dcda0b1719912796e800f67fdb064422abd5d51fd40756dbc2cc'
            '3a5431033d40cff112d8db4c3bb9d43d41e5ae20c1c18d4c0ddc207b21f19853951298b23fc656bb464980a3c178717aabf379778c191ab53fcb9d99f2f577fd')
options=()
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
     --pkgname="$pkgname" \
     --pkgdesc="$pkgdesc" \
      --name="Linphone Desktop 6" \
     --genericname="VoIP Client" \
     --categories=Network \
     --icon=linphone.png \
     --exec=/opt/linphone/linphone-launcher \
     --terminal=false \
     --startupnotify=true \
     --comment "Linphone"
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
