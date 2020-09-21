# Maintainer: Kenneth Henderick <kenneth@ketronic.be>

pkgname=zsnapd
pkgver=0.8.11c
pkgrel=2
pkgdesc="ZFS Snapshot Daemon"
arch=('any')
url="https://github.com/grantma/zsnapd"
license=('MIT')
depends=('zfs' 'mbuffer' 'python3' 'python-setproctitle' 'python-psutil' 'python-magcode-core')
optdepends=('openssh: transfer snapshots')
#source=("https://github.com/grantma/$pkgname/archive/v$pkgver.zip")
#sha256sums=('7aca24e007fc9599ce558d9be9d88e9691515717e4ec50709c99797e160c5bbc')
source=("https://github.com/genofire/zsnapd/archive/patch-2.zip")
sha256sums=('SKIP')
install=$pkgname.install

backup=(
  etc/zsnapd/dataset.conf
  etc/zsnapd/process.conf
  etc/zsnapd/template.conf
  etc/zsnapd/zsnapd-rcmd.conf
)

build () {
  #cd ${srcdir}/${pkgname}-${pkgver}
  cd ${srcdir}/${pkgname}-patch-2
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-patch-2
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  mkdir -p ${pkgdir}/etc/zsnapd

  install -Dm 644 etc/zsnapd/dataset.conf ${pkgdir}/etc/zsnapd/dataset.conf
  install -Dm 644 etc/zsnapd/process.conf ${pkgdir}/etc/zsnapd/process.conf
  install -Dm 644 etc/zsnapd/template.conf ${pkgdir}/etc/zsnapd/template.conf
  install -Dm 644 etc/zsnapd/zsnapd-rcmd.conf ${pkgdir}/etc/zsnapd/zsnapd-rcmd.conf

  mkdir -p ${pkgdir}/usr/lib/systemd/system
  install -Dm 644 system/zsnapd.service ${pkgdir}/usr/lib/systemd/system/zsnapd.service

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
