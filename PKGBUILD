# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Boris Barbulovski <bbarbulovski at gmail dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

_pkgname=jd-gui
pkgname=${_pkgname}-bin
pkgver=1.7.3
pkgrel=1
pkgdesc='A standalone Java decompiler GUI'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/QuentiumYT/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/QuentiumYT/${_pkgname}/v${pkgver}"
license=('GPL-3.0-only')
depends=('java-runtime>=17' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.jar"
  "ICON-${pkgver}.png::${_urlraw}/src/linux/resources/jd-gui.png"
  "LICENSE-${pkgver}::${_urlraw}/LICENSE"
  "README-${pkgver}.md::${_urlraw}/README.md"
  "jd-gui.c"
  "jd-gui.desktop"
)

sha512sums=('880d1fc8a03625e2e4e0eb3738dda74cfa6c1cd600d7218da0015a8e8cc6977e3f85383be609d3001e9a33729ddcb783467de544558848090624091f0a210106'
            '767c54d4147e5d223ffa453a3094d8f7f8a33832d1c92cd8a189fd8fbaa7dec00767a5ff8e29caf295de65780b0745e062f796c4aa2d8ab368b1fe20e03ff3b2'
            'd224dd23bcb057c65eb1470dc9f83eefa67f41cec0193099902059e86882bf0525bb660d323d2f62743d3cd3e9aec468e5a7686eb2fd33774f89bc519ef7b49c'
            'f1fab881878cc8e7d82c83978ef0597c6763faab1240474c37560a6aa0cbd7c67047c73c016508fefab08d6a99ca0baa36d362104f6c5636ebc478230907c020'
            'd989c90d609399d97cb23779a21437f8f4d096ee311d51355f75b54d40cb677b167680fd2c7b269c042f90251b4aa1f13a66e63ca263bb7051f74f0c50bf6a9a'
            'b2328bed9c9191f1ee1292bb453f2f66a9db4990934d816d001ce7cbac3104da93e45aa37ec9e9bd3dac8fa4eb2f5b61e51a05c6126b837ae1634adfa6820af9')

build() {
  gcc \
    -O2 \
    -DARCH_PKGVER=\"${pkgver}\" \
    -DARCH_PKGREL=\"${pkgrel}\" \
    -DNDEBUG \
    -fcf-protection \
    -Wl,-z,relro,-z,now \
    -o "${srcdir}/jd-gui" \
    "${srcdir}/jd-gui.c"
}

package() {
  cd "${srcdir}" || exit

  install -Dm644 "${_pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"

  install -d "${pkgdir}/usr/bin"
  install -Dm755 "jd-gui" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "jd-gui.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm644 "ICON-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
