# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=musoq
_pkgname=Musoq
_pkgauthor=Puchaczov
pkgver=0.19.11
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
sha256sums=('0cac195768bf1d15a63510b8b874fbdc01df3d5af7392d12a19b2059d4a1ed8d'
            '92760606de68ba5adf8858ca9be4354ee59cd692cac1c5df0c7dddcfe1144816'
            '8cc79bc9659d944aef5bac60d1e2b9d47dd5e48bb1d9614fa86bddbb01d0800f'
            'b3af2729a26bb0cfbdbeef32755e76b5b7f7d65a02d4b9b8fe708f4f096f3ccc')
sha256sums_x86_64=('9ae2cf279d5486049be6b9f16d516dc7661ea70dac005ffda7a4ad1312547af4')
sha256sums_aarch64=('97cbf80bc1b0c51f14a335bdf5f60ae8ee064702c58b8a59d8a5558a7dbb465e')

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
