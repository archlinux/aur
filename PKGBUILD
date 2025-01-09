# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=linkwarden
pkgver=2.9.2
pkgrel=1
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
)
sha512sums_x86_64=(
341dbb53c643ff58cd6e398d3f3a22ef07a635f6f89de182a10b174db6aacacf1bb0a6e41b7c29322bbf5e23dfc3cc1bf2aa52e2913516fa582dde0c19132885
)

build() {
    # https://github.com/microsoft/playwright/issues/2621#issuecomment-931530175
    cd "${srcdir}"

    tar -xvf v$pkgver.tar.gz
    cd linkwarden-$pkgver
    yarn install
    yarn build
}

package() {

mkdir -p $pkgdir/usr/share/webapps/linkwarden
install -Dm 644 ../app.conf $pkgdir/etc/linkwarden/app.conf
install -Dm 744 ../dbinit.sh $pkgdir/usr/share/webapps/linkwarden
cp -Ra $srcdir/linkwarden-$pkgver/* $pkgdir/usr/share/webapps/linkwarden
cp -Ra $srcdir/linkwarden-$pkgver/* $pkgdir/usr/share/webapps/linkwarden
cp -Ra $srcdir/linkwarden-$pkgver/.next $pkgdir/usr/share/webapps/linkwarden/
install -Dm 644 ../linkwarden.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
install -Dm 644 ../linkwarden.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
install=linkwarden.install
install -Dm 644 ../linkwarden.service -t "$pkgdir"/usr/lib/systemd/system/
}
