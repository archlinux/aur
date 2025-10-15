# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=linkwarden
pkgver=2.13.1
pkgrel=1
pkgdesc="Self hosted bookmark manager"
arch=('x86_64')
url="https://github.com/linkwarden/linkwarden"
license=('AGPL-3.0')
backup=("etc/linkwarden/app.conf")
depends=('nodejs' 'yarn' 'postgresql' 'monolith' 'enchant' 'libwebp' 'nss' 'nspr' 'atkmm' 'libdrm' 'libxcomposite' 'libxdamage' 'libxrandr' 'mesa' 'libxkbcommon' 'pango' 'alsa-lib' 'libcups')
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
d8309b31eb71c04998eb0f224d7821f4179d3d7af1a8dfaafb4889ed87209523402e9bf5f8e366f06d2160241d69d7dd687ff14cf402f7d60704bca907800166
aeb567c588f903e58c1b87e41bd4a950eb775252226c1534a1621d01f46cfb2f27e32657c40d4b154e150ac9e80b62d7b532aac8d0bb8ce5f28c4a1ca454ce6d
c5fba38b72bb44fc4eeaa9da3cdd751148cd44c2257371c3c2dde09c391c91e0c1b3075f29df72e9dc97cc40c975b4918931e3bb4cd7f99937368da28edfff9a
ccc4088e8e9732164735781364d73e2d6d393477dd8d2f9b6f6b5aa2209784a08c4ce9350db565e0b6e02e94e590e839ad3b22d468952198fe67c09d75f9d188
d0165dd3671263fadf36364d0d54e3e0c86294c2efb0ca15cefbe618750921c95cebcca57dc37f85ab426a26cff05185844132543e10f92ed283c594462b8074
c5330be69a4341045c01a1db9e889b44504c937c2852d8ea1f54e3f202b90020da1213d7f332ecd1d4c443f6d97aa70e4a39eb67eed76e1274cbd15d6bdcb73d
c37cbe38d52fd5c8a8291c23885b7b73839798e851237bc7a782bcdb1b896bd0b97e8c8218bced55e1b68240c827c7829bc415d3e052299ecd049d08e00cd0d0
)

build() {
    # https://github.com/microsoft/playwright/issues/2621#issuecomment-931530175
    cd "${srcdir}"

    cd linkwarden-$pkgver
    sed -i 's|playwright install --with-deps chromium|:|' apps/web/package.json
    yarn
    yarn prisma:generate
    yarn web:build
}

package() {

mkdir -p $pkgdir/usr/share/webapps/linkwarden
install -Dm 644 ${srcdir}/app.conf $pkgdir/etc/linkwarden/app.conf
install -Dm 744 ${srcdir}/dbinit.sh $pkgdir/usr/share/webapps/linkwarden
cp -Ra $srcdir/linkwarden-$pkgver/* $pkgdir/usr/share/webapps/linkwarden
cp -Ra $srcdir/linkwarden-$pkgver/* $pkgdir/usr/share/webapps/linkwarden
install -Dm 644 ${srcdir}/linkwarden.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
install -Dm 644 ${srcdir}/linkwarden.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
install=linkwarden.install
install -Dm 644 ${srcdir}/linkwarden.service -t "$pkgdir"/usr/lib/systemd/system/
}
