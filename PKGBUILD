# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=buchable-git
_pkgname=buchable
pkgver=r353.2e4cd2a
pkgrel=1
pkgdesc="The unofficial cross-platform app for Audiobookshelf"
arch=('x86_64')
#Using Branch on my Fork until PR is Merged
url="https://github.com/0xGingi/abs_flutter"
license=('BSD-3-Clause')
depends=(
    'gtk3'
    'libsecret'
    'mpv'
    'libayatana-appindicator'
    'xdg-user-dirs'
)
makedepends=(
    'flutter'
    'clang'
    'cmake'
    'ninja'
    'pkgconf'
    'xz'
    'gtk3'
    'git'
)
source=("git+$url#branch=linux-build")
sha256sums=('SKIP')
provides=('buchable')
conflict=('buchable')

pkgver() {
    cd "${srcdir}/abs_flutter"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/abs_flutter"
    flutter pub get
}

build() {
    cd "${srcdir}/abs_flutter"
    flutter build linux --release
}

package() {
    cd "${srcdir}/abs_flutter"
    
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/$_pkgname"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    
    cp -r build/linux/x64/release/bundle/* "$pkgdir/usr/lib/$_pkgname/"
    
    cat > "$pkgdir/usr/bin/$_pkgname" << EOF
#!/bin/sh
exec /usr/lib/$_pkgname/abs_flutter "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$_pkgname"
    
    cat > "$pkgdir/usr/share/applications/$_pkgname.desktop" << EOF
[Desktop Entry]
Name=Buchable
Comment=The unofficial cross-platform app for Audiobookshelf
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
Type=Application
Categories=Audio;AudioVideo;Player;
StartupWMClass=buchable
X-GNOME-UsesNotifications=true
MimeType=audio/*;video/*;
EOF
    
    install -Dm644 "assets/images/logo/logo_blue_big_abs.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
