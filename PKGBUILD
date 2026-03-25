# Maintainer: Ryan Walker
pkgname=orbuculum
pkgver=2.2.0
pkgrel=1
pkgdesc='ARM Cortex-M SWO/SWD trace and debug tool suite'
arch=('x86_64')
url='https://github.com/orbcode/orbuculum'
license=('BSD-3-Clause')
depends=('libusb' 'zeromq' 'ncurses' 'libelf' 'zlib' 'zstd')
makedepends=('meson' 'ninja' 'pkgconf')
optdepends=(
    'capstone: disassembly support in orbmortem'
    'sdl2: LCD display support in orblcd'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/orbcode/$pkgname/archive/V$pkgver.tar.gz"
        "https://www.prevanders.net/libdwarf-0.7.0.tar.xz"
        "libdwarf-const-fix.patch"
        "orbuculum-dwarf-error-rename.patch")
sha256sums=('SKIP'
            '23b71829de875fa5842e49f232c8ee1a5043805749738bc61424d9abc1189f38'
            'SKIP'
            'SKIP')

prepare() {
    mkdir -p "$pkgname-$pkgver/subprojects/packagecache"
    ln -sf "$srcdir/libdwarf-0.7.0.tar.xz" "$pkgname-$pkgver/subprojects/packagecache/"
    # Rename _dwarf_error to avoid symbol clash when statically linking libdwarf
    patch -Np1 -d "$pkgname-$pkgver" -i "$srcdir/orbuculum-dwarf-error-rename.patch"
}

build() {
    arch-meson "$pkgname-$pkgver" build -Dlibdwarf:default_library=static
    # Fix const-correctness error with GCC 15
    patch -Np1 -d "$pkgname-$pkgver" -i "$srcdir/libdwarf-const-fix.patch"
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir" --skip-subprojects
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
