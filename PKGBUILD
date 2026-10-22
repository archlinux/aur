# Maintainer: Wuxxin <wuxxin@gmail.com>
# Contributor: zer0def <zer0def@github>
# Contributor: foudil - github.com/foudfou
# Contributor: Johannes Larsen - github.com/johslarsen
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Christer Edwards <christer.edwards@gmail.com>

pkgname=salt
pkgver=3008.3
pkgrel=1
pkgdesc='Portable, distributed, remote execution and configuration management system'
arch=('any')
url='https://saltproject.io/'
license=('Apache-2.0')
replaces=('salt-zmq' 'salt-raet')
conflicts=('salt-zmq' 'salt-raet')
# dependency groups: base, crypto, zeromq
# ignore contextvars, timelib
# extra: systemd, passlib, bcrypt
depends=(
    'python-jinja'
    'python-jmespath'
    'python-msgpack'
    'python-yaml'
    'python-markupsafe'
    'python-networkx'
    'python-requests'
    'python-certifi'
    'python-distro'
    'python-psutil'
    'python-packaging'
    'python-looseversion'
    'python-tornado'
    'python-aiohttp'
    'python-urllib3'
    'python-croniter'
    'python-setproctitle'
    'python-pyopenssl'
    'python-dateutil'
    'python-gnupg'
    'python-cherrypy'
    'python-importlib-metadata'
    'python-cryptography'
    'python-pycryptodomex'
    'python-pyzmq'
    'python-systemd'
    'python-passlib'
    'python-bcrypt'
)

makedepends=(
    'python-setuptools'
)
optdepends=(
    'dmidecode: decode SMBIOS/DMI tables'
    'python-pygit2: gitfs support'
)
#checkdepends=('python-pytest' 'python-psutil')
backup=(
    'etc/logrotate.d/salt'
    'etc/salt/master'
    'etc/salt/minion'
)
install=salt.install
source=(
    "https://pypi.io/packages/source/s/salt/salt-$pkgver.tar.gz"
    salt.logrotate
    httprequests.patch
)
sha256sums=('4bfa995ecde1491916bc9fd0abebf38d39eaca24c1e99e29c5046b97b8754f30'
    'abecc3c1be124c4afffaaeb3ba32b60dfee8ba6dc32189edfa2ad154ecb7a215'
    '6a8bd4bd183b328d4a6a2b14ec79ee01fc1566b418fb13daa38d62269afb9ea5')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -N -p1 -i "${srcdir}/httprequests.patch"
    for i in contextvars rpm-vercmp; do
        sed -i -E "/^${i}[[:space:]]*([=><]|$)/d" "${srcdir}/${pkgname}-${pkgver}/requirements/base.txt"
    done
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {

    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py --salt-pidfile-dir="/run/salt" install --root="$pkgdir" --optimize=1 --skip-build

    # workaround KeyError: 'config.option'
    for i in salt-api salt-call salt-cloud salt-cp salt-key salt-master salt-minion salt-proxy salt-run salt-ssh salt-syndic; do
        _func=$(echo ${i} | sed 's/-/_/g')
        rm -f ${pkgdir}/usr/bin/${i}
        cat >${pkgdir}/usr/bin/${i} <<EOF
#!/usr/bin/env python
import re
import sys
from salt.scripts import ${_func}

if __name__ == "__main__":
    sys.argv[0] = re.sub(r"(-script\.pyw?|\.exe)?$", "", sys.argv[0])
    sys.exit(${_func}())

EOF
        chmod a+x ${pkgdir}/usr/bin/${i}
    done

    # logging
    install -Dm644 "$srcdir/salt.logrotate" "$pkgdir"/etc/logrotate.d/salt
    # default config
    install -v -Dm644 conf/master "$pkgdir/etc/salt/master"
    install -v -Dm644 conf/minion "$pkgdir/etc/salt/minion"

    # systemd services
    for _svc in salt-master.service salt-syndic.service salt-minion.service salt-api.service; do
        install -v -Dm644 pkg/common/$_svc "$pkgdir/usr/lib/systemd/system/$_svc"
    done

    # shell completions
    install -v -Dm644 pkg/rpm/salt.bash "$pkgdir/usr/share/bash-completion/completions/salt"
    install -v -Dm644 pkg/common/salt.zsh "$pkgdir/usr/share/zsh/site-functions/_salt"
    install -v -Dm644 -t "$pkgdir/usr/share/fish/vendor_completions.d" pkg/common/fish-completions/*
}

# vim:set ts=2 sw=2 et:
