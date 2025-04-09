# Maintainer: Gavin Luo <lunt.luo@gmail.com>

pkgbase=rime-wanxiang-data
pkgname=(rime-wanxiang-data
         rime-wanxiang-gram-zh-hans
         rime-wanxiang-dict-cn)
_schema_version=6.3
pkgver=20250409
pkgrel=2
pkgdesc="万象词库"
arch=(any)
license=('CC-BY-4.0')
url="https://github.com/amzxyz/RIME-LMDG"
source=("wanxiang-lts-zh-hans.${pkgver}.gram::${url}/releases/download/LTS/wanxiang-lts-zh-hans.gram"
        "cn_dicts.${pkgver}.zip::${url}/releases/download/dict-nightly/cn_dicts.zip"
        "https://github.com/amzxyz/rime_wanxiang/archive/refs/tags/v${_schema_version}.tar.gz")
sha256sums=('b91ecc1f9d32be8b945961d7529311bf5c512a1c05c78941d9c0fe61a0af06da'
            '9a1c547af7150584ee74cbfa8586c479e3666366bbb151fd74ade90ea2509aec'
            '58f0bf6f455065ca23332c48e56040aaba953d1e49a319796659d878419b525b')

makedepends=("rime-prelude" "rime-essay" "sed")

build() {
    cd "${srcdir}/rime_wanxiang-${_schema_version}"

    rm -r cn_dicts
    cp -r "${srcdir}/cn_dicts" .

    for _f in $(pacman -Qql rime-prelude rime-essay | grep -v "/$"); do ln -sf $_f; done

    rime_deployer --compile wanxiang.schema.yaml

    find . -type l -delete
}

package_rime-wanxiang-data() {
    pkgdesc="万象词库 Meta 包"
    depends=("rime-wanxiang-gram-zh-hans" "rime-wanxiang-dict-cn")
}

package_rime-wanxiang-gram-zh-hans() {
    pkgdesc="万象词库——语法模型"
    replaces=(rime-lmdg)

    install -Dm664 "${srcdir}/wanxiang-lts-zh-hans.${pkgver}.gram" -t "${pkgdir}"/usr/share/rime-data
}

package_rime-wanxiang-dict-cn() {
    pkgdesc="万象词库——中文词库"

    cd "${srcdir}"

    find cn_dicts -type f -exec install -Dm664 {} "${pkgdir}"/usr/share/rime-data/{} \;

    install -Dm664 "rime_wanxiang-${_schema_version}"/build/wanxiang.*.bin -t "${pkgdir}"/usr/share/rime-data/build
}
