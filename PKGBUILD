# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Det <nimetonmaili@gmail.com>
# Contributor: Godane aka Christopher Rogers <slaxemulator@gmail.com>
# Contributor: Michai Coman <mihai@m1x.ro>

pkgname='unetbootin'
pkgver=702
pkgrel=1
pkgdesc='Create bootable Live USB drives'
arch=('x86_64')
url='https://unetbootin.github.io'
_url_source='https://github.com/unetbootin/unetbootin'
license=('GPL3')
depends=('hicolor-icon-theme' 'mtools' 'p7zip' 'qt5-base' 'syslinux')
makedepends=('qt5-tools' 'setconf')
optdepends=('polkit: run unetbootin directly from menu')
source=("${pkgname}-${pkgver}::${_url_source}/archive/${pkgver}.tar.gz"
        "${pkgname}.sh"
				"org.archlinux.pkexec.${pkgname}.policy")
sha256sums=('95add3253d2731680a83ea464c7bbe92db864c000ae4921e141b93536b7a68f8'
            '6b99405a78ac4de80e3a20e766ce993f22c8a01e4ab50f952a10bdcc26effd3f'
            '118f154e2772ff0d50d22735418fb37c9a03ecd0a1bbf2c8a4a8ed48da64160c')

prepare() {
  cd "${pkgname}-${pkgver}/src/${pkgname}"
  setconf "${pkgname}.desktop" 'Exec' "/usr/bin/${pkgname}"
	sed -i '/^RESOURCES/d' "${pkgname}.pro"
}

build() {
  cd "${pkgname}-${pkgver}/src/${pkgname}"
  lupdate-qt5 "${pkgname}.pro"
  lrelease-qt5 "${pkgname}.pro"
  qmake-qt5 "${pkgname}.pro" -config release "DEFINES += NOSTATIC" "RESOURCES -= ${pkgname}.qrc"
	make
}

package() {
  install -Dvm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dvm644 "org.archlinux.pkexec.${pkgname}.policy" -t "${pkgdir}/usr/share/polkit-1/actions"

  cd "${pkgname}-${pkgver}/src/${pkgname}"
  install -Dvm644 "${pkgname}"_*.qm -t "${pkgdir}/usr/share/${pkgname}"
  install -Dvm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}.elf"
  install -Dvm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dvm644 'readme.md' -t "${pkgdir}/usr/share/doc/${pkgname}"

  for i in 16 24 32 48 64 128 256 512; do
    install -Dvm644 "${pkgname}_${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
}

# vim: ts=2 sw=2 et:
