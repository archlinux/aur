# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=linkwarden
pkgver=2.9.3
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
e4a9a1a1d312587bf03022354e22a73b06dbb09dbf7b02e9daef94d19edaf76dfffbbfeebfeca8f246de459b762f0db43e27b3511d7f2314b2cded7dab77f8b3
aeb567c588f903e58c1b87e41bd4a950eb775252226c1534a1621d01f46cfb2f27e32657c40d4b154e150ac9e80b62d7b532aac8d0bb8ce5f28c4a1ca454ce6d
cc19aaf0156fa84fbbfa7dc13712426a7f2285c67552d4c2317b9de2769aefb3af6253d790edb28e026c242c1a8d4d5e2f4e08c385e5eb157eb0a03c25bef5f4
ccc4088e8e9732164735781364d73e2d6d393477dd8d2f9b6f6b5aa2209784a08c4ce9350db565e0b6e02e94e590e839ad3b22d468952198fe67c09d75f9d188
d0165dd3671263fadf36364d0d54e3e0c86294c2efb0ca15cefbe618750921c95cebcca57dc37f85ab426a26cff05185844132543e10f92ed283c594462b8074
7354a8ccff900048bf0c5d1bf2f156d782555d005cec90e30e38635e6483166d769314418588b84ea2d9f5f23b2acb6512a82bb1296f9edd779637e17aac9073
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
