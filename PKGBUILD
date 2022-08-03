# Maintainer: ZhangHua <zhanghuadedn at gmail dot com>
# Contributor: Juliette Cordor 

pkgname=("podman-desktop")
pkgver=0.0.5
pkgrel=1
pkgdesc="Manage Podman and other container engines from a single UI and tray."
arch=('x86_64' 'aarch64')
url=https://github.com/containers/podman-desktop
license=('Apache-2.0')
makedepends=('yarn' 'git' 'python' 'npm')
optdepends=(
    "podman: podman plugin"
    "crc: crc plugin"
    "lima: lima plugin"
    "docker: docker plugin"
)
source=(
    "git+${url}#tag=v${pkgver}"
    podman-desktop.desktop
    )
sha256sums=('SKIP'
            'f520d11b747dc29bcc63dd7d75f235e446104f924142be4ecc6f26b23e3a7c1c')

build(){
    cd "${srcdir}/podman-desktop"
    yarn --frozen-lockfile
    yarn run build
    yarn run electron-builder --dir --config .electron-builder.config.js
}
package_podman-desktop(){
    case ${CARCH} in
        x86_64)
            _arch=-
            ;;
        aarch64)
            _arch=-arm64-
            ;;
        *)
            _arch=-${CARCH}-
            ;;
    esac
    cd "${srcdir}/podman-desktop"
    mkdir -p "${pkgdir}/opt/podman-desktop"
    mkdir -p "${pkgdir}/usr/bin"
    cp -a dist/linux${_arch}unpacked/* "${pkgdir}/opt/podman-desktop"
    install -Dm644 "${srcdir}/podman-desktop.desktop" \
        "${pkgdir}/usr/share/applications/podman-desktop.desktop"
    install -Dm644 "${srcdir}/podman-desktop/buildResources/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/podman-desktop.svg"
    ln -s /opt/podman-desktop/podman-desktop "${pkgdir}/usr/bin/podman-desktop"
}
