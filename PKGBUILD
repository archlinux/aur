# Maintainer: Nicolas Stinus <nicolas.stinus@gmail.com>

pkgname=openvpn-nordvpn
pkgver=0.1.41
pkgrel=1
pkgdesc="OpenVPN helper script for nordvpn.com"
arch=(any)
url="https://github.com/nstinus/nordvpn"
license=('MIT')
depends=('openvpn'
         'systemd'
         'openvpn-update-resolv-conf-git'
         'curl'
         'unzip'
         'sudo'
         'coreutils'
         'bc'
         'fping')
optdepends=('iputils: run ping and rank functions'
            'vpnfailsafe-git: use instead of update-resolv-conf if available'
            'python-pandas: run nordvpn infos command'
            'bash-completion: auto-complete commands'
            'jq: pick recommended server for "start" command')
makedepends=('coreutils' 'asciidoc' 'git')
provides=('nordvpn')
source=("git+https://github.com/nstinus/nordvpn.git#commit=${NORDVPN_COMMIT:-v0.1-41-gfbdfbfd}")
sha1sums=('SKIP')
install=${pkgname}.install

pkgver() {
    git --git-dir $(pwd)/nordvpn/.git describe --always --long --match "v?.?" \
        | sed 's/-/./' \
        | cut -d '-' -f 1 \
        | sed 's/v//'
}

build() {
    sed "s/@version@/$pkgver/g" nordvpn/doc/man.asciidoc > man.asciidoc \
        && a2x --doctype manpage --format manpage man.asciidoc \
        && gzip -f nordvpn.8
}

package() {
    install -D -m 644 nordvpn.8.gz $pkgdir/usr/share/man/man8/nordvpn.8.gz
    install -D -m 755 nordvpn/src/nordvpn $pkgdir/usr/bin/nordvpn
    install -D -m 644 nordvpn/src/servers.py $pkgdir/etc/openvpn/client/nordvpn/servers.py
    chmod 750 $pkgdir/etc/openvpn/client $pkgdir/etc/openvpn/client/nordvpn
    install -D -m 644 nordvpn/completion/bash $pkgdir/usr/share/bash-completion/completions/nordvpn
}
