# Maintainer: Vendetta1871
pkgname=skvirt-git
pkgver=r7.050db97
pkgrel=1
pkgdesc="Touch-driven on-screen keyboard for fcitx5 on KWin (Wayland)"
arch=('x86_64')
url="https://github.com/Vendetta1871/skvirt"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'layer-shell-qt' 'fcitx5'
         'libime' 'hunspell'
         'kconfig' 'kcoreaddons' 'ki18n' 'kcmutils' 'kirigami')
makedepends=('cmake' 'git' 'pkgconf')
optdepends=('hunspell-en_us: English word suggestions'
            'hunspell-ru: Russian word suggestions')
provides=('skvirt')
conflicts=('skvirt')
source=("skvirt::git+https://github.com/Vendetta1871/skvirt.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/skvirt"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$srcdir/skvirt" -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    install -Dm755 build/skvirt "$pkgdir/usr/bin/skvirt"

    # System Settings module (KCM)
    install -Dm755 build/bin/plasma/kcms/systemsettings/kcm_skvirt.so \
        "$pkgdir/usr/lib/qt6/plugins/plasma/kcms/systemsettings/kcm_skvirt.so"

    sed 's|^Exec=.*|Exec=skvirt|' "$srcdir/skvirt/skvirt.desktop" \
        > "$srcdir/skvirt-packaged.desktop"
    install -Dm644 "$srcdir/skvirt-packaged.desktop" \
        "$pkgdir/usr/share/applications/skvirt.desktop"

    install -Dm644 "$srcdir/skvirt/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
