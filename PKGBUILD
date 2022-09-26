# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Christoph Korn <christoph.korn at posteo dot de>
_pkgname=chatty
pkgname=${_pkgname}-beta
pkgver=0.21b2
_pkgver=${pkgver//b/-b}
pkgrel=1
pkgdesc='Twitch Chat Client for Desktop'
arch=('any')
url='https://chatty.github.io/'
license=('GPL3')
depends=('java-environment' 'sh')
optdepends=('streamlink: for watching streams in a custom video player.'
            'livestreamer: for watching streams in a custom video player.')
makedepends=('gradle')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${_pkgver}.tar.gz::https://github.com/chatty/${_pkgname}/archive/v${_pkgver}.tar.gz"
        "${_pkgname}.desktop"
        "${_pkgname}_script"
        'disable_version_check.patch')
b2sums=('e24aff851a1c1101bf8e58300eb95995f813af5a90f17ce3fb973450c56c8c48272c3dda5181299d032a07ef53002d20922c700c66511ea585c3ce8ecd4a3635'
        '8eaa2a6a1f16b4c65c046b5d524b8237132f40c50bfd952f34e8296c8cc3c299c0eb8abf528aa167373bd844da9c0ad265181984d3dab04b86fc4efdd5100281'
        'ad27872651f6481b52721b286f3b22b5dde3c9d3a9f3bdf155a361f5733d20c0bd97515d283f0d038e96903e91e62e363dbb57aee25e018a4e7f4aa014ec715b'
        'fa6495c018023f244a924c2a37eafde6f26c13e4664480ca2ffdb3d7e97ba644f78db42bd75649825966ff70a3cfb1a4e9eff41087c501528f964f32ed0defe5')

prepare() {
  cd "${_pkgname}-${_pkgver}"
  patch -p1 -i '../disable_version_check.patch'
}

build() {
  cd "${_pkgname}-${_pkgver}"
  gradle --quiet build
  gradle --quiet release
}

package(){
  mkdir "${srcdir}/Chatty_${_pkgver}" && cd "${srcdir}/Chatty_${_pkgver}"
  bsdcpio -i -m --make-directories < "../${_pkgname}-${_pkgver}/build/releases/Chatty_${_pkgver}.zip"
  install -Dm644 'Chatty.jar' "${pkgdir}/usr/share/${_pkgname}/Chatty.jar"
  cp -a 'img' 'sounds' "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm644 'readme.txt' "${pkgdir}/usr/share/doc/${_pkgname}/readme.txt"

  cd "${srcdir}"
  install -Dm755 "${_pkgname}_script" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  cd "${srcdir}/${_pkgname}-${_pkgver}"
  install -Dm644 "./src/chatty/gui/app_main_16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png"
  install -Dm644 "./src/chatty/gui/app_main_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgname}.png"
  install -Dm644 "./src/chatty/gui/app_main_128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
}
