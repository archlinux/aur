# Maintainer: ZhangHua <zhanghuadedn at gmail dot com>
# Contributor: Juliette Cordor 

pkgname=("podman-desktop")
pkgver=0.14.1
pkgrel=1
pkgdesc="Manage Podman and other container engines from a single UI and tray."
arch=('x86_64' 'aarch64')
url=https://github.com/containers/podman-desktop
license=('Apache-2.0')
depends=()
makedepends=('yarn' 'git' 'python' 'npm' 'nodejs-lts-gallium')
optdepends=(
    "podman: podman plugin"
    "crc: crc plugin"
    "lima: lima plugin"
    "docker: docker plugin"
)
source=(
    "git+${url}#tag=v${pkgver}"
    "podman-desktop.desktop"
    )
sha256sums=('SKIP'
            'f520d11b747dc29bcc63dd7d75f235e446104f924142be4ecc6f26b23e3a7c1c')

build(){
    cd "${srcdir}/podman-desktop"
    yarn --frozen-lockfile --network-timeout 180000
    yarn run compile
}
package_podman-desktop(){
    depends+=(
        # Electron depends
        "c-ares" "gtk3" "libevent" "nss" "wayland" "fontconfig" "woff2" "aom" "brotli"
        "libjpeg" "icu" "dav1d" "flac" "snappy" "libxml2" "ffmpeg" "libwebp" "minizip"
        "opus" "harfbuzz" "re2" "libavif" "jsoncpp" "libxslt" "libpng" "freetype2"
    )
    optdepends+=(
        # Electron optdepends
        "kde-cli-tools: file deletion support (kioclient5)"
        "libappindicator-gtk3: StatusNotifierItem support"
        "pipewire: WebRTC desktop sharing under Wayland"
        "qt5-base: enable Qt5 with --enable-features=AllowQt"
        "trash-cli: file deletion support (trash-put)"
        "xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)"
    )
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
