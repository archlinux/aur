# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Det <nimetonmaili@gmail.com>
# Contributor: Godane aka Christopher Rogers <slaxemulator@gmail.com>
# Contributor: Michai Coman <mihai@m1x.ro>

_pkgname='unetbootin'
pkgname="${_pkgname}-git"
pkgver=700.r0.g50b496c8
pkgrel=1
pkgdesc='Create bootable Live USB drives'
arch=('x86_64')
url='https://unetbootin.github.io'
_url_source='https://github.com/unetbootin/unetbootin'
license=('GPL3')
depends=('hicolor-icon-theme' 'mtools' 'p7zip' 'qt5-base' 'syslinux')
makedepends=('git' 'qt5-tools' 'setconf')
optdepends=('polkit: run unetbootin directly from menu')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# NB: git repo size ~470MB
source=("git+${_url_source}.git"
        "${_pkgname}.sh"
				"org.archlinux.pkexec.${_pkgname}.policy")
sha256sums=('SKIP'
            '6b99405a78ac4de80e3a20e766ce993f22c8a01e4ab50f952a10bdcc26effd3f'
            '118f154e2772ff0d50d22735418fb37c9a03ecd0a1bbf2c8a4a8ed48da64160c')

prepare() {
  cd "${_pkgname}/src/${_pkgname}"
  setconf "${_pkgname}.desktop" 'Exec' "/usr/bin/${_pkgname}"
	sed -i.bak '/^RESOURCES/d' "${_pkgname}.pro"
}

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}/src/${_pkgname}"
  lupdate-qt5 "${_pkgname}.pro"
  lrelease-qt5 "${_pkgname}.pro"
  qmake-qt5 "${_pkgname}.pro" -config release "DEFINES += NOSTATIC" "RESOURCES -= ${_pkgname}.qrc"
	make
}

package() {
  install -Dvm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dvm644 "org.archlinux.pkexec.${_pkgname}.policy" -t "${pkgdir}/usr/share/polkit-1/actions"

  cd "${_pkgname}/src/${_pkgname}"
  install -Dvm644 "${_pkgname}"_*.qm -t "${pkgdir}/usr/share/${_pkgname}"
  install -Dvm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}.elf"
  install -Dvm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dvm644 'readme.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"

  for i in 16 24 32 48 64 128 256 512; do
    install -Dvm644 "${_pkgname}_${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
  done
}

# vim: ts=2 sw=2 et:
