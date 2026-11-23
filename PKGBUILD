# Maintainer: czyt <czytcn@gmail.com>
pkgname=noop-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="Desktop client for Noop: your own team of Claude Code and Codex agents runs on your own machines and only asks when it really needs you"
arch=('x86_64')
url="https://huacnlee.github.io/noop/"
license=('MIT')
# The program links against GTK 4 and the base of GStreamer (libgstapp,
# libgstaudio); the plug-ins that play the videos are optional.
depends=('cairo' 'dbus' 'fontconfig' 'gdk-pixbuf2' 'gcc-libs' 'glib2' 'glibc'
         'graphene' 'gst-plugins-base-libs' 'gstreamer' 'gtk4' 'harfbuzz'
         'libglvnd' 'libx11' 'libxcb' 'libxkbcommon' 'pango'
         'vulkan-icd-loader' 'wayland')
optdepends=('gst-plugins-good: play MP4 videos and open videos from the hub'
            'gst-libav: play H.264 videos')
options=('!strip' '!debug')

# The release carries the program for Linux and a list of checksums.
_tarball="noop-${pkgver}-linux-x86_64.tar.gz"

source=("LICENSE-${pkgver}::https://github.com/huacnlee/noop/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_tarball}::https://github.com/huacnlee/noop/releases/download/v${pkgver}/${_tarball}")
sha256sums=('a7bb7bac82b24d5ad7c89d01121ff8a144bf147e043624811458266d4ed423bc')
sha256sums_x86_64=('4224757935e1c3f137195f65e630c0bf03e49198f78e240a8030c204b4fee4e3')

package() {
    # The program looks for its data next to itself, so the whole directory
    # of the release is installed unchanged.
    install -d "${pkgdir}/usr/lib/noop-client"
    cp -a "${srcdir}/Noop/." "${pkgdir}/usr/lib/noop-client/"

    # The desktop entry of the release points into the directory of the
    # program, which is not where the program is installed.
    install -Dm644 "${pkgdir}/usr/lib/noop-client/dev.noop.app.desktop" \
        "${pkgdir}/usr/share/applications/dev.noop.app.desktop"
    sed -i 's|^Exec=.*|Exec=noop-client|' \
        "${pkgdir}/usr/share/applications/dev.noop.app.desktop"

    install -Dm644 "${pkgdir}/usr/lib/noop-client/dev.noop.app.png" \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/dev.noop.app.png"

    # The name of the command follows the installer of the upstream project.
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/lib/noop-client/Noop "${pkgdir}/usr/bin/noop-client"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
