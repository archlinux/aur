# Maintainer: Allen Zhong <pdev@zhoal.pw>
# Maintainer: Liqueur Librazy <im@librazy.org>
# Contributor: Jian Zeng <anonymousknight96@gmail.com>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
pkgbase=tidb-bin
_basever=8.4.0
#_relver=-prega
#pkgver=$_basever.$_relver
pkgver=$_basever
pkgrel=1
pkgname=("${pkgbase}")
pkgdesc="A distributed NewSQL database compatible with MySQL protocol"
arch=('x86_64' 'aarch64')
url="https://github.com/pingcap/tidb"
license=('APACHE')
depends=('gcc-libs')
conflicts=('tidb-bin-nightly' 'tidb' 'tikv' 'tikv-pd')
options=('strip' 'debug')
backup=(etc/tidb/tidb.toml
        etc/tikv/tikv.toml
        etc/pd/pd.toml
)
source_x86_64=("https://tiup-mirrors.pingcap.com/tidb-v$_basever-linux-amd64.tar.gz"
        "https://tiup-mirrors.pingcap.com/tikv-v$_basever-linux-amd64.tar.gz"
        "https://tiup-mirrors.pingcap.com/pd-v$_basever-linux-amd64.tar.gz")
source_aarch64=("https://tiup-mirrors.pingcap.com/tidb-v$_basever-linux-arm64.tar.gz"
        "https://tiup-mirrors.pingcap.com/tikv-v$_basever-linux-arm64.tar.gz"
        "https://tiup-mirrors.pingcap.com/pd-v$_basever-linux-arm64.tar.gz")
source=(pd.service
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
sha256sums=('b03d12f2f8d6eb2e9d654d6258ca39000225cdf1418840f7e35081631bc4d924'
            '22318c19bb89ff5a0852df5186cc1496214cd49f2264192413a326d1e8c93dc9'
            '870b8eaf83bc0d22b05b0f3a7890660e483cf77bb1d84bc50ad04fb23068cd8c'
            '5edd250ba9e70a4f8d27581ed658f0fbfeca58ca62429dec12bb5fffc0919b67'
            '15633aaa2d7726375112a1b5af88105878f09c176a542cde6d0e5f0c4eee4495'
            '2b147d80985e714d5f861baf76591104c07058b9b6fa573bf0676d675cf8fc20'
            '30ce83fbec8f102c30e438282bb5b18c026d08480f2386d68f1116c12481bf66'
            '744b252e29099b0099dc41e30bc3badd33b3d661c7126af8044faa4fc2df8927'
            '935291bac6a216c6f880df9bfaec8900266413bb202ac483e79f291e1f28e9f1'
            '44de9aed72b8bc9156db354dcddfe0624f2fe4fc91e903fe64892913cae93e0f'
            'f32709894c0d2c105a4398dcaf027f1cbdee359a2a6747f43cac819e9df25517'
            '1c933198cd9b5611bd7d25f4f3501bd1b580bb35352f8d65bc1cef8588400d24')
sha256sums_x86_64=('32e22337fca45fe02c9747a4b1578b3f73caabe15a7b37b7b4e60089084a81a1'
                   'df3b5293ae2d9b8962d0dbb37d19ee7a07dbabe67594f3a44206157291d5ef01'
                   '91a3bf7a09ecbd47d926aba2a644f0f2d2ae76625d25ae996c8fd7def7bea1a3')
sha256sums_aarch64=('a1aa3dac7556edb660b1136d7175ce5b33822adcf5a99ecdc838191e8c5e2fda'
                    'e83761e711a18ae1c6ef8c263b37e92c9e0e633ae04e74b80227530fc0349500'
                    '906f2c0bfbc8cf1969b24bb0c7db1704e36572c4dd91d73770a66fbe1a8f0361')

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

    install -dm755 "$pkgdir"/etc/{pd,tidb,tikv}
    install -dm755 "$pkgdir"/usr/bin
    install -Dm755 {pd,tidb,tikv}-server "$pkgdir"/usr/bin
}

for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

