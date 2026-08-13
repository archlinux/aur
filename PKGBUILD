# Maintainer: sfs <sfslinux@gmail.com>

pkgname=mdview-mtx-git
_pkgname=mdview
pkgver=r73.fc2c705
pkgrel=2
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
)
sha256sums=(
    'SKIP'
    '1b805b47674d57686c8f88b0bf699c73802108c2a0774bac39d5d8b75a81058d'
    '52361488f813965dc7155252938c209954b28eab708041572988cae0bcee7846'
    '71e1c884947bfe60bf61cdbbf2eaae73f1534992c7e86d7b252234efefffc9d0'
)

pkgver() {
    cd "$srcdir/$_pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson "$_pkgname" build
    meson compile -C build

    # The Russian translation is not upstream yet, so it is not picked up by
    # po/meson.build and has to be compiled separately.
    msgfmt "$srcdir/ru.po" -o "$srcdir/ru.mo"
}

prepare() {
    patch -d "$srcdir/$_pkgname" -p1 < "$srcdir/fix-render-link-unit-decl.patch"
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
    install -Dm644 "$srcdir/ru.mo" \
        "$pkgdir/usr/share/locale/ru/LC_MESSAGES/mdview.mo"

    # Vendored MIT-licensed components: md4c parser and github-markdown.css.
    install -Dm644 "$srcdir/$_pkgname/md4c-license.md" \
        "$pkgdir/usr/share/licenses/$pkgname/md4c-license.md"
    install -Dm644 "$srcdir/$_pkgname/resources/github-markdown-css-license" \
        "$pkgdir/usr/share/licenses/$pkgname/github-markdown-css-license"
}
