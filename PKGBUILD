# Maintainer: Conor Anderson <conor@conr.ca>
# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wire-desktop-git
_pkgname=${pkgname%-git}
pkgver=3.6.2885.r28.ge60eae3c
pkgrel=1
pkgdesc='End-to-end encrypted messenger with file sharing, voice calls and video conferences'
arch=('x86_64')
url='https://wire.com/'
license=('GPL3')
provides=('wire-desktop')
conflicts=('wire-desktop')
depends=('electron' 'xdg-utils')
makedepends=('git' 'npm' 'yarn')
optdepends=('emoji-font: colorful emoji')
source=("git+https://github.com/wireapp/wire-desktop.git"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            '53f37e99d4c2f41a3e31fd70154d82ba06a4af578c68df86af4906f7f37ec787')

pkgver() {
    cd "${_pkgname}"
    git describe --tags | sed 's/linux\///g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # Remove "node-addressbook" dependency as it's only for macOS
    sed -i '/node-addressbook/d' "${_pkgname}/electron/package.json"

    # Create launcher script
    cat << EOF > "${_pkgname}-launcher"
#!/usr/bin/env sh

electron "/usr/lib/${_pkgname}" "\$@"
EOF
}

build() {
    cd "${_pkgname}"
    yarn
    yarn build:ts
    # **********
    # ***TODO*** in the next release simply use 'linux-prod-package'
    npx grunt 'clean:linux' 'update-keys' 'gitinfo'  'set-custom-data' 'release-prod' 'bundle'
}

package() {
    # Place files
    install -d "${pkgdir}/usr/lib/${_pkgname}"
    cp -a "${_pkgname}/electron/"* "${pkgdir}/usr/lib/${_pkgname}"

    # Place launcher script
    install -Dm755 "${_pkgname}-launcher" "${pkgdir}/usr/bin/${_pkgname}"

    # Place desktop entry and icon
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${_pkgname}.desktop"
    local res
    for res in 32x32 256x256; do
        install -Dm644 "${_pkgname}/resources/icons/${res}.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${_pkgname}.png"
    done
}

# vim:set ts=4 sw=4 et:
