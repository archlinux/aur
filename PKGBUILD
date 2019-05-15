# Maintainer: Christoph Haag <christoph.haag@collabora.com>
 
pkgname="monado-git"
_dirname="monado"
pkgver=r153.d9cdd04
pkgrel=1
pkgdesc='The open source OpenXR runtime.'
arch=('i686' 'x86_64')
url='https://monado.dev'
depends=('openxr-loader' 'openhmd')
makedepends=('eigen' 'ninja' 'shaderc')
provides=("openxr-runtime")

#'doxygen' #When building docs
makedepend=('cmake' 'eigen' 'git')

license=('boost')
source=("$_dirname::git+https://gitlab.freedesktop.org/monado/monado.git")
md5sums=('SKIP')

#options=('debug' '!strip')

pkgver() {
  cd "$_dirname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_dirname"
}

build() {
  mkdir -p "$_dirname"-build
  cd "$_dirname"-build
  cmake \
    -G Ninja \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ../"$_dirname"
  ninja
}

package() {
  cd "$_dirname"-build
  DESTDIR="$pkgdir" ninja install

  # TODO: manage runtimes properly
  install -d  "$pkgdir"/usr/local/share/openxr/0
  ln -s /usr/share/openxr/0/openxr_monado.json "$pkgdir"/usr/local/share/openxr/0/active_runtime.json
}
