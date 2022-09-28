# Maintainer : jopejoe1 <johannes@joens.email>

_pkgname=rife-ncnn-vulkan
pkgname=python-$_pkgname-git
pkgver=1.1.3.r0.g320e625
pkgrel=1
pkgdesc="A Python FFI of nihui/$_pkgname achieved with SWIG "
url="https://github.com/media2x/$_pkgname-python"
arch=("any")
license=("MIT")
depends=(
	"python"
	"vulkan-headers"
	"vulkan-icd-loader"
	"swig"
	"python-pillow"
)
makedepends=(
	"cmake"
	"git"
	"python-setuptools"
	"python-requests"
	"python-cmake-build-extension"
)
provides=('python-rife-ncnn-vulkan')
conflicts=('python-rife-ncnn-vulkan')
source=(
	"git+https://github.com/media2x/$_pkgname-python.git"
	"git+https://github.com/nihui/$_pkgname.git"
	"git+https://github.com/Tencent/ncnn.git"
	"git+https://github.com/webmproject/libwebp.git"
	"git+https://github.com/pybind/pybind11.git"
	"git+https://github.com/KhronosGroup/glslang.git"
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname-python
	echo $(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
}

prepare() {
  cd $_pkgname-python
  git submodule init
  git config submodule.rife_ncnn_vulkan_python/$_pkgname.url "$srcdir/$_pkgname"
  git submodule update

  cd rife_ncnn_vulkan_python/$_pkgname
  git submodule init
  git config submodule.src/ncnn.url "$srcdir/ncnn"
  git config submodule.src/libwebp.url "$srcdir/libwebp"
  git submodule update

  cd src/ncnn
  git submodule init
  git config submodule.glslang.url "$srcdir/glslang"
  git config submodule.python/pybind11.url "$srcdir/pybind11"
  git submodule update
}

build() {
	cd $_pkgname-python
	python setup.py build
}

package() {
	cd $_pkgname-python
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
