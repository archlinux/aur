# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Boris Barbulovski <bbarbulovski at gmail dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

_pkgname=jd-gui
pkgname=${_pkgname}-bin
pkgver=1.7.1
pkgrel=7
pkgdesc='A standalone Java decompiler GUI'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/QuentiumYT/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/QuentiumYT/${_pkgname}/v${pkgver}"
license=('GPL-3.0-only')
depends=('jdk21-openjdk' 'java-runtime' 'java-runtime-common' 'java-environment-common' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.jar"
  "ICON-${pkgver}.png::${_urlraw}/src/linux/resources/jd_icon_128.png"
  "LICENSE-${pkgver}::${_urlraw}/LICENSE"
  "README-${pkgver}.md::${_urlraw}/README.md"
  "jd-gui.c"
  "jd-gui.desktop"
)

sha512sums=('c34b6091cac06962df72aa163c4cb3a15c654262eecd281cb8504d3d02f635e9c6aa5edbc90b67d8f8396cc18d69077891ee4380360e5e3e7ce53fef70e061cd'
            '767c54d4147e5d223ffa453a3094d8f7f8a33832d1c92cd8a189fd8fbaa7dec00767a5ff8e29caf295de65780b0745e062f796c4aa2d8ab368b1fe20e03ff3b2'
            'd224dd23bcb057c65eb1470dc9f83eefa67f41cec0193099902059e86882bf0525bb660d323d2f62743d3cd3e9aec468e5a7686eb2fd33774f89bc519ef7b49c'
            'd300ac330c141b57e5b62f57b5d0462d5618fd67660bfb3bb2c89723686ed76c1e5b34fc670ab9f026e23b6645854a2ee90596a9b496d0b91d46ecf2013f4e17'
            '6aa22310adff87a4385b4780501a1e691fd24eb0cb182e63817677fce8a45f0d90cf12cc322a00e18bc2b7c20667e4c56a2a4e3323d63cb8fc06cafde5e83ec0'
            'b2328bed9c9191f1ee1292bb453f2f66a9db4990934d816d001ce7cbac3104da93e45aa37ec9e9bd3dac8fa4eb2f5b61e51a05c6126b837ae1634adfa6820af9')

build() {
  export DFLAGS='-L-zrelro -L-znow'

  gcc \
    -O2 \
    -D ARCH_PKGVER=\"${pkgver}\" \
    -D ARCH_PKGREL=\"${pkgrel}\" \
    -DNDEBUG \
    -I /usr/lib/jvm/java-21-openjdk/include \
    -I /usr/lib/jvm/java-21-openjdk/include/linux \
    -L /usr/lib/jvm/java-21-openjdk/lib \
    -L /usr/lib/jvm/java-21-openjdk/lib/jli \
    -Wl,-rpath,/usr/lib/jvm/java-21-openjdk/lib \
    -Wl,-z,relro,-z,now,-z,shstk \
    -l jli \
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
