# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Maintainer: Liqueur Librazy <im@librazy.org>
# Contributor: Jian Zeng <anonymousknight96@gmail.com>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
pkgbase=tidb-bin
_basever=3.0.12
#_relver=-prega
#pkgver=$_basever.$_relver
pkgver=$_basever
pkgrel=1
pkgname=("${pkgbase}" "${pkgbase}-utils")
pkgdesc="A distributed NewSQL database compatible with MySQL protocol"
arch=('x86_64')
url="https://github.com/pingcap/tidb"
license=('APACHE')
depends=('gcc-libs')
conflicts=('tidb-bin-nightly' 'tidb' 'tikv' 'tikv-pd')
options=('strip' 'debug')
source=("https://download.pingcap.org/tidb-v$_basever$_relver-linux-amd64.tar.gz"
        pd.service
        tidb.service
        tikv.service
        pd-sysusers.conf
        pd-tmpfiles.conf
        tidb-sysusers.conf
        tidb-tmpfiles.conf
        tikv-sysusers.conf
        tikv-tmpfiles.conf
        pd.toml
        tidb.toml
        tikv.toml)
sha256sums=('e69eabd881e56cfa971ec63593f4bd84eaa9bfab0a96a33c0ffc1bcf35c0892e'
            'b03d12f2f8d6eb2e9d654d6258ca39000225cdf1418840f7e35081631bc4d924'
            '22318c19bb89ff5a0852df5186cc1496214cd49f2264192413a326d1e8c93dc9'
            '870b8eaf83bc0d22b05b0f3a7890660e483cf77bb1d84bc50ad04fb23068cd8c'
            '5edd250ba9e70a4f8d27581ed658f0fbfeca58ca62429dec12bb5fffc0919b67'
            '15633aaa2d7726375112a1b5af88105878f09c176a542cde6d0e5f0c4eee4495'
            '2b147d80985e714d5f861baf76591104c07058b9b6fa573bf0676d675cf8fc20'
            '30ce83fbec8f102c30e438282bb5b18c026d08480f2386d68f1116c12481bf66'
            '744b252e29099b0099dc41e30bc3badd33b3d661c7126af8044faa4fc2df8927'
            '935291bac6a216c6f880df9bfaec8900266413bb202ac483e79f291e1f28e9f1'
            '11bc441dfd0327c56218f214a9869da20ccdf7e5265c2f5ffca45089ba8094db'
            'a34a8ca1f13c965cc0e872fc671f377b64a80cc11225cd6359bf7415b4c86a06'
            '248790d756d15322ed7af13f30525744c472190ac68a26b486c5eed24427abdf')

_package() {
    provides=("tidb-server=$_basever" "tikv-server=$_basever" "pd-server=$_basever")
    install='tidb.install'

    cd "$srcdir"

    install -Dm644 pd-sysusers.conf "$pkgdir"/usr/lib/sysusers.d/pd.conf
    install -Dm644 pd-tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/pd.conf
    install -Dm644 tidb-sysusers.conf "$pkgdir"/usr/lib/sysusers.d/tidb.conf
    install -Dm644 tidb-tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/tidb.conf
    install -Dm644 tikv-sysusers.conf "$pkgdir"/usr/lib/sysusers.d/tikv.conf
    install -Dm644 tikv-tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/tikv.conf

    install -Dm644 pd.service "$pkgdir/usr/lib/systemd/system/pd.service"
    install -Dm644 tidb.service "$pkgdir/usr/lib/systemd/system/tidb.service"
    install -Dm644 tikv.service "$pkgdir/usr/lib/systemd/system/tikv.service"

    install -Dm644 pd.toml "$pkgdir/etc/pd/pd.toml"
    install -Dm644 tidb.toml "$pkgdir/etc/tidb/tidb.toml"
    install -Dm644 tikv.toml "$pkgdir/etc/tikv/tikv.toml"

    cd "tidb-v$_basever$_relver-linux-amd64/bin"
    install -dm755 "$pkgdir"/etc/{pd,tidb,tikv}
    install -dm755 "$pkgdir"/usr/bin
    install -Dm755 {pd,tidb,tikv}-server "$pkgdir"/usr/bin
}

_package-utils() {
    optdepends=('go-tools: provides goyacc')
    cd "tidb-v$_basever$_relver-linux-amd64/bin"
    install -dm755 "$pkgdir"/usr/bin
    install -Dm755 *ctl "$pkgdir"/usr/bin
    install -Dm755 pd-recover "$pkgdir"/usr/bin
    install -Dm755 drainer "$pkgdir"/usr/bin
    install -Dm755 pump "$pkgdir"/usr/bin
    install -Dm755 reparo "$pkgdir"/usr/bin
}

for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

