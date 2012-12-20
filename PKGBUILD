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
sha256sums=('af2a8c089faed2cef24b93d887f6dd947fd8ff9cade009696a5922832846ade4')
sha384sums=('b92426299ea5d57e52b3670eb2488d684bd09ab45630e31d9830e0120548b651b64e12d04a757c8b9aec2f2cb0e07b50')
sha512sums=('74f4ca2ef7552a9b50b267c337fca63561f3a86b31fdc823c1101dfa8ff0cad3f2ab109edee4a2eadacff32d61db28231f521681c092e444dff5e8b2c27e4ef3')

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

