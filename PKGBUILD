# Maintainer: Sujal Vijayaraghavan

pkgname=i8o8
pkgver=0.1.0
pkgrel=0
pkgdesc='Convert Linux binary packages between distribution formats, unprivileged, with a grading verdict engine'
arch=('x86_64' 'aarch64')
url="https://github.com/sujaltv/i8o8"
license=('GPL-2.0-or-later')
depends=('libarchive' 'zstd' 'xz' 'zlib' 'libelf' 'expat' 'squashfs-tools-ng')
makedepends=('meson' 'ninja' 'git' 'scdoc')
source=("https://github.com/sujaltv/i8o8/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9b2eae57427754467d7e84670aaac4d9858141445be0ffbace3d8b9e63dd62df')

build() {
    # buildtype=plain lets makepkg's own hardened CFLAGS/LDFLAGS win, per the
    # Arch meson packaging convention; i8o8 layers its own hardening on top.
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 "$pkgname-$pkgver/LICENCE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
