# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=psi-plugins
_pkgname="${_name}.lv2"
pkgname="${_pkgname}-git"
pkgver=0.0.1.r16.83f318d
pkgrel=1
pkgdesc="A small collection of LV2 plugins ideal for (but not limited to) electronic music (git version)"
arch=('x86_64')
url="https://github.com/ycollet/psi-plugins"
license=('GPL2')
depends=()
makedepends=('git' 'lv2' 'ntk' 'python2')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
groups=('lv2-plugins')
source=("${_pkgname}::git+https://github.com/ycollet/psi-plugins"
        'psi-plugins-lv2ui-descriptor.diff')
md5sums=('SKIP'
         '08eab2c4c57bdb162b4397baad61e39b')

_plugins=(
    midi_gate-psi
    midi_rnd-psi
    sidechain_gate-psi
    super_welle-psi
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=$(grep '^VERSION' wscript | cut -d "'" -f 2)
  echo ${ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  patch -p1 -N -i "${srcdir}/psi-plugins-lv2ui-descriptor.diff"

}

build() {
  cd "${srcdir}/${_pkgname}"

  python2 waf configure --prefix=/usr
  python2 waf build $MAKEFLAGS
}

package() {
  depends=('libntk.so' 'libntk_images.so')
  cd "${srcdir}/${_pkgname}"

  python2 waf install --destdir="${pkgdir}"

  # Move README.md files out of LV2 bundles into doc dir
  for plugin in ${_plugins[*]}; do
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/${plugin}.lv2"
    mv "${pkgdir}/usr/lib/lv2/${plugin}.lv2/README.md" \
      "${pkgdir}/usr/share/doc/${pkgname}/${plugin}.lv2"
  done
}
