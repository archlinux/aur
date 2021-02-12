# Maintainer: Milk Brewster (milk on freenode irc)
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name="BShapr"
_pkgname="${_name,,}"
_plugin_uri="https://www.jahnichen.de/plugins/lv2/${_name}"
pkgname="${_pkgname}-git"
pkgdesc="A beat / envelope shaper LV2 plugin (git version)"
pkgver=0.10.r3.gb4674dd
pkgrel=1
arch=('x86_64')
url="https://github.com/sjaehn/${_name}"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
depends=('cairo' 'gcc-libs' 'glibc' 'libx11')
makedepends=('git' 'lv2')
checkdepends=('lv2lint')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/sjaehn/${_name}")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

# Unfortunately, lv2lint is not able to test an uninstalled plugin when a
# conflicting version of the plugin (or one without a proper version at all)
# is installed, so we dsiable the check function for now.
#check() {
#  cd "${srcdir}/${_pkgname}"
#  # TTL has no minor/microVersion yet, so skip tests for these until first release
#  lv2lint -t "Plugin Version *" -Mpack -I "${_name}.lv2/" "${_plugin_uri}"
#}

package() {
  cd "${srcdir}/${_pkgname}"
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  # remove license file in wrong location
  find "${pkgdir}/usr/lib/" -type f -iname "*LICENSE*" -delete
}
