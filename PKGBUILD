# Maintainer: crowf <crowforkotlin@gmail.com>
pkgname=fcitx5-theme-mellow-fixed
pkgver=1.0.1
pkgrel=1
pkgdesc='Repaired Mellow fcitx5 themes with PNG textures and readable candidate highlights'
arch=('any')
url='https://github.com/crowforkotlin/crowf-fcitx5'
license=('MIT' 'BSD-2-Clause')
depends=('fcitx5')
makedepends=('python' 'python-pillow')
provides=('fcitx5-mellow-themes')
conflicts=('fcitx5-mellow-themes-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
# Deliberately not a hash: a tag archive contains this very file, so it cannot
# contain its own sha256. packaging/release.sh replaces this line with the real
# checksum of the published archive before the AUR sees it.
sha256sums=('7d5f6434e0bd72b5936438453293974cbd86b7cb430aae3fd6702d49638e479a')

check() {
    python3 "$srcdir/crowf-fcitx5-$pkgver/tools/fix-contrast.py" \
        --check "$srcdir/crowf-fcitx5-$pkgver"/themes/mellow-*
}

package() {
    local theme variant dest
    for theme in graphite sakura vermilion wechat youlan; do
        for variant in '' '-dark'; do
            dest="$pkgdir/usr/share/fcitx5/themes/mellow-$theme$variant"
            install -d "$dest"
            install -m644 \
                "$srcdir/crowf-fcitx5-$pkgver/themes/mellow-$theme$variant/theme.conf" \
                "$srcdir/crowf-fcitx5-$pkgver/themes/mellow-$theme$variant/"*.png \
                "$srcdir/crowf-fcitx5-$pkgver/themes/mellow-$theme$variant/"*.svg \
                "$dest/"
        done
    done

    install -Dm644 "$srcdir/crowf-fcitx5-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/crowf-fcitx5-$pkgver/themes/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-mellow"
}
