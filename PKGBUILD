# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Márcio Sousa Rocha <marciosr10@gmail.com>

pkgname=receitanet
pkgver=1.32
pkgrel=1
pkgdesc='Program for sending files to brazilian federal taxes agency'
arch=('any')
url='https://www.gov.br/receitafederal/pt-br/centrais-de-conteudo/download/receitanet'
license=('LicenseRef-custom')
depends=('java-runtime=11' 'sh')
source=("https://servicos.receita.fazenda.gov.br/publico/programas/receitanet/Receitanet-${pkgver}.deb"
        'receitanet.sh'
        'LICENSE'
        '010-receitanet-desktop-files.patch')
noextract=("Receitanet-${pkgver}.deb")
sha256sums=('cd83766298282df78c69da5b4cfc6d9435403005849e426c2b38c30a6d9e92db'
            '67ff45ba0254b37102d038dc9a1df056b568f372348cbd6a60cac6651d5f599d'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67'
            'b6097ce94080e7efa7aebe45e8da462fb61ff05fc9a5cfa2e638a4e0d4b7a641')

prepare() {
    mkdir -p "receitanet-${pkgver}/data"
    bsdtar -xf "Receitanet-${pkgver}.deb" -C "receitanet-${pkgver}"
    bsdtar -xf "receitanet-${pkgver}/data.tar.gz" -C "receitanet-${pkgver}/data"
    patch -d "receitanet-${pkgver}/data" -Np1 --binary -i "${srcdir}/010-receitanet-desktop-files.patch"
}

package() {
    install -D -m644 "receitanet-${pkgver}/data/opt/Programas RFB/Receitanet/receitanet".{dat,jar} -t "${pkgdir}/usr/share/java/receitanet"
    cp -dr --no-preserve='ownership' "receitanet-${pkgver}/data/opt/Programas RFB/Receitanet/lib" "${pkgdir}/usr/share/java/receitanet"
    install -D -m644 "receitanet-${pkgver}/data/opt/Programas RFB/Receitanet/imagens"/Ajuda.xpm "${pkgdir}/usr/share/pixmaps/receitanet-ajuda.xpm"
    install -D -m644 "receitanet-${pkgver}/data/opt/Programas RFB/Receitanet/imagens"/Receitanet.xpm "${pkgdir}/usr/share/pixmaps/receitanet.xpm"
    install -D -m644 "receitanet-${pkgver}/data/usr/share/applications/rfb-receitanet-ajuda.desktop" "${pkgdir}/usr/share/applications/receitanet-ajuda.desktop"
    install -D -m644 "receitanet-${pkgver}/data/usr/share/applications/rfb-receitanet.desktop" "${pkgdir}/usr/share/applications/receitanet.desktop"
    install -D -m755 receitanet.sh "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
