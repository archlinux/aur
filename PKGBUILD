# Maintainer: ftk

_pkgname='aquilum'
pkgname="${_pkgname}-bin"
pkgver=0.3.28
pkgrel=1
pkgdesc="Fast local-first Markdown knowledge base with live preview, search, graph, Dataview, book reader, and MCP"
arch=('x86_64')
url="https://github.com/Freaction/Aquilum"
license=('AGPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/Aquilum_${pkgver}_amd64.deb")
sha256sums_x86_64=('623bc50368c8e2de0bf89d701a4235cb0a0fefe72bdf0779374d4aae5243dbb4')
makedepends=('libarchive')
depends=(
    'gst-plugins-base'     # Provides libgstvideo-1.0.so.0
    'gst-plugins-base-libs' # Provides libgstapp-1.0.so.0, libgstallocators-1.0.so.0
    'gstreamer'            # Provides libgstreamer-1.0.so.0, libgstbase-1.0.so.0
    'glib2'                # Provides libgobject-2.0.so.0, libglib-2.0.so.0, libgio-2.0.so.0, libgmodule-2.0.so.0
    'fontconfig'           # Provides libfontconfig.so.1
    'gcc-libs'             # Provides libgcc_s.so.1
    'glibc'                # Provides libm.so.6, libc.so.6, ld-linux-x86-64.so.2
    'orc'                  # Provides liborc-0.4.so.0
    'libunwind'            # Provides libunwind.so.8
    'elfutils'             # Provides libdw.so.1, libelf.so.1
    'libffi'               # Provides libffi.so.8
    'pcre2'                # Provides libpcre2-8.so.0
    'zlib'                 # Provides libz.so.1
    'util-linux-libs'      # Provides libmount.so.1, libblkid.so.1
    'freetype2'            # Provides libfreetype.so.6
    'expat'                # Provides libexpat.so.1
    'libdrm'               # Provides libdrm.so.2
    'xz'                   # Provides liblzma.so.5
    'zstd'                 # Provides libzstd.so.1
    'bzip2'                # Provides libbz2.so.1.0
    'systemd-libs'         # Provides libsystemd.so.0
    'libpng'               # Provides libpng16.so.16
    'brotli'               # Provides libbrotlidec.so.1, libbrotlicommon.so.1
    'xdg-desktop-portal'
    'libxkbcommon'
    'libxkbcommon-x11'
    'libx11'
    'libxcursor'
    'libxrandr'
    'libxi'
    'libxcb'
    'wayland'
)

prepare() {
    mkdir -p "$srcdir/deb-extract"
    bsdtar -xf "$srcdir/Aquilum_${pkgver}_amd64.deb" -C "$srcdir/deb-extract"
    bsdtar -xf "$srcdir/deb-extract"/data.tar.* -C "$srcdir/deb-extract"
}

package() {
    mkdir -p "$pkgdir"
    cp -a "$srcdir/deb-extract/usr" "$pkgdir/"
}

_update_pkg() {
    curl -Ssf "${url}/releases.atom" | sed -nE 's@^.*/releases/tag/v([0-9][0-9\.]*)".*$@\1@gp' | head -n 1
}
# To update package:
# source PKGBUILD && pkgvernew=$(_update_pkg) && [[ $pkgvernew != $pkgver ]] && sed -i "s/^pkgver=.*/pkgver=$pkgvernew/" PKGBUILD && updpkgsums && makepkg && makepkg --printsrcinfo > .SRCINFO && git commit -m "update to ${pkgvernew}" .SRCINFO PKGBUILD
