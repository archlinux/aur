# Maintainer: Allen Zhong <pdev@zhoal.pw>
# Maintainer: Liqueur Librazy <im@librazy.org>
# Contributor: Jian Zeng <anonymousknight96@gmail.com>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
pkgbase=tidb-bin
_basever=8.5.6
#_relver=-prega
#pkgver=$_basever.$_relver
pkgver=$_basever
pkgrel=1
pkgname=("${pkgbase}")
pkgdesc="A distributed NewSQL database compatible with MySQL protocol"
arch=('x86_64' 'aarch64')
url="https://github.com/pingcap/tidb"
license=('Apache-2.0')
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
sha256sums_x86_64=('676768548416d4c36311a857f1f08abb18c4ee91b46d4160d4abdd52b3dc2344'
                   'ae6c6374ba8d82731a2ac67ca88a3fbebd762c8502477599479c52fc4b604206'
                   '024efbd6efc64ae811a8e25aeb27ac611664b685f93425d061846944d2654a9e')
sha256sums_aarch64=('5ed24beac23af81b1e605468cd748288d5f19555adf5f61cdc2c33552f049737'
                    '323b18912e82a9c1b6d054b46880632efd1d4ac5463d5da122fac810fe723de1'
                    '65a6e027f78696101b9d62a4bb8613cc2611ea8e5662c839d3174a0b88690385')

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

