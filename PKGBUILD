# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Maintainer: Liqueur Librazy <im@librazy.org>
# Contributor: Jian Zeng <anonymousknight96@gmail.com>
pkgbase=tidb-bin
_basever=2.0.0
_rcver=6
pkgver=$_basever.rc$_rcver
pkgrel=2
pkgname=("${pkgbase}" "${pkgbase}-utils")
pkgdesc="A distributed NewSQL database compatible with MySQL protocol"
arch=('x86_64')
url="https://github.com/pingcap/tidb"
license=('APACHE')
depends=('gcc-libs')
conflicts=('tidb-bin-nightly')
options=('strip' 'debug')
source=("https://download.pingcap.org/tidb-v$_basever-rc.$_rcver-linux-amd64.tar.gz"
        "tidb.sysusers"
	"tidb.tmpfiles"
	)
sha256sums=('3ef3ebd6cfd9a4ae471fef37819b7ca1be3576b6041eddc190622ccaa6b61b8c'
            '6fb6ae67a53c6cd054643542e76da6f16e000b029a98b34172972fcb505fc299'
            '15f285782938b3ebbb8be60cc962a2cbf5ca349527c39d3a1138be1bf976feb9')

_package() {
    provides=("tidb=$_basever")
    install='tidb.install'
    cd "$srcdir"
    install -Dm644 tidb.sysusers "$pkgdir"/usr/lib/sysusers.d/tidb.conf
    install -Dm644 tidb.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/tidb.conf

    cd "tidb-v$_basever-rc.$_rcver-linux-amd64/bin"
    install -dm755 "$pkgdir"/{etc/tidb,usr/bin}
    install -Dm755 *-server "$pkgdir"/usr/bin
}

_package-utils() {
    optdepends=('go-tools: provides goyacc')
    cd "tidb-v$_basever-rc.$_rcver-linux-amd64/bin"
    install -dm755 "$pkgdir"/usr/bin
    install -Dm755 *-ctl "$pkgdir"/usr/bin
    install -Dm755 pd-recover "$pkgdir"/usr/bin
    install -Dm755 pd-tso-bench "$pkgdir"/usr/bin
    install -Dm755 tikv-fail "$pkgdir"/usr/bin
    install -Dm755 tikv-importer "$pkgdir"/usr/bin
}

for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

