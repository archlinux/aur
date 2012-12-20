# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=rfsm
pkgver=beta5
pkgrel=1
pkgdesc="A small and powerful Statechart implementation"
arch=('any')
url="http://people.mech.kuleuven.be/~mklotzbucher/rfsm/README.html"
license=('LGPL' 'BSD')
depends=('bash' 'lua')
optdepends=('orocos-rtt: orocos real-time toolkit support')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/kmarkus/rFSM/tarball/${pkgver})
md5sums=('0e18e589623ed238e844cc60232ee0af')

build() {
  cd "${srcdir}/kmarkus-rFSM-3459bf1"

  # rename the scripts to avoid name collision with orocos-ocl
  mv utils.lua rfsm_utils.lua
  mv ansicolors.lua rfsm_ansicolors.lua

  # reference the renamed scripts by their new name
  sed 's/utils/rfsm_utils/g' -i *.lua
  sed 's/ansicolors/rfsm_ansicolors/g' -i *.lua
}

package() {
  cd "${srcdir}/kmarkus-rFSM-3459bf1"

  # determine lua's module directory
  _moddir=`pkg-config --variable=INSTALL_LMOD lua`

  # install the lua scripts
  install -dm755 "${pkgdir}${_moddir}"
  install -Dm644 *.lua "${pkgdir}${_moddir}"

  # install the binaries
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 tools/rfsm2json "${pkgdir}/usr/bin"
  install -Dm755 tools/rfsm-dbg "${pkgdir}/usr/bin"
  install -Dm755 tools/rfsm-sim "${pkgdir}/usr/bin"
  install -Dm755 tools/rfsm-sim.lua "${pkgdir}/usr/bin"
  install -Dm755 tools/rfsm-viz "${pkgdir}/usr/bin"

  # install documentation and examples
  install -dm755 "${pkgdir}/usr/share/rfsm"
  cp -dr --no-preserve=ownership doc examples "${pkgdir}/usr/share/rfsm"
}

