# Maintainer: Uffe Jakobsen <_uffe_|_at_|_uffe_|_dot_|_org_>
pkgname=stlink-tool-git
_pkgname=stlink-tool
pkgver=r30.a4c1b6b
pkgrel=4
pkgdesc="Tool for flashing chinese ST-Link dongles"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/blackmagic-debug/stlink-tool"
source=('git+https://github.com/blackmagic-debug/stlink-tool.git')
#url="https://github.com/UweBonnes/stlink-tool"
#source=('git+https://github.com/UweBonnes/stlink-tool.git')
depends=('libusb')
makedepends=('git')
provides=('stlink-tool')
sha256sums=('SKIP')

pkgver()
{
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git submodule update
}

build()
{
  cd "${srcdir}/${_pkgname}"
  make
}

package()
{
  cd "${srcdir}/${_pkgname}/"

  install -D -m755 stlink-tool "${pkgdir}/usr/bin/stlink-tool"

  # udev rules: trigger cheap (China) STLink v2 clones to leave bootloader upon insertion and start flashed BlackMagic firmware/app
  install -D -m644 "${startdir}/stlink-tool.rules" "${pkgdir}/usr/share/${_pkgname}/etc/udev/rules.d/stlink-tool.rules"
  ln -s stlink-tool.rules "${pkgdir}/usr/share/${_pkgname}/etc/udev/rules.d/98-stlink-tool.rules"
}

#
# EOF
#
