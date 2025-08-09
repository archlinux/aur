# Maintainer: texas0295 <texas0295@outlook.com>

_reponame="Solian"
pkgname=solian
pkgver=3.1.0+120
pkgrel=1
pkgdesc="Next Generation Network Center"
arch=('x86_64')
url="https://solsynth.dev"
license=('AGPL3')

depends=(
    'gtk3'
    'libnotify'
    'gstreamer'
    'libayatana-appindicator'
    'libayatana-indicator'
    'libkeybinder3'
    'mpv'
    'libsecret'
)
makedepends=(
    'git'
    'flutter'
    'clang'
    'cmake'
    'ninja'
)
provides=('solian')
conflicts=('solian' 'solian-bin' 'solian-bin-git')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Solsynth/${_reponame}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('14457e49897e028ed325b85326dd17df313c9d6cd657b43040f7bdf128c31d66')

options=('!debug')

_binname="island"
_pkgver_fixed="${pkgver//+/-}"
_srcdir="$_reponame-$_pkgver_fixed"

prepare() {
    export PUB_CACHE="$srcdir/pub_cache"
    cd "$srcdir/$_srcdir"
    sed -i 's/-Werror/-Wextra/g' linux/CMakeLists.txt

    flutter clean
    flutter pub get
    flutter precache --linux
}

build() {
  export PUB_CACHE="$srcdir/pub_cache"
  export CMAKE_BUILD_PARALLEL_LEVEL=${CMAKE_BUILD_PARALLEL_LEVEL:-4}
  cd "$srcdir/$_srcdir"

  flutter build linux --no-pub --release -v
}

package() {

    cd "$srcdir/$_srcdir"

    install -dm755 "$pkgdir/usr/lib/solian"
    cp -r build/linux/x64/release/bundle/* "$pkgdir/usr/lib/solian/"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/solian" << EOF
#!/bin/sh
cd /usr/lib/solian
exec ./${_binname} "\$@"
EOF

    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    install -Dm644 "assets/icons/icon-padded.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/solian.png"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/solian.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Version=1.0
Name=Solian
Comment=Next Generation Network Center (unstable)
Exec=solian %u
Icon=solian
Terminal=false
Categories=Network;InstantMessaging;
EOF

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
