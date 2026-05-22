# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Co-Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Franck Stauffer
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=CanvasBlocker
pkgname=firefox-extension-${_name,,}
pkgver=1.12
pkgrel=1
pkgdesc='A Firefox extension to protect from being fingerprinted'
license=('MPL-2.0')
url='https://github.com/kkapsner/CanvasBlocker'
arch=('any')
depends=('firefox')
makedepends=('web-ext' 'jq')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c95d073795e376ce53b66e568c0d215e56c2dcefc962ddc650b7fb5492828d4b')

build() {
  cd "$srcdir"/$_name-$pkgver
  web-ext build \
      --overwrite-dest \
      --ignore-files test \
      --ignore-files versions \
      --ignore-files crowdin.yml \
      --ignore-files "package*"
}

package() {
  cd "$srcdir"/$_name-$pkgver
  _extension_id=$(jq -r '(.applications // .browser_specific_settings).gecko.id' manifest.json)
  install -Dm644 web-ext-artifacts/${_name,,}-$pkgver.zip "$pkgdir"/usr/lib/firefox/browser/extensions/$_extension_id.xpi
}
