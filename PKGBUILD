# Maintainer: sfs <sfslinux@gmail.com>

pkgname=mdview-mtx-git
_pkgname=mdview
pkgver=r73.fc2c705
pkgrel=4
pkgdesc='GTK markdown viewer and CLI converter. GTK3 version.'
url='https://github.com/step-/mdview'
arch=('x86_64' 'aarch64')
license=('GPL-2.0-or-later' 'MIT')
depends=('gtk3' 'glib2' 'pango' 'hicolor-icon-theme')
makedepends=('git' 'meson' 'ninja' 'help2man' 'gettext')
provides=('mdview')
conflicts=('mdview')
source=(
    "git+$url"
    mdview.desktop
    ru.po
    fix-render-link-unit-decl.patch
    mdview-inline-editor.patch
    README.md
    README.ru.md
)
sha256sums=(
    'SKIP'
    '1b805b47674d57686c8f88b0bf699c73802108c2a0774bac39d5d8b75a81058d'
    'fb62810229f81c8c266045c7325a66f752e0ca3598ad85fb1c5f0991bdcf5cfa'
    '71e1c884947bfe60bf61cdbbf2eaae73f1534992c7e86d7b252234efefffc9d0'
    'a21ee53c2c601c7ceabc13baa8c2689363f82b72bdee30c12f731e280c087bea'
    '2b1e9850a57acf471cfe739ae9e462e275ddb4639c9d97d403f4d9d0ad24d9d5'
    '0c063a7f4d7caa580ff09f19e00739ffaa1e4f6243e13c9b4f0e2cfe09c73f7b'
)

prepare() {
    patch -d "$srcdir/$_pkgname" -p1 < "$srcdir/fix-render-link-unit-decl.patch"

    # mdview-inline-editor.patch was verified against upstream commit
    # fc2c705ba23893415ff82138b36b790b61b78524.
    git -C "$srcdir/$_pkgname" apply --3way "$srcdir/mdview-inline-editor.patch"

    install -Dm644 "$srcdir/ru.po" "$srcdir/$_pkgname/po/ru.po"
    if ! grep -qx 'ru' "$srcdir/$_pkgname/po/LINGUAS"; then
        printf 'ru\n' >> "$srcdir/$_pkgname/po/LINGUAS"
    fi
}

pkgver() {
    cd "$srcdir/$_pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson "$_pkgname" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    # Upstream ships data/applications/mdview.desktop, but the top-level
    # meson.build has no subdir('data'), so nothing installs it. The copy
    # bundled here also adds translations and a valid main Categories entry.
    install -Dm644 "$srcdir/mdview.desktop" \
        "$pkgdir/usr/share/applications/mdview.desktop"
    install -Dm644 "$srcdir/$_pkgname/data/icons/hicolor/scalable/apps/mdview.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/mdview.svg"

    # What this package adds on top of upstream, in English and Russian.
    install -Dm644 "$srcdir/README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/README.ru.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.ru.md"

    # Vendored MIT-licensed components: md4c parser and github-markdown.css.
    install -Dm644 "$srcdir/$_pkgname/md4c-license.md" \
        "$pkgdir/usr/share/licenses/$pkgname/md4c-license.md"
    install -Dm644 "$srcdir/$_pkgname/resources/github-markdown-css-license" \
        "$pkgdir/usr/share/licenses/$pkgname/github-markdown-css-license"
}
