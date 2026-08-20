# Maintainer: Daniele Bartolini <dbartolini crownengine org>

replaces=('pepper')
conflicts=('crown-bin')
pkgname=crown
pkgver=0.64.3
pkgrel=1
pkgdesc="A complete and cross-platform game engine designed for flexibility, performance, and fast-iterations."
arch=(x86_64)
url="https://www.crownengine.org"
license=('MIT' 'GPL3')
depends=('glib2>=2.64.6'
         'gtk3>=3.24'
         'libgl'
         'libpulse'
         'libx11'
         'libxrandr'
         )
makedepends=('python-sphinx'
             'vala'
             )
source=("$pkgname-$pkgver.tar.gz::https://github.com/crownengine/crown/archive/refs/tags/v$pkgver.tar.gz"
        "package-linux-x64-only.patch"
        "crown.sh"
        )
sha256sums=('ee5e6b04918ca04e31768b615be57115b53b9f2f55171de14ec661a5e914fd18'
            '1736b28950909295e2ccec3fee5e737e1cd4d260c9d46f03f3c8bc7b24f57638'
            'a3623e9786261ab6d15e1a07091b2117d2d9cd4d25176209a42392ba512dfe08')
options=('!strip')

prepare() {
    cd "$pkgname-$pkgver"

    patch -Np1 -i "$srcdir/package-linux-x64-only.patch"
}

build() {
    cd "$pkgname-$pkgver"

    scripts/dist/package.sh --noconfirm linux x64
}

package() {
    cd "$pkgname-$pkgver"

    local distdir="dist/$pkgname-$pkgver/partials/$pkgname-$pkgver-linux-x64"
    install -d "$pkgdir/opt"
    cp -a "$distdir" "$pkgdir/opt/$pkgname"

    # Launcher.
    install -D -m755 "$srcdir/crown.sh" "$pkgdir/usr/bin/crown"

    # License.
    install -D -m644 "$distdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # .desktop and icons.
    install -D -m644 "$distdir/org.crownengine.Crown.desktop" "$pkgdir/usr/share/applications/org.crownengine.Crown.desktop"
    install -D -m644 "$distdir/org.crownengine.Crown.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.crownengine.Crown.svg"
}
