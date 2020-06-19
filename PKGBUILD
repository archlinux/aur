# Maintainer: zer0def <zer0def@github>
# Contributor: Kirill Goncharov <kdgoncharov cat gmail dog com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sébastien Luttringer
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Christer Edwards <christer.edwards@gmail.com>

pkgname=salt-py3
pkgver=3001
pkgrel=2

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
source=("https://pypi.io/packages/source/s/salt/salt-$pkgver.tar.gz"
        "salt.logrotate"
        "msgpack-requirements-fix.patch")

sha256sums=('5ca60d1b2cc8e63db50995bd8b117914eeaf57c48ce2b3a3731ee57163adf154'
            'abecc3c1be124c4afffaaeb3ba32b60dfee8ba6dc32189edfa2ad154ecb7a215'
            '0cb1b198acc79640072fe7925630f4d1950b39208d247e99a8ce6cc9252a27f1')

prepare() {
  cd salt-$pkgver
  patch -p1 <"${srcdir}/msgpack-requirements-fix.patch"
}

build() {
  cd salt-$pkgver
  python setup.py build
}

package() {
  install -Dm644 salt.logrotate "$pkgdir"/etc/logrotate.d/salt

  cd salt-$pkgver
  python setup.py --salt-pidfile-dir="/run/salt" install --root="$pkgdir" --optimize=1 --skip-build

  # default config
  install -Dm644 conf/master "$pkgdir/etc/salt/master"
  install -Dm644 conf/minion "$pkgdir/etc/salt/minion"

  # systemd services
  for _svc in salt-master.service salt-syndic.service salt-minion.service salt-api.service; do
    install -Dm644 pkg/$_svc "$pkgdir/usr/lib/systemd/system/$_svc"
  done
  install -Dm644 pkg/salt.bash "$pkgdir/usr/share/bash-completion/completions/salt"
  install -Dm644 pkg/zsh_completion.zsh "$pkgdir/usr/share/zsh/site-functions/_salt"
}

# vim:set ts=2 sw=2 et:
