# Maintainer:
# Contributor: Björn Bidar <bidar@odin>

_pkgname="primus_vk"
pkgname="${_pkgname/_/-}-git"
pkgver=1.6.4.r0.g7076c2e
pkgrel=1
pkgdesc="Nvidia Vulkan offloading for Bumblebee"
url="https://github.com/felixdoerre/primus_vk"
license=('BSD-2-Clause')
arch=('i686' 'x86_64')

depends=(
  'bumblebee'
  'libxrandr'
  'nvidia-utils'
  'primus'
  'vulkan-icd-loader'
)
makedepends=(
  'git'
  'vulkan-validation-layers'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  export CXXFLAGS+=' -DNV_DRIVER_PATH=\"/usr/lib/libGLX_nvidia.so.0\"'
  make all primus_vk_diag
}

package() {
  cd "$_pkgsrc"
  make PREFIX="$pkgdir"/usr install
  install -Dm755 primus_vk_diag -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
