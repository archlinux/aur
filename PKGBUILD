pkgname=mold-git
pkgver=r2562.6319135
pkgrel=1
pkgdesc="Fast linker"
arch=(x86_64)
url="https://github.com/rui314/mold"
license=("unknown")
depends=(xxhash mimalloc gcc-libs openssl zlib)
makedepends=(clang cmake git)
source=("mold::git+https://github.com/rui314/mold")
sha256sums=("SKIP")
reponame="mold"

pkgver() {
	cd $srcdir/$reponame
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $reponame
	make -C "${srcdir}/${reponame}" -j "$(nproc)" LTO=1 SYSTEM_MIMALLOC=1
}

package() {
	cd $reponame
	make -C "${srcdir}/${reponame}" LTO=1 SYSTEM_MIMALLOC=1 DESTDIR="${pkgdir}" install
	ln -snf mold "${pkgdir}/usr/bin/ld.mold"
	# Mold checks for the lib alongside itself, which is rather silly
	cp "${pkgdir}/usr/lib/mold/mold-wrapper.so" "${pkgdir}/usr/bin"
}
