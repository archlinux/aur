# Maintainer: Vendetta1871
pkgname=skvirt
pkgver=0.1.0
pkgrel=1
pkgdesc="Touch-driven on-screen keyboard for fcitx5 on KWin (Wayland)"
arch=('x86_64')
url="https://github.com/Vendetta1871/skvirt"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'layer-shell-qt' 'fcitx5'
         'libime' 'hunspell'
         'kconfig' 'kcoreaddons' 'ki18n' 'kcmutils' 'kirigami')
makedepends=('cmake' 'pkgconf')
optdepends=('hunspell-en_us: English word suggestions'
            'hunspell-ru: Russian word suggestions'
            'whisper-cpp: voice input via whisper-server'
            'fcitx5-commit-git: insert dictated text as one commit instead of key taps')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bc2abd98b0e88d35dcf594c823d77ebd3265449d046730547b97221c0ea72c97')

build() {
    cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    install -Dm755 build/skvirt "$pkgdir/usr/bin/skvirt"

    # System Settings module (KCM)
    install -Dm755 build/bin/plasma/kcms/systemsettings/kcm_skvirt.so \
        "$pkgdir/usr/lib/qt6/plugins/plasma/kcms/systemsettings/kcm_skvirt.so"

    sed 's|^Exec=.*|Exec=skvirt|' "$pkgname-$pkgver/skvirt.desktop" \
        > skvirt-packaged.desktop
    install -Dm644 skvirt-packaged.desktop \
        "$pkgdir/usr/share/applications/skvirt.desktop"

    install -Dm644 "$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
