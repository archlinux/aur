# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=docbook-to-man
pkgver=2.0.0
pkgrel=5
pkgdesc="Batch converter from DocBook SGML to nroff/troff man macros."
arch=(i686 x86_64)
url=http://www.oasis-open.org/docbook/tools/dtm/
license=(MIT GPL3)
depends=(opensp)
source=(http://www.oasis-open.org/docbook/tools/dtm/$pkgname.tar.gz
    LICENSE
    regexp.patch)
sha256sums=('f436f8a421351181f8588b01f7f1e7652b0865f8e5c4488de025e4ae7bcd773d'
    'dd5c62c3d904ae6f9bf50efcb01287d972b854f003e1687f2042b9ab28356e77'
    '959715b046a9a66c6799b1acfaa94b3ab28c986b42408e0081379027b6a0a238')
sha512sums=('e762baf10628887eaccb3bc575f27b7555df4d8f739a201e94ebdfdf04880db82d4c4921925b64dacbeb719ed0abfd04bb06beb3493e9ee197e9e51c70fea8e5'
    '90aeb659b516ecf3e78f6389a4bb5278b88a187001f38af614eda86e58a7b573f574813f657e90bf76bf8f50bf697f656470298c685bb571ce5c29ac3c4b1bf2'
    'da1fea6d96688ebaea85e14a0b77bd3c7127c96f2bc5a8fc6ac856cd42f54117a0a7acb21ba0b7bd3f2faa32a0bbd62d47ebcb8fb6e5ca4c7fa5e22ea5eb6ae3')

prepare() {
    cd $pkgname/
    chmod +w -R .
    patch -Np1 -i ../regexp.patch
    find -name Makefile -exec sed -i 's/^ROOT =.*//' '{}' \;
    sed -ri 's:^(ROOT=).*:\1/usr:' cmd/docbook-to-man.sh
}

build() {
    make -C $pkgname ROOT="$pkgdir/usr/"
}

package() {
    install -d "$pkgdir"/usr/{bin,lib}
    make -C $pkgname ROOT="$pkgdir/usr/" install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
