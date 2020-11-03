# Maintainer: zer0def <zer0def@github>
# Contributor: Kirill Goncharov <kdgoncharov cat gmail dog com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sébastien Luttringer
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Christer Edwards <christer.edwards@gmail.com>

pkgname=salt-py3
pkgver="${PKGVER:-3002.1}"
pkgrel=1

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
  "${PKGSUM_SHA512:-8fc02d0b47dad60f96eb4442b0e8a31f04d796f12b845c8142135593af4c7ea9c2d9335a3f520f8858951f87b0e8cc6be70d383fde2d93a6d529e077bcc87114}"
  "9b667483073f1e396e47ab7b434657a973337e2dd10ae533eb20ccfaa1cb53dc5e1b65eeddbb58317161dfd3c851d80dd1f827dc32b1fb34e8b538c0b7af1de2"
)

b2sums=(
  "${PKGSUM_B2:-d084dc650b8bc92b4ebdb145a41a39bfbd034064fad65e364260eca84d7105fb645ad8f6cea2cc1b6affb1abf21a9858ab6fb526eaf4ecd8f76c70d1384c7edc}"
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
