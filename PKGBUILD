# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>
# Contributor: Peri Vance <perivance@posteo.net>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=unofficial-homestuck-collection
pkgver=2.8.0
pkgrel=1
pkgdesc="The Unofficial Homestuck Collection"
arch=('x86_64')
url='https://homestuck.giovanh.com/unofficial-homestuck-collection/'
license=('GPL-3.0-or-later' 'LicenseRef-chrome' 'LicenseRef-electron')
makedepends=('nodejs-lts-jod' 'gendesk' 'yarn' 'electron' 'python' 'python-setuptools' 'git')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libdrm'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxcrypt-compat'
    'libxcursor'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxi'
    'libxrandr'
    'libxrender'
    'libxss'
    'libxtst'
    'mesa'
    'nspr'
    'nss'
    'pango'
)
source=("git+https://github.com/GiovanH/${pkgname}.git#tag=v${pkgver}"
        node-engines.patch)
sha512sums=('8b450f21bfa6f57269336c17047633dc5c951266e882c159d4730d138ae3a5a8941400c8c2e14ece5cefe9875d873d6a6cb073097238145c089f2364c9598b56'
            'd93caf075f89184fb88e39e5faa7aa136817737e90da063ed98a15b668efacbb5b25415933a49669d76bee27eb1f871225c59333828a398ed4044b05bee0758d')

prepare() {
    patch -d "$pkgname" -p1 < node-engines.patch

    gendesk -f \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --name="Unofficial Homestuck Collection" \
        --categories "Game" \
        --exec="/usr/bin/unofficial-homestuck-collection"
}

build() {
    cd "${pkgname}"
    yarn install
    SHARP_IGNORE_GLOBAL_LIBVIPS=true make build
}

package() {
    mkdir -p "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/${pkgname}/dist_electron/linux-unpacked/" \
        "${pkgdir}/usr/lib/${pkgname}/"

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/usr/lib/${pkgname}/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    ln -s "/usr/lib/${pkgname}/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"

    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "/usr/lib/${pkgname}/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"

    local size
    for size in 16 24 32 48 64 128 256 512 1024; do
       install -Dm644 "$srcdir/${pkgname}/build/icons/${size}x${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done

    mkdir -p "${pkgdir}/usr/share/applications/"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
