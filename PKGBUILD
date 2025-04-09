# Maintainer: texas0295 <texas0295@outlook.com>

_reponame="HyperNet.Surface"
pkgbase=solian
pkgname=solian-bin-git
pkgver=63ff6df
pkgrel=1
pkgdesc="Next Generation Network Center (unstable)"
arch=('x86_64')
url="https://solsynth.dev"
license=('AGPL-3.0')
depends=(
    "libnotify"
    "gtk3"
    "mpv"
    "libkeybinder3"
    "gstreamer"
    "libayatana-appindicator>=0.5.93"
    "libayatana-indicator"
    'libnotify'
 
)

options=('!strip')
source=("git+https://github.com/Solsynth/HyperNet.Surface")

sha256sums=('SKIP')

conflicts=(
    "solian-bin-git"
    "solian-bin"
)

makedepends=(
    'git'
    'ninja'
    'flutter-tool'
    'flutter-target-linux'
    'cmake'
    'clang'
)

pkgver(){
    cd "$srcdir/$_reponame"
    git describe --always
}

prepare() {
    export PUB_CACHE="$srcdir/pub_cache"  
    cd "$srcdir/$_reponame"
    flutter doctor -v
    flutter pub get
}

build(){
    export PUB_CACHE="$srcdir/pub_cache"  
    cd "$srcdir/$_reponame"

    CXXFLAGS="-Wno-unused-result" flutter build linux --no-pub --release

    # AppImage
    mkdir Solian.AppDir
    cp -r build/linux/x64/release/bundle/* Solian.AppDir
    cp -r buildtools/appimage_config/* Solian.AppDir
    cp assets/icon/icon-light-radius.png Solian.AppDir
    chmod +x buildtools/appimagetool-x86_64.AppImage
    chmod +x Solian.AppDir/AppRun
    ./buildtools/appimagetool-x86_64.AppImage Solian.AppDir
}

package(){
    cd "$srcdir/$_reponame"

    # Create dirs
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    echo "creat dirs - end"

    # Install AppImage
    install -Dm755 "Solian-x86_64.AppImage" "$pkgdir/opt/$pkgname/Solian-x86_64.AppImage"

    echo "install appimage - end"

    # Install icon
    install -Dm644 "./assets/icon/icon-light-radius.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/Solian.png"

    echo "install icon - end"

    # Link executable
    ln -s "/opt/${pkgname}/Solian-x86_64.AppImage" "${pkgdir}/usr/bin/solian-bin-git"
    
    # Install desktop file
    cat > $pkgdir/usr/share/applications/Solian.desktop << EOF
[Desktop Entry]
Type=Application
Version=$pkgver
Name=Solian
Comment=${pkgdesc}
Exec=solian-bin-git %u
Icon=Solian
Terminal=false
Categories=Network;InstantMessaging;Chat;MatrixClient
EOF
}
