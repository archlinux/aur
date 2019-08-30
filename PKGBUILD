# Maintainer: Conor Anderson <conor@conr.ca>
# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wire-desktop-git
_pkgname=${pkgname%-git}
pkgver=3.10.3138.r65.gc8ff00f2
pkgrel=1
pkgdesc='End-to-end encrypted messenger with file sharing, voice calls and video conferences'
arch=('x86_64')
url='https://wire.com/'
license=('GPL3')
provides=('wire-desktop')
conflicts=('wire-desktop')
depends=('electron4' 'xdg-utils')
makedepends=('git' 'npm' 'yarn')
optdepends=('emoji-font: colorful emoji')
source=("git+https://github.com/wireapp/wire-desktop.git"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            '53f37e99d4c2f41a3e31fd70154d82ba06a4af578c68df86af4906f7f37ec787')

pkgver() {
    cd "${_pkgname}"
    git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # Create launcher script
    cat << EOF > "${_pkgname}-launcher"
#!/usr/bin/env sh

electron4 "/usr/lib/${_pkgname}" "\$@"
EOF
}

build() {
    cd "${_pkgname}"
    yarn
    BUILD_NUMBER="$(echo ${pkgver} | cut -d. -f3)" LINUX_TARGET=dir yarn build:linux
}

package() {
    # Place files
    install -d "${pkgdir}/usr/lib/${_pkgname}"
    cp -a "${_pkgname}/wrap/dist/linux-unpacked/resources/app/"{electron,node_modules,package.json} "${pkgdir}/usr/lib/${_pkgname}"

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
