# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=musoq
_pkgname=Musoq
_pkgauthor=Puchaczov
pkgver=0.19.14
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
sha256sums=('9cb1ed0f53a254886ec52a428740d19d0c3b76097827d879752c40fb11b012b3'
            '92760606de68ba5adf8858ca9be4354ee59cd692cac1c5df0c7dddcfe1144816'
            '8cc79bc9659d944aef5bac60d1e2b9d47dd5e48bb1d9614fa86bddbb01d0800f'
            'b3af2729a26bb0cfbdbeef32755e76b5b7f7d65a02d4b9b8fe708f4f096f3ccc')
sha256sums_x86_64=('51f45d18e1feaa88876cdf834bc2f0f0209f8b65b285fe6d27f80629c6666ab4')
sha256sums_aarch64=('1392598742823b1d22ed2c26550171e5367004cafee1bbfa4a8dc7e1710883dc')

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
