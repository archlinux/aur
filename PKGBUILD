# Maintainer: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=amdvlk-git
pkgver=r6.9093c5e
pkgrel=1
pkgdesc="AMD's standalone Vulkan driver"
arch=(x86_64)
url="https://github.com/GPUOpen-Drivers"
license=('MIT')
depends=('vulkan-icd-loader')
provides=(vulkan-amdvlk)
#conflicts=()
#TODO: makedepends=('libdrm' 'dri2proto' 'glproto' 'libxxf86vm' 'libxdamage' 'expat>=2.0.1' 'libxmu'
#             'talloc' 'wayland' 'pkgconfig' 'imake' 'xorg-server-devel' 'python2-mako' 'python' 'git')
makedepends=('dri2proto')

source=('git+https://github.com/GPUOpen-Drivers/llvm.git#branch=amd-vulkan-master'
	'git+https://github.com/GPUOpen-Drivers/xgl.git#branch=dev'
	'git+https://github.com/GPUOpen-Drivers/pal.git#branch=dev'
	'git+https://github.com/GPUOpen-Drivers/AMDVLK.git#branch=dev'
	'0001-fix-compile-error-on-clang.patch' # TODO: maybe not necessary on gcc
	'0001-remove-linking-with-whole-archive.patch'
	'amdPalSettings.cfg')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '9d2399c3cfd424c5c0645892306f1794de61a8270f95683ea1785a78e0326c5c'
            '4669fda7c492ae6f655e9ad3bb2c4782753b49350a29af29883d43c02d627f46'
            '5f798911bf1cbbe5a83f5ae4886107ef0d02be5753450753ae2d3fc6f80e7012')
pkgver() {
	XGL_VER=$(cd xgl; printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
	#PAL_VER=$(cd pal; printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
	echo "$XGL_VER"
}

prepare() {
  cd xgl
  git am -3 ../0001-fix-compile-error-on-clang.patch
  git am -3 ../0001-remove-linking-with-whole-archive.patch
}

build() {
  echo "building xgl..."
  cd xgl
  cmake -H. -Bbuilds/Release64 -DCMAKE_BUILD_TYPE=Release -DCMAKE_MODULE_PATH=$PWD/../pal/cmake/Modules -DXGL_PAL_PATH:PATH=$PWD/../pal -DCMAKE_C_FLAGS="-DLINUX -D__x86_64__ -D__AMD64__" -DCMAKE_CXX_FLAGS="-DLINUX -D__x86_64__ -D__AMD64__" -DXGL_LLVM_SRC_PATH=$PWD/../llvm
  cd builds/Release64
  make
  echo "bulding xgl finished!"
}

package() {
  install -m755 -d "${pkgdir}"/etc/vulkan/icd.d
  install -m755 -d "${pkgdir}"/etc/amd
  install -m755 -d "${pkgdir}"/usr/lib

  install xgl/builds/Release64/icd/amdvlk64.so "${pkgdir}"/usr/lib/

echo '{
	"file_format_version": "1.0.0",
		"ICD": {
			"library_path": "/usr/lib64/amdvlk64.so",
			"abi_versions": "0.9.0"
		}
}
' >> "${pkgdir}"/etc/vulkan/icd.d/amd_icd64.json

  install amdPalSettings.cfg "${pkgdir}"/etc/amd
}
