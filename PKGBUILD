# Maintainer: texas0295 <texas0295@outlook.com>

_reponame="HyperNet.Surface"
pkgname=solian-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Next Generation Network Center (unstable)"
arch=('x86_64')
url="https://solsynth.dev"
license=('AGPL-3.0')
depends=(
    'libnotify'
    'gtk3'
    'mpv'
    'libkeybinder3'
    'gstreamer'
    'libayatana-appindicator'
    'libayatana-indicator'
)
makedepends=(
    'git'
    'ninja'
    'flutter-tool'
    'flutter-target-linux'
    'cmake'
    'clang'
)
conflicts=(
    'solian-bin-git'
    'solian-bin'
    'solian'
)
options=('!strip')

source=("git+https://github.com/Solsynth/${_reponame}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_reponame"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    export PUB_CACHE="$srcdir/pub_cache"
    cd "$srcdir/$_reponame"
    flutter pub get
}

build() {
    export PUB_CACHE="$srcdir/pub_cache"
    cd "$srcdir/$_reponame"

    flutter build linux --no-pub --release

    # Prepare AppDir for AppImage
    mkdir -p Solian.AppDir
    cp -r build/linux/x64/release/bundle/* Solian.AppDir/
    cp -r buildtools/appimage_config/* Solian.AppDir/
    cp assets/icon/icon-light-radius.png Solian.AppDir/
    chmod +x buildtools/appimagetool-x86_64.AppImage
    chmod +x Solian.AppDir/AppRun

    ./buildtools/appimagetool-x86_64.AppImage Solian.AppDir
}

package() {
    cd "$srcdir/$_reponame"

    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    # Install AppImage
    install -Dm755 "Solian-x86_64.AppImage" "$pkgdir/opt/$pkgname/Solian-x86_64.AppImage"

    # Install icon
    install -Dm644 "./assets/icon/icon-light-radius.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/Solian.png"

    # Link executable
    ln -s "/opt/${pkgname}/Solian-x86_64.AppImage" "${pkgdir}/usr/bin/solian"

    # Desktop entry
    cat > "$pkgdir/usr/share/applications/solian.desktop" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Solian
Comment=$pkgdesc
Exec=solian %u
Icon=Solian
Terminal=false
Categories=Network;InstantMessaging;Chat;MatrixClient;
EOF
}
