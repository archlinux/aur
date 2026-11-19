# Maintainer: Nathan Chere <aur@nathanchere.com.au>

pkgname=linphone-desktop
pkgver=6.2.4
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
sha512sums=('62743a72a5b92c8a1df133e93c21f22d08955e0b06a634f05e86fcd9aaac553903d83a08e46bac68154d3d135391f0bfdb25b2487246d05dcfc06d4e64bef5da'
            '88c100123d9a65a61ce88134a4f6c7ddc06bf43ca109c96e21e495b264e881458be51b3f22a8cdffbc03bc7e758188e0f7bf8c7245a1f227910efd09d8219282')
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
