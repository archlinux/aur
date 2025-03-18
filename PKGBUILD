# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=secretpixel
_commit=ea178e0
_pkgver=1.0.0
pkgver=1.0.0.r21.ea178e0
pkgrel=1
pkgdesc="cutting-edge steganography tool"
arch=('any')
url="https://github.com/x011/SecretPixel"
license=('GPL3')
depends=('python' 'python-cryptography' 'python-pillow' 'python-numpy')
source=("${pkgname}-${_pkgver}::git+https://github.com/x011/SecretPixel#commit=${_commit}"
        "https://github.com/x011/SecretPixel/pull/4.patch")
sha256sums=('05cb0f9ac1200bcaae35deec08a047f8164f19b71ece9bc8a674b34d9c90e35d'
            'e035c678dc87baeb091250556853fd7b735cfd4d1cfa149ceafbd717ee4dc60d')

pkgver() {
  cd "${pkgname}-${_pkgver}"

  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}-${_pkgver}"

  patch -p1 < ../4.patch

  sed -i "1s/^/#!\/usr\/bin\/python\n\r\n/" secret_pixel.py
  sed -i "s:python secret_pixel.py:secretpixel:g" secret_pixel.py
}

package() {
  cd "${pkgname}-${_pkgver}"

  install -Dm755 secret_pixel.py "${pkgdir}/usr/bin/secretpixel"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
