# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=automua
pkgver=2022.7
pkgrel=1
pkgdesc="Email client configuration made easy"
arch=('any')
license=('GPL3')
backup=('etc/automua/automua.conf')
url='https://github.com/HLFH/automua'
depends=('python39')
source=('setupvenv.sh'
        'automua.sysusers'
        'automua.conf'
        'automua.service'
        'automua.tmpfiles')
b2sums=('4d6868b21a2d8f3b4ccd0325b65d11764b7c2aaca8511b72893a46e7a320116b03e3a093492ff926ee4416d50e10b943addb7983b9d3052f926e370cd2416b09'
        '9f5f26ee77c39c9988c60fbfa6ea0e492a00769bc8e827da88d149e78d919f2eff1ac160ff5af82deddeea03581dc150278564bdcf7401e42c337f4977a2ff07'
        '1ecda927911fe33f96c4a040593e190185b7c5450411c2b26ad4c35953c6d27813316bfff88fa3fcfd48c06fa1f2e4444f23a7ad8dff149a2661d404c28ea216'
        'd3178ce618d8ffe4a0c66f6f78ae59f7e9ecf7a592120509413cfd8e20591dae855ac748cc1836dc5dfb908981e794101e4f0de26de7bf46b608345532c8375e'
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
