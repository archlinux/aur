# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=otf-hasklig-git
_pkgname=Hasklig
pkgver=1.0.beta.r13.a2367c1
pkgrel=1
pkgdesc='A code font with monospaced ligatures'
arch=('any')
url='https://github.com/i-tu/Hasklig'
license=('custom:SIL Open Font License')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git' 'afdko' 'python2' 'python2-fonttools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=fonts.install
source=("git+https://github.com/i-tu/${_pkgname}.git"
        'https://raw.githubusercontent.com/adobe-fonts/source-code-pro/master/LICENSE.txt'
	'use-python2.patch')
sha256sums=('SKIP'
            'cb30d3086a8b3ce0b9e3690bf48d6620402b61160bc658076f95180ccd9e9dae'
            '948abd484e9d0c404c62af183a521003cde172ed34f5d96b8025e4f075c01f3f')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -p1 -i "${srcdir}/use-python2.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./buildInstances.sh
  ./build.sh
}

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 "${_pkgname}/target/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
