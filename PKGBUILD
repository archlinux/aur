# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=ownfoil-git
pkgver=r212.628ae62
pkgrel=1
pkgdesc='Switch library manager, with a self-hosted Tinfoil Shop'
arch=('any')
url='https://github.com/a1ex4/ownfoil'
license=('custom')
depends=(
  'python'
  'python-flask'
  'python-flask-login'
  'python-flask-sqlalchemy'
  'python-yaml'
  'python-requests'
  'python-unzip-http'
  'python-watchdog'
  'python-werkzeug'
  'python-zstandard'
  'python-enlighten'
  'python-pycryptodome'
)
source=("git+https://github.com/a1ex4/ownfoil"
        "git+https://github.com/a1ex4/NSTools"
        'ownfoil.service'
        'ownfoil.sysusers'
        'ownfoil.tmpfiles'
)
sha256sums=('SKIP'
            'SKIP'
            'ca34797e34977d7c40a1f021a6dcaee47a00894973a4e378925bfe4bd8938fcf'
            'aee7a6c72d655e29365fe266165ffb714666507a9536871500ced59e0f5d992f'
            'e5a47f09f5177ef2ca576b72adcbbb4b337978cb2dead3cd738ee8844f2c4304')

pkgver()
{
  cd ownfoil
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
  cd ownfoil
  git submodule init
  git config submodule.libs/libdep.url "${srcdir}/NSTools"
  git -c protocol.file.allow=always submodule update
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
