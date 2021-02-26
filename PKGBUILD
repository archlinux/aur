# Maintainer: zer0def <zer0def@github>
# Contributor: Kirill Goncharov <kdgoncharov cat gmail dog com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sébastien Luttringer
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Christer Edwards <christer.edwards@gmail.com>

pkgname=salt-py3
pkgver="${PKGVER:-3002.5}"
pkgrel=2

pkgdesc='Central system and configuration manager'
arch=('any')
url='http://saltproject.io/'
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
source=(
    "https://pypi.io/packages/source/s/salt/salt-${pkgver}.tar.gz"
    "salt.logrotate"
    #"egg-requires.txt"
    #"zeromq-requirements.txt"
)

sha512sums=(
  "${PKGSUM_SHA512:-dda2caa338f646ec51d2de6b0df10fbb27eceddbe8c797ae192b9ef1312d566ae71a243a3a95918fa375b125089aa29a73b1b908c5cc1b0451dccb582a4978a1}"
  "9b667483073f1e396e47ab7b434657a973337e2dd10ae533eb20ccfaa1cb53dc5e1b65eeddbb58317161dfd3c851d80dd1f827dc32b1fb34e8b538c0b7af1de2"
  #"75af367bfb8a2998d0214b05146d65964f5ea32f48d4b49bd60c593437986bda7cdba322ac77dd0b5effc602ecf5584c8934bfede4ec1e7f3ae3ea21e4bbb149"
  #"75872c7ad32291cbe13dfc7fbf874ee171ef25b13a9b58a99faa71a1d1410cac2073f0472fd4ffb49f9d543a67140e90c36d974b072df0fcd9620051393c7b07"
)

b2sums=(
  "${PKGSUM_B2:-baa90bb0caea572dfbe12d92fb488ee0c4adef9a07221f394009cd43a62ffef18c57f2e7cdcfcd923807c7a3d02ce6833480f74d70250c29d311420f30514300}"
  "0184dc30496c44add470c9d2f922133db5a43917040b3cc74025535132c5819edebc4523fa6d62a2b823fafe8ed8b7eeb3c489ad849cd1deea6f709c1e872317"
  #"99907b061422ad89c27e81c2524c0b342b185d5d85696e590c16cffad31efb27d6a9ed38a07cb40dd167363fd4851a546d2eba29c7af253a4e4103521915bf1c"
  #"0b536dc81d33dd751b8d9591a2500a7f42f8dfe96e76d62f67b1f5a54c9fc41e3fa0fa0cba04ac12d9d2a8cab3f77e7b56ce428909e791e721a51b51e4c50594"
)

prepare(){
  #echo "pycryptodomex" > "${srcdir}/salt-${pkgver}/requirements/crypto.txt"
  #install -Dm0644 "${srcdir}/egg-requires.txt" "${srcdir}/salt-${pkgver}/salt.egg-info/requires.txt"
  #install -Dm0644 "${srcdir}/zeromq-requirements.txt" "${srcdir}/salt-${pkgver}/requirements/zeromq.txt"
  :
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
