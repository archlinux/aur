# Maintainer: Xerz <xerz@xerz.one>
pkgname=moss-serpent-git
pkgver=r1115.24b223d
pkgrel=2
pkgdesc="Serpent OS package manager"
arch=('x86_64')
url="https://github.com/serpent-os/moss"
license=('ZLIB')
depends=('curl' 'lmdb' 'xxhash' 'zstd')
makedepends=('git' 'ldc' 'cmake' 'meson' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/serpent-os/moss"
        "git+https://github.com/serpent-os/moss-config"
        "git+https://github.com/serpent-os/moss-core"
        "git+https://github.com/serpent-os/moss-db"
        "git+https://github.com/serpent-os/moss-deps"
        "git+https://github.com/serpent-os/moss-fetcher"
        "git+https://github.com/serpent-os/moss-format"
        "git+https://github.com/serpent-os/moss-vendor"
        "git+https://github.com/dlang-community/D-YAML"
        "git+https://github.com/serpent-os/elf-d"
        "git+https://github.com/serpent-os/lmdb-d"
        "git+https://github.com/dlang-community/tinyendian"
        "git+https://github.com/serpent-os/xxhash-d"
        "git+https://github.com/repeatedly/zstd-d")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

prepare() {
	cd "$srcdir/moss-vendor"
	git submodule init
	git config submodule.dyaml.url              "$srcdir/D-YAML"
	git config submodule.elf-d.url              "$srcdir/elf-d"
	git config submodule.subprojects/lmdb-d.url "$srcdir/lmdb-d"
	git config submodule.tinyendian.url         "$srcdir/tinyendian"
	git config submodule.xxhash-d.url           "$srcdir/xxhash-d"
	git config submodule.zstd-d.url             "$srcdir/zstd-d"
	git submodule update
}

pkgver() {
	cd "$srcdir/${pkgname%-serpent-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-serpent-git}"
	meson --prefix=/usr --buildtype=plain build
	meson compile -C build
}

package() {
	cd "$srcdir/${pkgname%-serpent-git}"
	DESTDIR="$pkgdir" meson install -C build
	install -D -m644 "${srcdir}/${pkgname%-serpent-git}/LICENSES/Zlib.txt" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
