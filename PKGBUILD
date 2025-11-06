# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=musoq
_pkgname=Musoq
_pkgauthor=Puchaczov
pkgver=0.20.4
pkgrel=1
pkgdesc="SQL Swiss Army Knife - Engine for Diverse Data Sources"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlcli="https://github.com/${_pkgauthor}/${_pkgname}.CLI/releases/download/${pkgver}"
license=('MIT')
provides=("${pkgname}")
depends=('gcc-libs' 'zlib' 'glibc')
makedepends=('unzip')
options=('!strip')
noextract=("${_pkgname}_${pkgver}_${CARCH}.zip")
source=("README-${pkgver}.md.1::https://raw.githubusercontent.com/Puchaczov/Musoq/master/README.md"
        "README-${pkgver}.md.2::https://raw.githubusercontent.com/Puchaczov/Musoq.DataSources/main/readme.md"
        "README-${pkgver}.md.3::https://raw.githubusercontent.com/Puchaczov/Musoq.CLI/main/README.md"
        "musoq.service")
source_x86_64=("${_pkgname}_${pkgver}_${arch[0]}.zip::${_urlcli}/${_pkgname}-linux-x64.zip")
source_aarch64=("${_pkgname}_${pkgver}_${arch[1]}.zip::${_urlcli}/${_pkgname}-linux-arm64.zip")
sha256sums=('d638d3476b6b4f1bb8d4b737630dd4a7d548d0123b21937503e374edf2a7f87a'
            'fd94ecc512bf459968d0bf2ceee3c82664f87e1e97a16f9b5028754f617b7bd8'
            '5f0ea03b386f2cd135eefa371ebbc16cfd23595771190d20ded479fbcd72d4bc'
            'b3af2729a26bb0cfbdbeef32755e76b5b7f7d65a02d4b9b8fe708f4f096f3ccc')
sha256sums_x86_64=('0f13d720724bfd44f016d497311552d4cd64d7a591629e4a8b55142dcf5d7d59')
sha256sums_aarch64=('cbf22d87a978dc80e4e5935f644ad421bd1ad01adda3cde272399d7ef49d6135')

build() {
    cd "${srcdir/}" || exit

    sed -s -e '${p;g;}' ./*.md.{1,2,3} | sed -e '$d' > ./README-${pkgver}.md
}

package() {
    cd "${pkgdir}/" || exit

    install -dm777 "${pkgdir}/opt/${_pkgname}/"
    unzip -q "${srcdir}/${_pkgname}_${pkgver}_${CARCH}.zip" -d "${pkgdir}/opt/${_pkgname}/"
    chmod -R 777 "${pkgdir}/opt/${_pkgname}/"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -rsf "${pkgdir}/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/musoq.service" -t "${pkgdir}/usr/lib/systemd/user/"

    install -Dm644 "${pkgdir}/opt/${_pkgname}/license.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
