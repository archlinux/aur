# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=ownfoil-git
pkgver=r238.1d3789f
pkgrel=2
pkgdesc='Switch library manager, with a self-hosted Tinfoil Shop'
arch=('any')
url='https://github.com/a1ex4/ownfoil'
license=('custom')
depends=(
  'python'
  'python-croniter'
  'python-flask'
  'python-flask-login'
  'python-flask-migrate'
  'python-flask-sqlalchemy'
  'python-nstools'
  'python-yaml'
  'python-requests'
  'python-unzip-http'
  'python-watchdog'
  'python-werkzeug'
  'python-zstandard'
)
source=("git+https://github.com/a1ex4/ownfoil"
        'ownfoil.service'
        'ownfoil.sysusers'
        'ownfoil.tmpfiles'
)
sha256sums=('SKIP'
            '528de3cc691edb57a44e512024832a1a1d0947dbbcda84e487b033150edc6193'
            'aee7a6c72d655e29365fe266165ffb714666507a9536871500ced59e0f5d992f'
            'abe899a8eecb080f3b938c2441e09838a539f6bfc00e8207ade74bb18c1a5a12')

pkgver()
{
  cd ownfoil
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  install -m0755 -d "${pkgdir}/usr/lib/ownfoil"
  cp -dr --no-preserve='ownership' "${srcdir}/ownfoil/app/." "${pkgdir}/usr/lib/ownfoil"

  ln -s "/var/lib/ownfoil" "${pkgdir}/usr/lib/ownfoil/config"
  ln -s "/var/lib/ownfoil" "${pkgdir}/usr/lib/ownfoil/data"

  install -Dm0644 "${srcdir}/ownfoil.sysusers" "${pkgdir}/usr/lib/sysusers.d/ownfoil.conf"
  install -Dm0644 "${srcdir}/ownfoil.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ownfoil.conf"
  install -Dm0644 "${srcdir}/ownfoil.service"  "${pkgdir}/usr/lib/systemd/system/ownfoil.service"
}
