# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

pkgbase=riot
pkgname=('riot-desktop' 'riot-web')
pkgver=0.9.7
pkgrel=2
pkgdesc="A glossy Matrix collaboration client, web and desktop versions."
arch=('any')
url="https://riot.im"
_url="https://github.com/vector-im/riot-web"
license=('Apache')
makedepends=('npm' 'git' 'phantomjs')
source=(${pkgbase}-${pkgver}.tar.gz::"${_url}/archive/v${pkgver}.tar.gz"
        ${pkgbase}-${pkgver}.tar.gz.asc::"${_url}/releases/download/v${pkgver}/v${pkgver}-src.tar.gz.asc"
        "${pkgbase}.desktop"
        "${pkgbase}-desktop.sh")
sha256sums=('0cd4f4b4d2662846bf76ea5eb0642d6cf3dd7e29d791c1cfc409ae6ede23e285'
            'SKIP'
            '043fbaa29be96f52541143e1684fd7ba33585edb215c06d1ed4e59ddc48a9fa7'
            'e2f3c320014f464aca13ec0d8422e4cd3febbaf462c31d470aeb66453bcd6a69')
validpgpkeys=('6FEB6F83D48B93547E7DFEDEE019645248E8F4A1') # riot.im (Package Signing key) <packages@riot.im>

prepare() {
  cd ${pkgbase}-web-${pkgver}
  sed -i 's@https://riot.im/download/desktop/update/@null@g' electron/riot.im/config.json
}

build() {
  cd ${pkgbase}-web-${pkgver}
  npm install
  npm run build
}

package_riot-web() {
  pkgdesc="A glossy Matrix collaboration client for the web."
  provides=('vector-web')  # @vith
  replaces=('vector-web')  # @vith
  cd ${pkgbase}-web-${pkgver}

  install -d "${pkgdir}"/{usr/lib,etc}/${pkgbase}

  cp -r webapp "${pkgdir}"/usr/lib/${pkgbase}/
  install -Dm644 config.sample.json -t "${pkgdir}"/usr/lib/${pkgbase}/webapp/
  ln -s /etc/${pkgbase}/config.json "${pkgdir}"/usr/lib/${pkgbase}/webapp/
  echo "${pkgver}" > "${pkgdir}"/usr/lib/${pkgbase}/webapp/version
}

package_riot-desktop() {
  pkgdesc="A glossy Matrix collaboration client for the desktop."
  depends=('riot-web' 'electron')
  backup=("etc/${pkgbase}/config.json")
  cd ${pkgbase}-web-${pkgver}

  install -d "${pkgdir}"/{usr/lib/${pkgbase}/electron{,img},etc/${pkgbase}}

  install -Dm644 package.json -t "${pkgdir}"/usr/lib/${pkgbase}
  cp -r electron/src "${pkgdir}"/usr/lib/${pkgbase}/electron/
  install -Dm644 electron/img/riot.png -t "${pkgdir}"/usr/lib/${pkgbase}/electron/img
  install -Dm644 electron/riot.im/config.json -t "${pkgdir}"/etc/${pkgbase}

  install -Dm644 "${srcdir}"/${pkgbase}.desktop "${pkgdir}"/usr/share/applications/${pkgbase}.desktop
  install -Dm755 "${srcdir}"/${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}

  install -Dm644 src/skins/vector/img/logos/${pkgbase}-logo.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${pkgbase}.svg
  for i in 16 24 48 64 96 128 256 512; do
    install -Dm644 electron/build/icons/${i}x${i}.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/${pkgbase}.png
  done
}
