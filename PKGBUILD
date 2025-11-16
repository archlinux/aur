# Maintainer: Wuxxin <wuxxin@gmail.com>
# Contributor: Johannes Larsen - github.com/johslarsen
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Christer Edwards <christer.edwards@gmail.com>
# Contributor: zer0def <zer0def@github>

pkgname=salt
pkgver=3007.8
pkgrel=5
pkgdesc='Portable, distributed, remote execution and configuration management system'
arch=('any')
url='https://saltproject.io/'
license=('Apache')
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
    contextvars.patch
    rpmvercmp.patch
    urllib.patch
    utilspycrypto.patch
    httprequests.patch
)
sha256sums=(
    '59f2b5a487fd83239e31a78db0082b125083393131dae10d3b90a3b3487699e2'
    'abecc3c1be124c4afffaaeb3ba32b60dfee8ba6dc32189edfa2ad154ecb7a215'
    '58996c1fcf6ca1b47e8ab7e9d51b79679abbe791ed180eafbad168fd5c5f5236'
    'fd36d9c603e01d60b76b39e5ac6279d6e88ef3291a15afbb80d956bdf483930a'
    'f9ab2f18fbf85c8a0ebba6aa88fe415f993ca377aaa0f3541b32d29f0d690c5a'
    '632dfb02dde6bbd00bcebd0b444ad2d1236042229ffdee0cad4f02e62fdcb8f8'
    'e8ad0830dc48325790b6d13e4128085a82b48396475233a6ab1ad22e5f3df0f9'
)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    for i in contextvars rpmvercmp urllib utilspycrypto httprequests; do
        patch -N -p1 -i "${srcdir}/${i}.patch"
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
