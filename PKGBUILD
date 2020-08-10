# Maintainer: Milkii Brewster <milkii on Freenode IRC>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name="BHarvestr"
_pkgname="${_name,,}.lv2"
_plugin_uri="https://www.jahnichen.de/plugins/lv2/${_name}"
pkgname="${_pkgname}-git"
pkgdesc="An experimental granular synthesizer LV2 plugin (git version)"
pkgver=r171.8025b9b
pkgrel=1
arch=(x86_64)
url="https://github.com/sjaehn/${_name}"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
depends=('cairo' 'gcc-libs' 'glibc' 'libsndfile' 'libx11')
makedepends=('git' 'lv2')
checkdepends=('lv2lint')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/sjaehn/${_name}")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  echo lv2lint -Mpack -I "${_name}.lv2/" "${_plugin_uri}"
  # TTL has no minor/microVersion yet, so skip tests for these until first release
  lv2lint -t "Plugin Version *" -Mpack -I "${_name}.lv2/" "${_plugin_uri}"
}

package() {
  cd "${srcdir}/${_pkgname}"
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  # remove useless license file
  find "${pkgdir}/usr/lib/" -type f -iname "*LICENSE*" -delete
  # delete unused PNG files installed directly into bundle dir
  rm -f "${pkgdir}"/usr/lib/lv2/${_name}.lv2/*.png
}
