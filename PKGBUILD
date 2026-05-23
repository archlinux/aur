pkgname=hpr
pkgver=0.5
pkgrel=1
pkgdesc="Offline zero-account activity tracker"
arch=('x86_64')
url="https://github.com/plexescor/HPR"
license=('GPL')

depends=('glibc')
makedepends=('cmake' 'git' 'curl' 'tar')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "HPR-$pkgver"

    chmod +x installDependencies.sh
    ./installDependencies.sh

    cmake -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build -j20
}

package() {
    cd "HPR-$pkgver/build"

    chmod +x installHPRConfigAndUi.sh
    ./installHPRConfigAndUi.sh || true

    install -Dm755 HPR \
        "$pkgdir/usr/bin/hpr"

    install -Dm644 ../assets/logo_256png.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/hpr.png"

    install -Dm644 ../LICENSE.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    mkdir -p "$pkgdir/usr/share/applications"

    cat > "$pkgdir/usr/share/applications/hpr.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=HPR
Comment=Offline zero-account activity tracker
Exec=hpr
Icon=hpr
Terminal=false
Categories=Utility;
StartupNotify=true
EOF
}
