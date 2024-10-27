# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=upscayl-ncnn-git
pkgver=20240601.103425.r2.g8f8babf
pkgrel=4
pkgdesc="Fork of the NCNN implementation of Real-ESRGAN"
arch=(x86_64)
url="https://github.com/upscayl/upscayl-ncnn"
license=(AGPL-3.0-only)
depends=(libwebp gcc-libs glibc ncnn)
makedepends=(git cmake vulkan-headers glslang shaderc)
provides=(upscayl-ncnn)
conflicts=(upscayl-ncnn)
source=("git+https://github.com/upscayl/upscayl-ncnn.git"
        cmake.patch
        "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesrgan-ncnn-vulkan-20220424-ubuntu.zip"
        )
b2sums=('SKIP'
        'f3460741da1310ba91193d16fd3d170e4b3244accd0eb451cde37f6a77cd6bc1da086ae62ae7ad943b08d23107ce67e6483941db0b9edbfdcea05217bcb98c47'
        'c16c05c343501272f5b4df6db7e7f8c592c4f8c8170ca0a0181c4433d1889ddea702d65fc134013bdaca302eeeab6e5b6d6fbad407adb7a2afa0acbefd6f4eca')

prepare() {
  cd upscayl-ncnn
  patch -Np1 -i ../cmake.patch # fail to detect system's glslang
}

pkgver() {
  cd upscayl-ncnn
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(
	-DBUILD_SHARED_LIBS=0
	-DUSE_SYSTEM_NCNN=1
	-DUSE_SYSTEM_WEBP=1
    #-DGLSLANG_TARGET_DIR=/usr/lib/cmake/glslang
  )

  cmake -B build -S "upscayl-ncnn/src" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Rlease \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  #install -Dm755 build/upscayl-bin -t "${pkgdir}/usr/bin/"
  #ln -s /usr/bin/upscayl-bin ${pkgdir}/usr/bin/upscayl

  install -Dm755 build/upscayl-bin "${pkgdir}/usr/lib/upscayl/upscayl"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/upscayl/upscayl "${pkgdir}/usr/bin/upscayl"

  # Upscaler want the upstream binary name
  ln -s /usr/lib/upscayl/upscayl "${pkgdir}/usr/bin/upscayl-bin"

  install -d "${pkgdir}/usr/lib/upscayl/models"
  cp -r models/* "${pkgdir}/usr/lib/upscayl/models"
}
