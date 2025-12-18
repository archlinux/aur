# Maintainer: sokui <violoncello82 gmail>
# Contributor: JL2210 <rot13 yneebjr.frznw11@tznvy.pbz>
# Contributor: basxto <archlinux basxto de>
# based on gbdk package

pkgname=gbdk-2020
pkgver=4.4.0
pkgrel=1
pkgdesc="An updated version of Game Boy Development Kit"
url="https://github.com/gbdk-2020/gbdk-2020"
license=('MIT')
arch=('x86_64' 'i686' 'arm64')
makedepends=('git')
depends=('sdcc')
conflicts=('gbdk' 'lcc')
source=("https://github.com/gbdk-2020/gbdk-2020/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ef2ebe17a38f797578429f820bbb02fd12145e5b7c521b4bbff4579beff48e7c')
options=('!strip')

package() {
  make -C ${pkgname}-${pkgver} gbdk-build gbdk-support-install gbdk-lib-install \
    TARGETDIR=/usr/share/${pkgname}/ BINDIR=/usr/bin/ SDCCDIR=/usr/ \
    PORTS='sm83 z80' PLATFORMS='gb ap duck gg sms msxdos' # can NES be supported now with sdcc 4.5.0?
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/

  mv ${pkgname}-${pkgver}/build/gbdk ${pkgdir}/usr/share/${pkgname}

  mv ${pkgdir}/usr/share/${pkgname}/bin ${pkgdir}/usr/

  # SDCC provides makebin, move it back
  mkdir ${pkgdir}/usr/share/${pkgname}/bin
  mv ${pkgdir}/usr/bin/makebin ${pkgdir}/usr/share/${pkgname}/bin/

  # having all the examples is overkill, and you can't make them without root anyway
  rm -rf ${pkgdir}/usr/share/${pkgname}/examples/

  # move all the licenses into /usr/share/licenses/gbdk-2020/
  cp ${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
  mv ${pkgdir}/usr/share/${pkgname}/licenses/* ${pkgdir}/usr/share/licenses/${pkgname}/
  rmdir ${pkgdir}/usr/share/${pkgname}/licenses
}
