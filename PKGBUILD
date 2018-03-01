# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: whiskerz007 <whiskerz007@gmail.com>
# Based on package by: Denis Saintilma <1068des@gmail.com>

pkgname=tautulli
pkgver=2.0.20
pkgrel=1
pkgdesc="A Python based monitoring and tracking tool for Plex Media Server."
arch=('any')
url="https://github.com/Tautulli/Tautulli"
license=('GPL')
makedepends=('curl')
depends=('python2')
conflicts=('plexpy-git' 'tautulli-beta' 'plexpy')
provides=("tautulli")
replaces=("plexpy")
install='tautulli.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Tautulli/Tautulli/archive/v$pkgver-beta.tar.gz"
        'tautulli.install'
        'tautulli.service'
        'tautulli.sysusers')

sha256sums=('18860e8d4c0f2041c2067a102a2c01549567c764f37b4d0458d6deee3f665ef6'
            '7e959ab5cd7343c1fd21fbd4e14d0740a391b67b01d421ec8c96a7d52527a1d4'
            '3385a234ece298cd1589d06fb60ea07aade778127117f32692d3cdb134023d42'
            'e6bb046d1022f0d2623f42c092f993c395a938a1f2a16c2986e76506bbfb54f8')

prepare() {
  echo "v${pkgver}" > "${srcdir}/Tautulli-${pkgver}-beta/version.txt"
}

package() {
  cd "${srcdir}/Tautulli-${pkgver}-beta"
  install -Dm755 PlexPy.py "${pkgdir}/usr/lib/tautulli/PlexPy.py"
  install -Dm644 pylintrc  "${pkgdir}/usr/lib/tautulli/"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/lib/tautulli/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/tautulli/LICENSE"

  cp -a data/ lib/ plexpy/ "${pkgdir}/usr/lib/tautulli/"

  install -Dm644 "${srcdir}/tautulli.service" "${pkgdir}/usr/lib/systemd/system/tautulli.service"
  install -Dm644 "${srcdir}/tautulli.sysusers" "${pkgdir}/usr/lib/sysusers.d/tautulli.conf"
  install -Dm644 "version.txt" "${pkgdir}/usr/lib/tautulli/"

  msg2 "To migrate your plexpy config and db, run the following commands:"
  msg2 "  mv /var/lib/plexpy/* /var/lib/tautulli/"
  msg2 "  sed 's#\/var\/lib\/plexpy#\/var\/lib\/tautulli#g' -i /var/lib/tautulli/config.ini"
  msg2 "  sudo chown -R tautulli: /var/lib/tautulli"
}

