# Maintainer: Nathan Chere <aur@nathanchere.com.au>

pkgname=linphone-desktop-call-edition
pkgver=6.0.1
pkgrel=2
pkgdesc='A lighter version of Linphone Desktop based dedicated exclusively to simple voice/video calls'
arch=(x86_64)
url='http://linphone.org'
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-multimedia' 'qt6-networkauth' 'qt6-speech' 'qt6-tools' 'libpulse' 'libxcrypt-compat' 'v4l-utils' 'glew')
makedepends=('coreutils' 'git' 'gendesk' 'cmake' 'meson' 'ninja' 'yasm' 'nasm' 'doxygen' 'perl' 'python-pystache' 'python-six')
source=(
  "git+https://gitlab.linphone.org/BC/public/linphone-desktop.git#tag=${pkgver}-CallEdition"
  "linphone.png::https://gitlab.linphone.org/BC/public/linphone-desktop/-/raw/8dfd384e3df08b200c8eb382b740da6839961bf0/linphone-app/assets/icons/hicolor/128x128/apps/icon.png"
  "linphone_package-cmake.patch"
)
sha256sums=('d111c476f24624c7c91f34269bc92ecf13b10881e846f3c849524e2ff6ef409d'
            '5e73b34c0bb09c77c40ffe1673a67de58aafcec6ef75d4ba2dea6151bca33832'
            'ebb4b36eeab5387a71b45e7de29d478f8197771015fb3a0afb5c0b0bf1c62e09')
provides=(linphone=${pkgver})

prepare() {
    cd "$srcdir/linphone-desktop"
    git submodule update --init --recursive
    patch --batch --fuzz=0 -p1 < "$srcdir/linphone_package-cmake.patch"
}

build() {
  cd "$srcdir/linphone-desktop"

  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_PARALLEL_LEVEL=$(nproc) \
      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
      -DCMAKE_CXX_FLAGS="${CXXFLAGS} -Wno-error=deprecated-declarations"
  cmake --build . --target install --parallel $(nproc) --config RelWithDebInfo
 
  cd "$srcdir"
  gendesk -f -n \
     --pkgname="$pkgname" \
     --pkgdesc="$pkgdesc" \
     --name="Linphone Desktop 6 Call Edition" \
     --genericname="VoIP Client" \
     --categories=Network \
     --icon="${pkgname}.png" \
     --exec="/usr/bin/${pkgname}" \
     --terminal=false \
     --startupnotify=true \
     --comment "Linphone"
}

package() {
    mkdir -p "$pkgdir/opt/${pkgname}/"
    cp -r "$srcdir/linphone-desktop/build/OUTPUT/." "$pkgdir/opt/${pkgname}/"

    mkdir -p "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

    mkdir -p "$pkgdir/usr/share/pixmaps/"
    install -Dm644 "$srcdir/linphone.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

    cat <<'EOF' > "$pkgdir/opt/${pkgname}/${pkgname}-launcher"
#!/bin/bash
LD_LIBRARY_PATH="/opt/${pkgname}/lib:$LD_LIBRARY_PATH" /opt/${pkgname}/bin/linphone "$@"
EOF
    chmod +x "$pkgdir/opt/${pkgname}/${pkgname}-launcher"

    mkdir -p "$pkgdir/usr/bin/"
    ln -s "/opt/${pkgname}/${pkgname}-launcher" "$pkgdir/usr/bin/${pkgname}"
}
