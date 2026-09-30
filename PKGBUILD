# Maintainer: NexusXe <nex@nexusxe.com>
# Tracks the Arch extra/btop package and applies Intel xe GPU support patches on top.

pkgname=btop-intel-git
pkgver=1.4.7.r1
pkgrel=2
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
            'c8592157103f8c28344775d31f9fa34f49c83cdf80bb3d5a98d256ae2427b374'
            'ea9d42d29016f4a0704d462642703ef493788da840e36480c2f295c33abc3557'
            'c77bc18d45ed4fe4deb1a71a3ccbf578a4dc42391582ce4e498e5fcbecb6feaf'
            'bc3d592d5c4917631aee069f99e1d7d92d0fcd7b04fc2e7654e25bcaf1bb3a71')

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
