# MAINTAINER: haagch <christoph.haag@collabora.com>
# CONTRIBUTOR: acxz <akashpatel2008 at yahoo dot com>

pkgname=kimera-vio-monado-git
pkgver=r3580.a8aa8a03
pkgrel=1
pkgdesc="Visual Inertial Odometry pipeline for accurate State Estimation from
Stereo/Mono + IMU data"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/mateosss/Kimera-VIO"
license=('BSD')
depends=('gtsam' 'opencv' 'opengv' 'dbow2' 'google-glog' 'gflags' 'kimera-rpgo')
optdepends=()
makedepends=('cmake' 'ninja' 'git' 'boost' 'qt5-base' 'vtk' 'glew' 'fmt')
_pkgname="Kimera-VIO"
source=('git+https://gitlab.freedesktop.org/mateosss/Kimera-VIO.git#branch=xrtslam')
sha256sums=('SKIP')
#options=(debug '!strip')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	msg "Starting CMake"

	cmake \
		-DBUILD_TESTS=OFF \
		-DKIMERA_BUILD_TESTS=OFF \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DCMAKE_BUILD_TYPE="Release" \
		-Bbuild \
		-GNinja

	msg "Building the project"
	# needs a lot of ram to build
	ninja -C build -j8
}

package() {
	cd "$_pkgname"

	msg "Installing files"
	DESTDIR="${pkgdir}/" ninja -C build install

	install -m755 -d "${pkgdir}"/usr/share/kimera-vio-monado
	cp -Ra "${srcdir}/${_pkgname}"/params/ "${pkgdir}"/usr/share/kimera-vio-monado
	cp -Ra "${srcdir}/${_pkgname}"/vocabulary/ "${pkgdir}"/usr/share/kimera-vio-monado

	for i in "${pkgdir}"/usr/share/kimera-vio-monado/params/*/flags/Monado.flags
	do
		sed -i "s#/home/mateo/Documents/apps/kviodeps/Kimera-VIO/#/usr/share/kimera-vio-monado/#" "$i"
		sed -i "s#output_path=/usr/share/kimera-vio-monado/output_logs#output_path=/tmp/#" $i
	done
}
