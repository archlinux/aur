# Maintainer: Nathan Chere <aur@nathanchere.com.au>

pkgname=linphone-desktop
pkgver=5.3.1
pkgrel=2
pkgdesc='A free VoIP and video softphone based on the SIP protocol'
arch=(x86_64)
url='http://linphone.org'
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-networkauth' 'qt6-svg' 'qt6-multimedia' 'qt6-speech' 'qt6-tools' 'libpulse' 'libxcrypt-compat' 'v4l-utils' 'glew')
makedepends=('coreutils' 'git' 'gendesk' 'cmake' 'yasm' 'nasm' 'doxygen' 'perl' 'python-pystache' 'python-six')
source=(
  "git+https://gitlab.linphone.org/BC/public/linphone-desktop.git#tag=${pkgver}"
  "linphone.png::https://gitlab.linphone.org/BC/public/linphone-desktop/-/raw/8dfd384e3df08b200c8eb382b740da6839961bf0/linphone-app/assets/icons/hicolor/128x128/apps/icon.png"
  "linphone_package-cmake.patch"
)
sha512sums=('a7adeec5b8e116ad8504e443429fc8607cc4001f6eeb0a4b2c9eb8f81d1768a8ddec3104649d74a1683e0b934975d27cfd323fcac8ee357df6ae5853ce54a3a5'
            'd6495cdc022b1e4c92b3641cb70347e7e6b6ef47599004de729e908b4876a12540713ab54b588611c99c8025fb9b33e3392573c85c13f72cdaee8bcf7a73d65d'
            '7bc4c74555e7ef3bf65daa136e015e7f338ed63dc65989852754256d813cc859c78174480ee524a5efafc61e9414db76c5ca6abf13d654db696de34c068ed460')
options=()
provides=(linphone=${pkgver})

prepare() {
    cd "$srcdir/linphone-desktop"
    patch -p1 < "$srcdir/linphone_package-cmake.patch"
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
     --name="Linphone Desktop 5" \
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
    echo 'LD_LIBRARY_PATH="/opt/linphone/lib:$LD_LIBRARY_PATH" /opt/linphone/bin/linphone "$@"' >> "$pkgdir/opt/linphone/linphone-launcher"
    chmod +x "$pkgdir/opt/linphone/linphone-launcher"

    mkdir -p "$pkgdir/usr/bin/"
    ln -s /opt/linphone/linphone-launcher "$pkgdir/usr/bin/linphone"
}
