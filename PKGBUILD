# Maintainer: William Gathoye <william at gathoye dot be>
# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Jan Was <janek dot jan at gmail dot com>
# Contributor: Bruno Pagani <archange at archlinux dot org>

pkgname=mattermost-desktop
pkgver=4.2.3
pkgrel=2
pkgdesc="Mattermost Desktop application for Linux (Beta)"
arch=('i686' 'x86_64')
url="https://github.com/mattermost/desktop"
license=('Apache')
depends=('electron4')
makedepends=('npm' 'git')
source=(
    "${pkgname}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz"
    "${pkgname}.sh"
    "${pkgname%%-*}-package-json.patch"
)
sha512sums=(
    '478124a2cf9fff618035d408a73176fd68c21d16fdbecc307c621bf576d9bbdd2663a52a1dd4be6e3a0ea52029270d3f1d92c2180f0158b3c29d4116630c6f37'
    'ec10960a56593429996f153d0832345d1f9279aa386d5d09f078aed39a5e8e4c3d1900fc8ff608318c9c57a161c3850b2c7924d86af0ae41f76649c080fccc1f'
    'c5e6f14152eb325eab4cf43355f586a82975210a48599cb5b555eb56a4d25d3d66f669a95056baac43cb0372208ac954aa726d901411c9f16b8884c3a19777ed'
)

prepare() {
    cd "desktop-${pkgver}"

    # Bump dependencies. Temporary patch. Remove when 4.3 is out.
    patch < "${srcdir}"/mattermost-package-json.patch

    # Depending on the architecture, in order to accelerate the build process,
    # removes the compilation of ia32 or x64 build.
    if [[ "$CARCH" == x86_64 ]];then
        sed -i 's/--ia32//g' package.json
    else
        sed -i 's/--x64//g' package.json
    fi

    # Reduce build time by removing the creation of a .deb for Debian and
    # AppImage
    sed -i -e '/"deb",/d' electron-builder.json
    sed -i -e '/"appimage"/d' electron-builder.json

    # No need to compress the package. Pay attention at the trailing comma: we
    # are removing it from the JSON to makeit valid again.
    sed -i 's/"tar.gz",/"dir"/' electron-builder.json
}

build() {
    cd "desktop-${pkgver}"
    npm install --cache "${srcdir}/npm-cache"
    npm run build --cache "${srcdir}/npm-cache"
}

package() {
    cd "desktop-${pkgver}"
    npm run package:linux --cache "${srcdir}/npm-cache"

    install -d "${pkgdir}/usr/lib"
    # The star in the unpackaged is needed for i686 or ARM platforms.
    cp -r release/linux*unpacked/resources "${pkgdir}/usr/lib/${pkgname}"

    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 resources/linux/icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

    cd "${srcdir}"
    install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 ${pkgname/-/.} -t "${pkgdir}/usr/share/applications/"
}

