# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=sulis-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Turn based tactical RPG with several campaigns, written in Rust"
arch=('x86_64')
url="https://www.sulisgame.com"
license=('GPL3')
provides=('sulis')
depends=('bash' 'alsa-lib')
makedepends=('gendesk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Grokmoo/sulis/releases/download/${pkgver}/sulis-${pkgver}-linux64.zip"
        'sulis.png')
sha256sums=('4d3b0ab40e466679040ab20738f86519305c4e11c16f24c3bb509e1cd05c276b'
            '7bffe4886ea6dc139135790f8711611a1cccdc8d3b318ae18ff3227e915c604d')

prepare() {
  cd "${srcdir}/sulis"
  echo "#!/usr/bin/env bash
  cd /opt/sulis
  ./sulis" > sulis.sh
  chmod 755 sulis.sh
  gendesk -f -n --pkgname "sulis" --pkgdesc "${pkgdesc}" --exec="sulis.sh" --categories=Game --icon sulis
}

package() {
  cd "${srcdir}/sulis"
  mkdir -p ${pkgdir}/opt/sulis
  cp -R ${srcdir}/sulis/* ${pkgdir}/opt/sulis
  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/sulis/sulis.sh ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/applications
  install -Dm644 "sulis.desktop" "${pkgdir}/usr/share/applications/sulis.desktop"
  mkdir -p ${pkgdir}/usr/share/pixmaps/
  install -Dm644 "${srcdir}/sulis.png" "${pkgdir}/usr/share/pixmaps/sulis.png"
}
