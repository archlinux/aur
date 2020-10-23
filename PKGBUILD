# Maintainer: zer0def <zer0def@github>
# Contributor: Kirill Goncharov <kdgoncharov cat gmail dog com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sébastien Luttringer
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Christer Edwards <christer.edwards@gmail.com>

pkgname=salt-py3
pkgver="${PKGVER:-3002}"
pkgrel=3

pkgdesc='Central system and configuration manager'
arch=('any')
url='http://saltstack.org/'
license=('Apache')

provides=('salt')
replaces=('salt' 'salt-zmq' 'salt-raet')
conflicts=('salt' 'salt-zmq' 'salt-raet')

depends=('python-jinja'
         'python-msgpack'
         'python-yaml'
         'python-markupsafe'
         'python-requests'
         'python-pyzmq'
         'python-m2crypto'
         'python-systemd'
         'python-distro'
         'python-pycryptodomex')
optdepends=('dmidecode: decode SMBIOS/DMI tables'
            'python-pygit2: gitfs support')

backup=('etc/logrotate.d/salt'
        'etc/salt/master'
        'etc/salt/minion')

install=salt.install
source=("https://pypi.io/packages/source/s/salt/salt-${pkgver}.tar.gz"
        "salt.logrotate")

sha512sums=(
  "${PKGSUM_SHA512:-7a3ed78b301e9c1ef65c8e6aeeaebc2376b3942e94e38b0591860fa1d9213c6c0f85db4d932b4c7c9d20717027a686690973d0dfd2aff17f44abae0ec0e97d31}"
  "9b667483073f1e396e47ab7b434657a973337e2dd10ae533eb20ccfaa1cb53dc5e1b65eeddbb58317161dfd3c851d80dd1f827dc32b1fb34e8b538c0b7af1de2"
)

b2sums=(
  "${PKGSUM_B2:-7463cfe558515697177fedb25fdf9f2e2819b62e3a96c8196b4243a4f2a59a202ac5a3869138b2df00fb47238329ba102396b464379f09d2a79c8c0a672638fb}"
  "0184dc30496c44add470c9d2f922133db5a43917040b3cc74025535132c5819edebc4523fa6d62a2b823fafe8ed8b7eeb3c489ad849cd1deea6f709c1e872317"
)

prepare(){
  echo "pycryptodomex" > "${srcdir}/salt-${pkgver}/requirements/crypto.txt"
}

build() {
  cd "${srcdir}/salt-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 salt.logrotate "${pkgdir}/etc/logrotate.d/salt"

  cd "${srcdir}/salt-${pkgver}"
  python setup.py --salt-pidfile-dir="/run/salt" install --root="${pkgdir}" --optimize=1 --skip-build

  # default config
  install -Dm644 conf/master "${pkgdir}/etc/salt/master"
  install -Dm644 conf/minion "${pkgdir}/etc/salt/minion"

  # systemd services
  for _svc in salt-master.service salt-syndic.service salt-minion.service salt-api.service; do
    install -Dm644 pkg/${_svc} "${pkgdir}/usr/lib/systemd/system/${_svc}"
  done
  install -Dm644 pkg/salt.bash "${pkgdir}/usr/share/bash-completion/completions/salt"
  install -Dm644 pkg/zsh_completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_salt"
}

# vim:set ts=2 sw=2 et:
