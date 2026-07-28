# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>

pkgname=magnolia-qda
_name=Magnolia
pkgver=1.6.2
_electron=electron39 # this is not what is used by upstream, but rather the nearest one in extra repo
pkgrel=1
pkgdesc="Free and open-source qualitative data analysis software."
arch=('x86_64')
url="https://github.com/caledavis/$_name"
license=('EUPL-1.2')
options=(!debug !strip) # save time
depends=(
    at-spi2-core
    "$_electron"
    glibc
    gtk3
    libgcc
	libnotify
    libsecret
    libxss
    libxtst
    nss
    nodejs
    util-linux-libs
    xdg-utils
)
makedepends=(
    asar
    npm
)
source=(
  "${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
  "${pkgname}.desktop"
)
sha256sums=('2d82e2656b9148cbbe1e076e0b39646a7bab3bdce2b1e9c9552c72fa863db054'
            'ae872917b09c435709d674cf1b66deff859cad2b8401240acdc1af2218917137')
build() {
    cd "${srcdir}/${_name}-$pkgver"
    npm install
    npm run build
    ./node_modules/.bin/electron-builder \
      --linux \
      --x64 \
      --dir \
      --config.electronDist=/usr/lib/"$_electron"
}

package() {
    cd "${srcdir}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
    cd "${srcdir}/${_name}-$pkgver"
    install -Dm644 "LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "./magnoliaicon.png" \
            "${pkgdir}/usr/share/icons/${pkgname}/${pkgname}.png"
    install -dm755 "${pkgdir}/var/log/$pkgname"
    install -d "${pkgdir}/usr/lib/${pkgname}/"
    asar e "./dist/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm755 /dev/null "${pkgdir}/usr/bin/$pkgname"
    cat >>"${pkgdir}/usr/bin/$pkgname" <<EOD
#! /usr/bin/sh
exec $_electron /usr/lib/$pkgname "\$@"
EOD

}
