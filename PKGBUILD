# Maintainer: Conor Anderson <conor@conr.ca>
# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wire-desktop-git
_name=${pkgname%-git}
pkgver=3.6.2885.r21.gf880ee4a
pkgrel=1
pkgdesc='End-to-end encrypted messenger with file sharing, voice calls and video conferences'
arch=('x86_64')
url='https://wire.com/'
license=('GPL3')
provides=('wire-desktop')
conflicts=('wire-desktop')
depends=('electron' 'xdg-utils')
makedepends=('cargo' 'npm' 'python2' 'git' 'yarn')
optdepends=('emoji-font: colorful emoji')
source=("git+https://github.com/wireapp/wire-desktop.git"
        "${_name}.desktop")
sha256sums=('SKIP'
            'cc9056cecff2aa49a9ce9c8376d57ec8c7c2cb8174f7966b5cdccbeb2e3751ea')

pkgver() {
    cd "${_name}"
    git describe --tags | sed 's/linux\///g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # Remove "node-addressbook" dependency as it's only for macOS
    sed -i '/node-addressbook/d' "${_name}/electron/package.json"

    # Create launcher script
    cat << EOF > "${_name}-launcher"
#!/bin/sh

electron "/usr/lib/${_name}" "\$@"
EOF
}

build() {
    cd "${_name}"
    yarn
    yarn build:ts
    npx grunt 'clean:linux' 'update-keys' 'gitinfo' 'release-prod' 'bundle'
}

package() {
    # Place files
    install -d "${pkgdir}/usr/lib/${_name}"
    cp -a "${_name}/electron"/* "${pkgdir}/usr/lib/${_name}"

    # Place launcher script
    install -Dm755 "${_name}-launcher" "${pkgdir}/usr/bin/${_name}"

    # Place desktop entry and icon
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${_name}.desktop"
    local res
    for res in 32x32 256x256; do
        install -Dm644 "${_name}/resources/icons/${res}.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${_name}.png"
    done
}
