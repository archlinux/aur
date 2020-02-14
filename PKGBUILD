# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Matt Coffin <mcoffin13@gmail.com>
pkgname=vulkan-device-filter-git
pkgver=v0.0.1.r8.7a7a8c1
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://gitlab.com/mcoffin/vulkan-device-filter"
license=('MIT')
groups=()
depends=('vulkan-icd-loader')
makedepends=('git' 'vulkan-headers' 'cargo') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://gitlab.com/mcoffin/vulkan-device-filter.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	# printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	RUSTFLAGS="$RUSTFLAGS -C relocation-model=pic" cargo build --release
}

check() {
	cd "$srcdir/${pkgname%-git}"
	RUSTFLAGS="$RUSTFLAGS -C relocation-model=pic" cargo test --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m755 -t $pkgdir/usr/share/vulkan/explicit_layer.d target/release/libvulkan_device_filter_layer.so
	install -D -m644 -t $pkgdir/usr/share/vulkan/explicit_layer.d vulkan-device-filter-layer/VkLayer_device_filter.json
}
