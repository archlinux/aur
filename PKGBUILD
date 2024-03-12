# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>
# Contributor: David P. <megver83@parabola.nu>

pkgname=linphone-desktop
pkgver=5.2.2
pkgrel=1
pkgdesc='A free VoIP and video softphone based on the SIP protocol'
arch=(x86_64)
url='http://linphone.org'
license=(GPL)
depends=('qt5-base' 'qt5-multimedia' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-speech' 'libxcrypt-compat' 'v4l-utils' 'glew')
makedepends=('meson' 'coreutils' 'git' 'gendesk' 'cmake' 'yasm' 'nasm' 'doxygen' 'perl' 'python-pystache' 'python-six' 'libpulse' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-tools')
source=("git+https://github.com/BelledonneCommunications/linphone-desktop.git#commit=0836381"
        "linphone.png::https://gitlab.linphone.org/BC/public/linphone-desktop/-/raw/8dfd384e3df08b200c8eb382b740da6839961bf0/linphone-app/assets/icons/hicolor/128x128/apps/icon.png"
        )
sha512sums=('SKIP'
            'd6495cdc022b1e4c92b3641cb70347e7e6b6ef47599004de729e908b4876a12540713ab54b588611c99c8025fb9b33e3392573c85c13f72cdaee8bcf7a73d65d'
)
options=()
provides=(linphone=${pkgver})

prepare() {
  cd "$srcdir/linphone-desktop"
  git submodule update --init --recursive
}

build() {   
  cd "$srcdir/linphone-desktop"
  mkdir -p build build/OUTPUT && cd build

  cmake .. -DCMAKE_BUILD_PARALLEL_LEVEL=$(nproc) -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build . --target install --parallel $(nproc) --config RelWithDebInfo

  cd "$srcdir"
  gendesk -f -n \
     --pkgname="$pkgname" \
     --pkgdesc="$pkgdesc" \
     --name=Linphone \
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

    # Add linphone's own lib folder to LD_LIBRARY_PATH
    echo "#!/bin/bash" > "$pkgdir/opt/linphone/linphone-launcher"
    echo 'LD_LIBRARY_PATH="/opt/linphone/lib:$LD_LIBRARY_PATH" /opt/linphone/bin/linphone "$@"' >> "$pkgdir/opt/linphone/linphone-launcher"
    chmod +x "$pkgdir/opt/linphone/linphone-launcher"

    mkdir -p "$pkgdir/usr/bin/"
    ln -s /opt/linphone/linphone-launcher "$pkgdir/usr/bin/linphone"
}
