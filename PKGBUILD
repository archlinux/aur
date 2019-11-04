# Maintainer: Henry78 <henry78@gmx.at>
# Mainteiner: Donald Webster <fryfrog@gmail.com>

pkgname=runrestic
_name=runrestic
pkgver=0.3.5
pkgrel=1
pkgdesc='A wrapper script for Restic backup software that inits, creates, prunes and checks backups'
arch=(any)
url='https://github.com/andreasnuesslein/runrestic'
license=('GPL3')
depends=('python'
         'python-toml'
         'python-jsonschema')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'runrestic.service'
        'runrestic.timer')

sha256sums=('fc5b4dfcad7a2f387113f0266b6617d72529c0b4619ff1ef50b896416d7ea786'
            'd636f96922c1c018c8cd359c3cedc72ac3764c8ee0aace3265ddc6538a56be5d'
            '1818046fe948b5af475f6f5f751433f173a8444fb36aea4cbfb61dabd34c7b86')

package() {
  cd "${pkgname}-${pkgver}"
  sed -i 's/from distutils.core import setup/from setuptools import setup/' setup.py
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m 644 "${srcdir}/runrestic.service" "${pkgdir}/usr/lib/systemd/system/runrestic.service"
  install -D -m 644 "${srcdir}/runrestic.timer" "${pkgdir}/usr/lib/systemd/system/runrestic.timer"
  sed -i 's%/usr/local%/usr%' ${pkgdir}/usr/lib/systemd/system/runrestic.service
}
