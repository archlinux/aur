# Maintainer: Neo0player <neo00player@gmail.com>

pkgname=gentoo-sources
pkgver=6.15
pkgrel=0
pkgdesc="🌊 Linux kernel sources with gentoo patches installed to /usr/src/linux-6.15 🌊"
arch=('any')
url="https://wiki.gentoo.org/wiki/Kernel"
license=('GPL2')
makedepends=('coreutils' 'tar' 'make' 'patch')
options=('emptydirs' '!strip')

# Source
source=(
	"https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/linux-$pkgver.tar.xz"
	"https://dev.gentoo.org/~mpagano/genpatches/tarballs/genpatches-$pkgver-5."{base,extras}.tar.xz
)

# B2sums
b2sums=(
	'465596c6dc053ff3a3966302a906d3edb4f7ee1ef82f8c20b96360196d3414f5b1deeafa67b8340fcdecd3617280ba9b756d7073ad15c707865e256397b4af53'
	'49e319e29579d90a8a6848a7fa888b02966029e622eae1fe522be8518344c7bf0b356b21f36b052b5b69d629973b08d706c33cfd66b0707117dc7e39aa8db40e'
	'3e926d5600eb4f2943336af9be38f2f708dd6cac5ee0da59da7fb058f36ea94fa3091d0ae913a27d94ad652a1310131ed73aea81a2cf5f91cb82337d56d2334f'
)

# Package fn
package() {
	# Vars
	linux_dir="$pkgdir/usr/src/linux-$pkgver"

	# Create dirs
	mkdir -p "$linux_dir"

	# Extract linux kernel source and stripping top level dir
	tar -xpf "linux-$pkgver.tar.xz" --xattrs-include="*.*" --numeric-owner --strip-components=1 -C "$linux_dir"

	# Change dir
	cd "$linux_dir"

	# Make mrproper
	make mrproper

	# Remove ccache dir
	rm -rf "$CCACHE_DIR"

	# Apply gentoo patches
	for patch in "$srcdir/"*.patch; do
		patch -p1 -i "$patch"
	done
}
