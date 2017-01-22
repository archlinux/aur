# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

pkgbase=riot
pkgname=('riot-desktop' 'riot-web')
pkgver=0.9.6
pkgrel=3
pkgdesc="A glossy Matrix collaboration client, web and desktop versions."
arch=('any')
url="https://riot.im/"
license=('Apache')
makedepends=('npm' 'git' 'phantomjs' 'hicolor-icon-theme')
source=(${pkgbase}-${pkgver}.tar.gz::"https://github.com/vector-im/riot-web/archive/v$pkgver.tar.gz"
        "${pkgbase}.desktop"
        "${pkgbase}-desktop.sh"
        "${pkgbase}.svg")
sha512sums=('074156096fb7382b2914c48dd15eb7af660ec0268729e087f002c2da6f1561137cfd98afe752bd90627bc9998d6ef3dd5202d33f6a8aa4ba460a41c0356606d2'
            'c2622a1fa082fdf114f0280e001c9d3b07846741a6adc434d36c32ee7b5799d7b6bea87f00fc18765a58b29bfd663f4053d7cf82ee0e58161303ac0208aed32a'
            '54983356d5f51822fa88fdf5eefb6733aebfaa9e8c1fad228c05e27e39b3ccb90d9ef89d0cf8ee1aeb8c60343b0a73701178618a2f2a2fb4e8c870120fd2c504'
            'bf88f617f7327b73e10d452c4f316f39e999874c25c6eac124036a28508c9ecadcc15e9540c4297903f1bac88cc580c48f69220c455369a8a21eef688071966b')
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
}

package_riot-desktop() {
  pkgdesc="A glossy Matrix collaboration client for the desktop."
  depends=('riot-web' 'electron')
  backup=("etc/${pkgbase}/config.json")
  cd ${pkgbase}-web-${pkgver}

  install -d "${pkgdir}"/{usr/lib/${pkgbase}/electron,etc/${pkgbase}}

  install -Dm644 package.json -t "${pkgdir}"/usr/lib/${pkgbase}
  cp -r electron/src "${pkgdir}"/usr/lib/${pkgbase}/electron/
  install -Dm644 electron/riot.im/config.json -t "${pkgdir}"/etc/${pkgbase}

  install -Dm644 "${srcdir}"/${pkgbase}.desktop "${pkgdir}"/usr/share/applications/${pkgbase}.desktop
  install -Dm755 "${srcdir}"/${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}

  install -Dm644 "${srcdir}"/${pkgbase}.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${pkgbase}.svg
  for i in 16 24 48 64 96 128 256 512; do
    install -Dm644 electron/build/icons/${i}x${i}.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/${pkgbase}.png
  done
}
