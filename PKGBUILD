# Maintainer: ndiuky <anod100002@gmail.com>

pkgname=argon-chat-bin
# Read the release version dynamically; no pinned version in this file.
pkgver=$(bash "${startdir:-.}/argon-fetch.sh" --version) || return 1
pkgrel=1
pkgdesc='Argon voice, video and text chat (official AppImage)'
arch=('x86_64')
url='https://argon.gl'
license=('custom')
depends=(
    'alsa-lib' 'fontconfig' 'gcc-libs' 'glibc' 'libglvnd' 'libx11'
    'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'openssl' 'wayland'
)
makedepends=('curl' 'jq')
provides=('argon-chat')
conflicts=('argon-chat')
options=('!strip' '!debug')
source=('argon-fetch.sh')
sha256sums=('SKIP')

prepare() {
    bash "$srcdir/argon-fetch.sh" "$srcdir" "$pkgver" || return 1

    cd "$srcdir"
    chmod +x ArgonChat-x86_64.AppImage
    rm -rf squashfs-root
    ./ArgonChat-x86_64.AppImage --appimage-extract
}

package() {
    [[ $(cat "$srcdir/argon-version") == "$pkgver" ]] || {
        printf 'Release changed during the build; restart makepkg.\n' >&2
        return 1
    }
    install -dm755 "$pkgdir/opt/argon" "$pkgdir/usr/bin"
    cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/argon/"
    ln -s /opt/argon/AppRun "$pkgdir/usr/bin/Argon"
    ln -s Argon "$pkgdir/usr/bin/argon"

    # Preserve upstream protocol handling and icons for desktop integration.
    install -Dm644 "$srcdir/squashfs-root/gl.argon.client.desktop" \
        "$pkgdir/usr/share/applications/gl.argon.client.desktop"
    cp -a "$srcdir/squashfs-root/usr/share/icons" "$pkgdir/usr/share/"
}
