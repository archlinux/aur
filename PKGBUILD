# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=linkwarden
pkgver=2.9.2
pkgrel=2
pkgdesc="Self hosted bookmark manager"
arch=('x86_64')
url="https://github.com/linkwarden/linkwarden"
license=('AGPL-3.0')
backup=("etc/linkwarden/app.conf")
depends=('nodejs' 'yarn' 'postgresql' 'monolith' 'enchant' 'libwebp' 'nss' 'nspr' 'atkmm' 'libdrm' 'libxcomposite' 'libxdamage' 'libxrandr' 'mesa' 'libxkbcommon' 'pango' 'alsa-lib')
makedepends=()
optdepends=()
options=(!debug)
source_x86_64=(
https://github.com/linkwarden/linkwarden/archive/refs/tags/v$pkgver.tar.gz
app.conf
dbinit.sh
linkwarden.sysusers
linkwarden.tmpfiles
linkwarden.install
linkwarden.service
)
sha512sums_x86_64=(
341dbb53c643ff58cd6e398d3f3a22ef07a635f6f89de182a10b174db6aacacf1bb0a6e41b7c29322bbf5e23dfc3cc1bf2aa52e2913516fa582dde0c19132885
aeb567c588f903e58c1b87e41bd4a950eb775252226c1534a1621d01f46cfb2f27e32657c40d4b154e150ac9e80b62d7b532aac8d0bb8ce5f28c4a1ca454ce6d
cc19aaf0156fa84fbbfa7dc13712426a7f2285c67552d4c2317b9de2769aefb3af6253d790edb28e026c242c1a8d4d5e2f4e08c385e5eb157eb0a03c25bef5f4
4ad8d81c4c2912fb0b868754f2bb7ade7061f6a42f3b15e70203568743f3f0083f62b7ef7577b03b107b84870bd8dab2f70a921a3a61f7a9d9c913608f78f0ae
b7ae4c609fc1e4450e4d47d0b99ea7af20c8abbc72677c7cd1f8d34c755f555bb32d64e06ce7649d4ff4deb0f316d6efb2def139d8fea1c9ffe0485c56d04930
31a366430b7bdc0d9100ed366dffd1b0e7fd593c1b5b0e6f9aa62a3bb862ee73f4d89f8d996f9f501b65376a014565723adaabaa02ace3f0bfed3eb97079010a
9b987e19043c03a5a1fe2eecbff50f54f205404316359f7c211b589d9cd4e689beca14dd671e1e8966881a1988cdf0affbf2ca25eb1a8ded3f532fb899e9a17f
)

build() {
    # https://github.com/microsoft/playwright/issues/2621#issuecomment-931530175
    cd "${srcdir}"

    cd linkwarden-$pkgver
    yarn install
    yarn build
}

package() {

mkdir -p $pkgdir/usr/share/webapps/linkwarden
install -Dm 644 ${srcdir}/app.conf $pkgdir/etc/linkwarden/app.conf
install -Dm 744 ${srcdir}/dbinit.sh $pkgdir/usr/share/webapps/linkwarden
cp -Ra $srcdir/linkwarden-$pkgver/* $pkgdir/usr/share/webapps/linkwarden
cp -Ra $srcdir/linkwarden-$pkgver/* $pkgdir/usr/share/webapps/linkwarden
cp -Ra $srcdir/linkwarden-$pkgver/.next $pkgdir/usr/share/webapps/linkwarden/
install -Dm 644 ${srcdir}/linkwarden.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
install -Dm 644 ${srcdir}/linkwarden.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
install=linkwarden.install
install -Dm 644 ${srcdir}/linkwarden.service -t "$pkgdir"/usr/lib/systemd/system/
}
