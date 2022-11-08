# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=automua
pkgver=2022.6.7
pkgrel=1
pkgdesc="Email client configuration made easy"
arch=('any')
license=('GPL3')
backup=('etc/automua/automua.conf')
url='https://github.com/HLFH/automua'
source=('setupvenv.sh'
        'automua.sysusers'
        'automua.conf'
        'automua.service'
        'automua.tmpfiles')
b2sums=('5baa7fb3b143306fc91187bdd430b9f59c5dd84452ed78321747195c441f9f996ecccd9af6d5ba13219d89308fc3c4865deee837438518eb8e1d85b64903c444'
        '9f5f26ee77c39c9988c60fbfa6ea0e492a00769bc8e827da88d149e78d919f2eff1ac160ff5af82deddeea03581dc150278564bdcf7401e42c337f4977a2ff07'
        '1ecda927911fe33f96c4a040593e190185b7c5450411c2b26ad4c35953c6d27813316bfff88fa3fcfd48c06fa1f2e4444f23a7ad8dff149a2661d404c28ea216'
        'a4fc3b3f999cb29e1c6c3e6030c113a02afa7e5e64318c1a90cba510de36b9cdadb675c7d8feb7d5305d71722b0b73b5c1870d36fee5734df824d1c68fe482bb'
        '5093bc61755faf1641cd99a605e65f84e349bb4870e0822540f2357260bdae11242e8e987be2cc6b55fdee1984ec00cac8f6bff8b44676f929a19823cb5d2d9f')

package() {
  mkdir -p "$pkgdir/etc/automua"
  mkdir -p "$pkgdir/srv/http/automua"
  cd "$pkgdir/srv/http/automua"
  install -Dm644 "${srcdir}/setupvenv.sh" "setupvenv.sh"
  sh setupvenv.sh
  source .venv/bin/activate
  pip install -Iv $pkgname==$pkgver
  pip install mysqlclient lxml
  install -Dm644 "${srcdir}/automua.sysusers" "${pkgdir}/usr/lib/sysusers.d/automua.conf"
  install -Dm644 "${srcdir}/automua.conf" "${pkgdir}/etc/automua/automua.conf"
  install -Dm644 "${srcdir}/automua.service" "${pkgdir}/usr/lib/systemd/system/automua.service"
  install -Dm644 "${srcdir}/automua.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/automua.conf"
}
