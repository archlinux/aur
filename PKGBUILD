# Maintainer: Mohammad Mostafa Farzan <m2_farzan@yahoo.com>
# Acknowledgment: This work is hugely based on `ros2-arch-deps` AUR
# package, maintained by T. Borgert.

pkgname=ros2-galactic
pkgver=2021.05.23
pkgrel=3
pkgdesc="A set of software libraries and tools for building robot applications"
url="https://docs.ros.org/en/galactic/"
arch=('any')
license=('Apache')
depends=(
	'ros2-arch-deps'
	'gmock'
	'sip4'
)
source=(
	"ros2::git+https://github.com/ros2/ros2#tag=release-galactic-20210523"
	"google_benchmark_vendor.patch"
	"mimick_vendor.patch"
)
sha256sums=(
	'SKIP'
	"609a5260736192608582c0f0a0fd4da09a9185d95d452a92d9527af38d720f6a"
	"9904000aa5f63e9aa600cb4a07b0caef48444f1dd6179a650242c0634cf5051e"
)
install=ros2-galactic.install

prepare() {
	# Check locale
	locale | grep LANG | grep UTF-8
	if [[ $? -ne 0 ]]; then
		printf "Locale must support UTF-8. See https://wiki.archlinux.org/index.php/locale
		or https://wiki.archlinux.org/index.php/locale ."
		exit 1
	fi

	# Clone the repos
	mkdir -p $srcdir/ros2/src
	vcs import $srcdir/ros2/src < $srcdir/ros2/ros2.repos

	# Fix some issues in the code (TODO: Gradually move to upstream)
	## mimick_vendor:
	git -C $srcdir/ros2/src/ros2/mimick_vendor checkout .
	git -C $srcdir/ros2/src/ros2/mimick_vendor apply $srcdir/mimick_vendor.patch
	## google_benchmark_vendor
	git -C $srcdir/ros2/src/ament/google_benchmark_vendor checkout .
	git -C $srcdir/ros2/src/ament/google_benchmark_vendor apply $srcdir/google_benchmark_vendor.patch
	## Eclipse iceoryx
	git -C $srcdir/ros2/src/eclipse-iceoryx/iceoryx checkout release_1.0
	## Eclipse CycloneDDS
	git -C $srcdir/ros2/src/eclipse-cyclonedds/cyclonedds checkout 0.8.0beta6
	git -C $srcdir/ros2/src/eclipse-cyclonedds/cyclonedds cherry-pick bdf270a588aae77d0f1a0f0070b53ad1388da61c
}

build() {
	colcon build --merge-install
}

package() {
	mkdir -p $pkgdir/opt/ros2/galactic
	cp -r $srcdir/install/* $pkgdir/opt/ros2/galactic/
}
