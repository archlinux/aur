# Maintainer: djazz

pkgname=fimfic2epub
pkgver=1.7.53
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
  '2e54ff079963233ab65af7ef2f1b49ec919e176b7c444a10c615c80beb3b2594'
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
