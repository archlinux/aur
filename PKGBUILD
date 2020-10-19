# Maintainer: djazz

pkgname=fimfic2epub
pkgver=1.7.51
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
  'ffec7b2a9c7831b7ce1e0face9fdb9b196c2a6de73e4f86ecce1cca6d88cd382'
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
