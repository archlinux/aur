# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Yuxin Wu <ppwwyyxxc@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: hauptmech
# Contributor: figo.zhang
# Contributor: lubosz

pkgname=pcl-git
pkgver=r13641.c1835f442
pkgrel=1
pkgdesc="a standalone, large scale, open project for 2D/3D image and point cloud processing"
arch=(i686 x86_64)
url="http://pointclouds.org/"
license=('BSD')
depends=(
	boost
	cuda
	eigen
	flann
	glew
	glu
	libxcursor
	openmpi
	qhull
	qt5-base
	qt5-webkit
	vtk
	pugixml
	fmt
)
makedepends=(cmake git)
source=(git+https://github.com/PointCloudLibrary/pcl)
sha256sums=(SKIP)
conflicts=(pcl)
provides=(pcl)

pkgver() {
	cd "$srcdir/pcl"
	# Use the tag of the last commit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	rm -rf "$srcdir/build"
	mkdir  "$srcdir/build"
	cd     "$srcdir/build"

	cmake "${srcdir}/pcl" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
		-DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS} -Wl,--as-needed" \
		-DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS} -Wl,--as-needed" \
		-DCMAKE_CUDA_ARCHITECTURES="52;60;60;62;70;72;75;80;86;86-virtual" \
		-DBUILD_apps=ON \
		-DBUILD_apps_cloud_composer=ON \
		-DBUILD_apps_in_hand_scanner=ON \
		-DBUILD_apps_modeler=ON \
		-DBUILD_apps_point_cloud_editor=ON \
		-DBUILD_examples=ON \
		-DBUILD_global_tests=OFF \
		-DBUILD_surface_on_nurbs=ON \
		-DBUILD_CUDA=ON \
		-DBUILD_cuda_io=ON \
		-DBUILD_cuda_apps=ON \
		-DBUILD_GPU=ON \
		-DBUILD_gpu_kinfu=OFF \
		-DBUILD_gpu_kinfu_large_scale=OFF \
		-DBUILD_gpu_surface=ON \
		-DBUILD_gpu_tracking=ON \
		-DBUILD_simulation=ON
}

build() {
	cd "$srcdir/build"
	make
}

package() {
	cd "$srcdir/build"
	make DESTDIR="${pkgdir}" install
	install -Dm644 "$srcdir/pcl/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
