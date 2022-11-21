# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=realesrgan-ncnn-vulkan-git
_pkgname=Real-ESRGAN-ncnn-vulkan
pkgver=0.2.0.r0.g37026f4
pkgrel=1
pkgdesc='NCNN implementation of Real-ESRGAN'
arch=('x86_64')
url='https://github.com/xinntao/Real-ESRGAN-ncnn-vulkan'
license=('MIT')
depends=('vulkan-driver' 'libwebp' 'gcc-libs' 'ncnn')
makedepends=('git' 'cmake' 'vulkan-headers' 'glslang')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url" 'https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesrgan-ncnn-vulkan-20220424-ubuntu.zip')
b2sums=('SKIP'
        'c16c05c343501272f5b4df6db7e7f8c592c4f8c8170ca0a0181c4433d1889ddea702d65fc134013bdaca302eeeab6e5b6d6fbad407adb7a2afa0acbefd6f4eca')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	mkdir -p build
	cd build
	cmake ../src/ \
	-DBUILD_SHARED_LIBS=0 \
	-DUSE_SYSTEM_NCNN=1 \
	-DUSE_SYSTEM_WEBP=1 \
	-DGLSLANG_TARGET_DIR=/usr/lib/cmake \
	-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	for i in models/*; do
		install -Dm644 $i "$pkgdir"/usr/share/${pkgname%-git}/$i
	done
	cd $_pkgname
	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
	cd build
	install -Dm775 ${pkgname%-git} -t "$pkgdir"/usr/share/${pkgname%-git}
	mkdir "$pkgdir/usr/bin"
	ln -s /usr/share/${pkgname%-git}/${pkgname%-git} "$pkgdir"/usr/bin/${pkgname%-git}
}
