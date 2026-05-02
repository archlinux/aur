# Maintainer: Justin Kim <justin.joy.9to5@gmail.com>

pkgname=libchronoid
pkgver=1.0.0
pkgrel=1
pkgdesc='C11 toolkit for time-ordered IDs: KSUID (segmentio wire-compat) + UUIDv7 (RFC 9562)'
arch=('x86_64' 'aarch64')
url='https://github.com/semantic-reasoning/libchronoid'
license=('LGPL-3.0-or-later' 'MIT')
depends=('glibc')
makedepends=('meson' 'ninja' 'gcc')
conflicts=("$pkgname-git")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('85822cf23d18c4e78a15a378c2983144da16ab7201c581fc0774af5ea4ee9444')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    arch-meson . build
    meson compile -C build
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    meson test -C build --print-errorlogs
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    meson install -C build --destdir "$pkgdir"

    # Arch convention places license texts at /usr/share/licenses/$pkgname/.
    # Upstream's meson.build installs LICENSE / LICENSE.MIT / NOTICE under
    # /usr/share/doc/libchronoid/ instead (matches the Debian/FHS doc-dir
    # layout). Symlink the existing files into the Arch path so both
    # `pacman -Qi`'s license display and namcap's license check resolve
    # cleanly without bloating the package with duplicate copies.
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    for f in LICENSE LICENSE.MIT NOTICE; do
        ln -s "../../doc/libchronoid/$f" \
            "$pkgdir/usr/share/licenses/$pkgname/$f"
    done
}
