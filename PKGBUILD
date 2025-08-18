# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: max-k <max-k AT post DOT com>

pkgname=openvpn-update-systemd-resolved
_name=update-systemd-resolved
pkgver=2.0.0
pkgrel=3
pkgdesc='Helper script designed to integrate OpenVPN with systemd-resolved via DBus'
arch=('any')
url="https://github.com/jonathanio/$_name"
license=('GPL-3.0-or-later')
depends=('bash>=4.3' 'coreutils' 'iproute2' 'openvpn' 'polkit' 'systemd>229')
optdepends=('python: IP Parsing and Validation'
            'sipcalc: IP Parsing and Validation'
            'util-linux: logging'
            'jq: generating polkit rules'
            'perl: generating polkit rules')
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.install")
install=$pkgname.install
b2sums=('c187b596977bc704d1359788056a634409432f4cd1c84823704a949086ecc4d0f4d2800a64684ee1abf2dfce176d4e9ea088b026e0bb8076fd0cc592ea0c1433'
        '7244cce2a06ba33f038b9dfddfdf225468fa56525f1beed10bb63f05bc8a2f8e055cc11a94c9b28066959ce7e27a72b2fe53924bdfe9fe74ff5a37de8c2e2e14')

prepare() {
    cd $_name-$pkgver
    ./$_name print-polkit-rules \
        --polkit-allowed-user=openvpn \
        --polkit-allowed-group=network \
        > $_name.rules
}

package() {
    cd $_name-$pkgver
    install -Dm755 $_name "$pkgdir/usr/bin/$_name"
    install -Dm644 $_name.rules "$pkgdir/usr/share/polkit-1/rules.d/00-$_name.rules"
    install -Dm644 $_name.conf "$pkgdir/usr/share/doc/openvpn/$_name.conf"
}
