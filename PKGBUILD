# Maintainer: iqzer0 <iqzer0@users.noreply.github.com>
#
# Kumiko built from source. The giD bindings are a pinned source so the build
# itself needs no network. The release build is ../kumiko-bin/PKGBUILD.
# packaging/aur/update.sh sets _ver and the checksum for a release.

pkgname=kumiko
_ver=2.0.0
_gid=0.9.13
pkgver=2.0.0
pkgrel=1
pkgdesc="Tiling terminal emulator for Linux, built on ttyx_ and Tilix"
arch=('x86_64')
url="https://github.com/iqzer0/kumiko"
license=('MPL-2.0')
depends=('glibc' 'gcc-libs' 'gtk3' 'vte3' 'libsecret' 'libx11')
makedepends=('ldc' 'dub' 'gettext' 'desktop-file-utils' 'gtk-update-icon-cache' 'unzip')
optdepends=('gsettings-desktop-schemas: system monospace font, dark-mode preference and proxy settings'
            'dconf: one-time import of ttyx_ settings')
provides=('kumiko')
conflicts=('kumiko-bin')
source=("kumiko-${_ver}.tar.gz::https://github.com/iqzer0/kumiko/archive/refs/tags/v${_ver}.tar.gz"
        "gid-${_gid}.zip::https://code.dlang.org/packages/gid/${_gid}.zip")
sha256sums=('a80df3e7b4f7290d893e18874c6192f5676a1aa5c256cc9539256aa0eb08a724'
            '04b537f0a63938d831121af3c2e848564ec99d321e7e710932636e47e00f99aa')

build() {
    cd "kumiko-${_ver}"
    export DUB_HOME="$srcdir/dub"
    dub add-local "$srcdir/gid-${_gid}" "${_gid}"
    dub build --build=release --compiler=ldc2 --skip-registry=all
}

package() {
    cd "kumiko-${_ver}"
    ./install.sh "$pkgdir/usr"
    # Per-system caches: pacman's hooks rebuild them.
    rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled" \
          "$pkgdir/usr/share/icons/hicolor/icon-theme.cache" \
          "$pkgdir/usr/share/applications/mimeinfo.cache"
}
