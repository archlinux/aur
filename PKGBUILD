# Maintainer: ZhangHua <zhanghuadedn at gmail dot com>
# Contributor: Juliette Cordor 

pkgname=("podman-desktop")
pkgver=1.7.0
pkgrel=1
pkgdesc="Manage Podman and other container engines from a single UI and tray."
arch=('x86_64' 'aarch64')
url=https://github.com/containers/podman-desktop
license=('Apache-2.0')
depends=()
makedepends=(
    'yarn' 'node-gyp' 'npm' 'nodejs-lts-hydrogen' 'libvips' 'lcms2'
    'openjpeg2' 'glib2'
)
optdepends=(
    "podman: podman plugin"
    "crc: crc plugin"
    "lima: lima plugin"
    "docker: docker plugin"
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a1e5b1f0fe07dea254bd3e7826e8206c20004f30287398d7794a4b0ebedbef5f')

build(){
    cd "${srcdir}/podman-desktop-$pkgver"
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
    cd "${srcdir}/podman-desktop-$pkgver"
    mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
    cp -r "dist/linux${_arch}unpacked" "${pkgdir}/opt/podman-desktop"
    install -Dm644 ./.flatpak-appdata.xml \
        "${pkgdir}/usr/share/metainfo/io.podman_desktop.PodmanDesktop.xml"
    install -Dm644 ./.flatpak.desktop \
        "${pkgdir}/usr/share/applications/io.podman_desktop.PodmanDesktop.desktop"
    sed -i 's/run.sh/podman-desktop/' \
        "${pkgdir}/usr/share/applications/io.podman_desktop.PodmanDesktop.desktop"
    install -Dm644 ./buildResources/icon.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.podman_desktop.PodmanDesktop.svg"
    install -Dm644 ./buildResources/icon-512x512.png \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/io.podman_desktop.PodmanDesktop.png"
    install -Dm644 ./buildResources/icon.png \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/io.podman_desktop.PodmanDesktop.png"
    ln -s /opt/podman-desktop/podman-desktop "${pkgdir}/usr/bin/podman-desktop"
}
