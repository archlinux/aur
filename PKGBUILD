# Maintainer: NexusXe <nex@nexusxe.com>
# Tracks the Arch extra/btop package and applies Intel xe GPU support patches on top.

pkgname=btop-intel-git
pkgver=1.4.7.r1
pkgrel=1
pkgdesc='A monitor of system resources, bpytop ported to C++, with Intel xe GPU support'
arch=(x86_64)
url='https://github.com/aristocratos/btop'
license=(Apache-2.0)
depends=(glibc
         hicolor-icon-theme
         libgcc
         libstdc++)
makedepends=(git
             linux-api-headers
             lowdown
             rocm-smi-lib)
optdepends=('rocm-smi-lib: AMD GPU support')
provides=("btop=${pkgver%.r*}")
conflicts=(btop)
source=(btop::git+https://github.com/aristocratos/btop.git
        arch-btop::git+https://gitlab.archlinux.org/archlinux/packaging/packages/btop.git
        0001-xe-backend.patch
        0002-xe-vram.patch
        0003-xe-temp.patch
        0004-xe-encdec.patch)
sha256sums=('SKIP'
            'SKIP'
            'f206650c7c0a827ae2ac0ffb605d4d3eb4a69662907b3d5d134677d21dafafa1'
            '39666d93381df14e4201f33cad08a27098a96836139043c68d63a9c740ae7497'
            '476e10905703e691f1ee6d05e2f9f4482afe5b31ece70e1c7c24fc22bb2039cc'
            '81baf11b1398910beef445c3e68b61ad3397df0ab5729c24b587877aa5255d9a')

_archvar() {
	sed -n "s/^$1=//p" "$srcdir/arch-btop/PKGBUILD"
}

pkgver() {
	printf '%s.r%s' "$(_archvar pkgver)" "$(_archvar pkgrel)"
}

prepare() {
	cd btop
	git checkout -q "v$(_archvar pkgver)"
	local src
	for src in "${source[@]}"; do
		[[ $src == *.patch ]] && patch -Np1 -i "$srcdir/$src"
	done
}

build() {
	cd btop
	make all
}

package() {
	cd btop
	make DESTDIR="$pkgdir" PREFIX=/usr install
	make DESTDIR="$pkgdir" PREFIX=/usr setcap
}
