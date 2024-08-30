# Maintainer: Eugene Dvoretsky <radioxoma at gmail dot com>
pkgname=pilorama-git
pkgver=v4.0.0.r0.g702ec13
pkgrel=1
epoch=
pkgdesc="Advanced timeboxing pomodoro timer"
arch=('x86_64')
url="https://github.com/eplatonoff/pilorama"
license=('GPLv3')
groups=()
depends=('qt6-declarative' 'qt6-multimedia' 'qt6-svg')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=('pilorama')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/eplatonoff/pilorama")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "$pkgname/src" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    # DESTDIR="$pkgdir" cmake --install build
    install -Dm755 "$srcdir/build/Pilorama" -T "$pkgdir/usr/bin/pilorama"

    for res in '8x8' '16x16' '20x20' '22x22' '24x24' '32x32' '36x36' '40x40' '42x42' '48x48' '64x64' '72x72' '80x80' '96x96' '192x192' '128x128' '256x256' '384x384' '512x512' ;
      do
        install -Dm644 "$srcdir/$pkgname/src/assets/app_icons/hicolor/${res}.png" "$pkgdir/usr/share/icons/hicolor/${res}/apps/pilorama.png"
      done

    install -Dm644 "$srcdir/$pkgname/src/assets/app_icons/hicolor/app.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/pilorama.svg"
    install -Dm644 "$srcdir/$pkgname/src/pilorama.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
