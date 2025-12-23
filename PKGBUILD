# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=ffvship-git
pkgver=4.0.2.r15.g231138c
pkgrel=1
pkgdesc=" A Library for GPU-accelerated visual fidelity metrics, featuring SSIMULACRA2, Butteraugli and CVVDP. "
arch=('x86_64')
url="https://github.com/Line-fr/Vship"
license=('MIT')
depends=('glibc' 'ffms2' 'gcc-libs')
makedepends=('cuda' 'hip-runtime-amd' 'patchelf' 'clang' 'git')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("${pkgname}::git+$url.git")
optdepends=('cuda: For FFVship-nvidia'
	    'hip-runtime-amd: For FFVship-amd')
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}
prepare() {
	cd "$srcdir/$pkgname"
}

build() {
	cd "$srcdir/$pkgname"
	export ROCM_PATH=/opt/rocm
	export CUDA_PATH=/opt/cuda
	export NVCC_CCBIN='/usr/bin/g++'
	make buildall
	make buildFFVSHIP
	mv libvship.so libvship-amd.so
	make buildcudaall
	mv libvship.so libvship-nvidia.so
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 FFVship "$pkgdir/usr/lib/${pkgname::-4}/FFVship-amd"
	install -Dm755 FFVship "$pkgdir/usr/lib/${pkgname::-4}/FFVship-nvidia"
	install -Dm755 libvship-amd.so -t "$pkgdir/usr/lib/${pkgname::-4}"
	install -Dm755 libvship-nvidia.so -t "$pkgdir/usr/lib/${pkgname::-4}"
	patchelf --set-rpath '$ORIGIN' "$pkgdir/usr/lib/${pkgname::-4}/FFVship-amd"
	patchelf --set-rpath '$ORIGIN' "$pkgdir/usr/lib/${pkgname::-4}/FFVship-nvidia"
	patchelf --replace-needed libvship.so libvship-amd.so "$pkgdir/usr/lib/${pkgname::-4}/FFVship-amd"
	patchelf --replace-needed libvship.so libvship-nvidia.so "$pkgdir/usr/lib/${pkgname::-4}/FFVship-nvidia"
	install -dm755 "$pkgdir/usr/bin"
	ln -sf /usr/lib/${pkgname::-4}/FFVship-amd "$pkgdir/usr/bin/FFVship-amd"
	ln -sf /usr/lib/${pkgname::-4}/FFVship-nvidia "$pkgdir/usr/bin/FFVship-nvidia"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
