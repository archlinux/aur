# Maintainer: djazz

pkgname=fimfic2epub
pkgver=1.7.56
pkgrel=1
pkgdesc="Tool to generate improved EPUB ebooks from Fimfiction stories"
arch=('any')
url="https://github.com/daniel-j/${pkgname}"
license=('MIT')
depends=('nodejs' 'libjpeg-turbo' 'pango')
makedepends=('npm')
options=(!strip)
source=("https://github.com/daniel-j/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=(
  '601f52b6b4542ea7dff0185932e542b1f11700efd1ada9cf159f392589e87c0f'
)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo "Installing dependencies..."
  npm install --cache "${srcdir}/npm-cache" --build-from-source


  echo "Building ${pkgname}..."
  npm run -- build webpack --standalone

  install -d "${pkgdir}/usr/lib/${pkgname}"
  install "build/${pkgname}" "build/"*".node" "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  chown -R root:root "$pkgdir"
}
