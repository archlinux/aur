# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>
# Contributor: Peri Vance <perivance@posteo.net>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=unofficial-homestuck-collection
pkgver=2.8.1
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
sha512sums=('66bfc33c0d0c76e66bd30c07429eabfd2f3207e47198ff08d6279cab30548c2735b163d51cec2b45bc523b46d321d3c86b38f1a2386fc56692162fe641999760'
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
