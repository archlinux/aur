# Maintainer: Wuxxin <wuxxin@gmail.com>
# Contributor: foudil - github.com/foudfou
# Contributor: Johannes Larsen - github.com/johslarsen
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Christer Edwards <christer.edwards@gmail.com>
# Contributor: zer0def <zer0def@github>

pkgname=salt
pkgver=3007.13
pkgrel=1
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
    urllib.patch
    utilspycrypto.patch
    httprequests.patch
    salt-68327.patch
    foudfou-codecs-open.patch
)
sha256sums=('c663a7386cbd47afe94a6d8b0b1af1fccdc35059ccec2b93310e7920705344fb'
            'abecc3c1be124c4afffaaeb3ba32b60dfee8ba6dc32189edfa2ad154ecb7a215'
            '65794b45a1eee65b83589d4900f50f500cf8cdc8177e8a1c826ca5452625cf47'
            '632dfb02dde6bbd00bcebd0b444ad2d1236042229ffdee0cad4f02e62fdcb8f8'
            'e8ad0830dc48325790b6d13e4128085a82b48396475233a6ab1ad22e5f3df0f9'
            '9389b30aacd9117a1341ed1d67b951654f92b2a07a14f80eda5e368243947a06'
            '2eb49808123f80c53db1a96a34c1cad2d66b3363110f8c800273f6a675763363')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    for i in urllib utilspycrypto httprequests salt-68327 foudfou-codecs-open; do
        patch -N -p1 -i "${srcdir}/${i}.patch"
    done
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
