# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='v1.2.4'
_upstreamver_regex='^v[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-tags'
_repo='AstroDogeDX/CVRX'

pkgname='cvrx'
_pkgname='CVRX'
pkgver="$(echo "${_upstreamver}" | tr -d v)"
pkgrel=1
pkgdesc="A standalone companion app for ChilloutVR that expands the user experience!"
url="https://github.com/${_repo}"
depends=(
    'alsa-lib'
    'gtk3'
    'libnotify'
    'libxss'
    'libxtst'
    'nss'
    'xdg-utils'
)
makedepends=(
    'nodejs'
    'npm'
    'unzip'
)
license=('MIT')
arch=('x86_64')
source=("${url}/archive/refs/tags/${_upstreamver}.tar.gz" "only-linux.patch" "cvrx.desktop")
sha256sums=('bf15e104e2f70a82e505e970e61bdbaeb219662d1d2cb5d519c021fcc46cf788'
            'a50972522ddc85fa4d86c639939547b008c84ca294cc7a16244249f2a2036528'
            'cbf5f1c452810bd4c2f88de6785ff0cacc4030edb91fe33e08fa30086ea682dd')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    patch < ../only-linux.patch
    npm install
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    npm run make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    cd out/make/zip/linux/x64
    unzip "./${_pkgname}-linux-x64-${pkgver}.zip" -d "${pkgdir}/opt"
    chmod 755 "${pkgdir}/opt/${_pkgname}-linux-x64"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}-linux-x64/cvrx" "${pkgdir}/usr/bin/cvrx"

    # Desktop entry and icon
    install -Dm644 "${srcdir}/cvrx.desktop" "${pkgdir}/usr/share/applications/cvrx.desktop"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/icon/cvrx-logo.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cvrx.png"
}
