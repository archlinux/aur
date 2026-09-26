# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for Tuxflix — repackages the official GitHub release tarball.
# Submit by pushing this (plus the generated .SRCINFO) to ssh://aur@aur.archlinux.org/tuxflix-bin.git
#   makepkg --printsrcinfo > .SRCINFO
pkgname=tuxflix-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="Watch and listen to your Plex library: a native desktop Plex client laid out like a game library"
# aarch64 joins when its build can be tested on a clean install as the x64 one is.
arch=('x86_64')
url="https://github.com/codingncaffeine/Tuxflix"
license=('GPL-3.0-or-later')
provides=('tuxflix')
conflicts=('tuxflix')
# mpv brings libmpv, which plays everything; libsecret's secret-tool keeps the sign-in in the
# keyring. The publish is otherwise self-contained (.NET bundled).
depends=('glibc' 'gcc-libs' 'bash' 'systemd'
         'fontconfig' 'libx11' 'libxext' 'libxi' 'libxrandr' 'libxcursor' 'libice' 'libsm'
         'libglvnd' 'wayland' 'libxkbcommon' 'mpv' 'libsecret')
optdepends=('sdl3: game controllers in the TV mode'
            'xdg-desktop-portal: opens the sign-in page from inside the sandbox')
options=('!strip')   # self-contained .NET bundle — stripping breaks it
source_x86_64=("$url/releases/download/v$pkgver/Tuxflix-$pkgver-linux-x64.tar.gz")
# The release's own tarball, hashed when it was built (packaging/build-release.sh prints it).
sha256sums_x86_64=('46d3e2ed68b8152bcac41d8ebe5aaa7c78caa9c030a12507f7209e797fab4ca1')

package() {
    install -dm755 "$pkgdir/usr/lib/tuxflix" "$pkgdir/usr/bin" "$pkgdir/usr/share/doc/tuxflix"
    cp -a "$srcdir"/. "$pkgdir/usr/lib/tuxflix/"

    # makepkg links every source file into srcdir; the copy above would ship that link.
    rm -f "$pkgdir/usr/lib/tuxflix/Tuxflix-$pkgver-linux-"*.tar.gz

    # The tarball carries the desktop files and licences for a reader who unpacks it by hand;
    # here they go where a package puts them.
    DESTDIR="$pkgdir" PREFIX=/usr bash "$srcdir/packaging/install-desktop-files.sh" > /dev/null
    rm -rf "$pkgdir/usr/lib/tuxflix/packaging"
    for f in LICENSE NOTICES.txt; do
        install -Dm644 "$srcdir/$f" "$pkgdir/usr/share/doc/tuxflix/$f"
        rm -f "$pkgdir/usr/lib/tuxflix/$f"
    done
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # The launcher confines the application in a hardened transient systemd user unit; it execs
    # the binary directly where there is no user manager to ask.
    sed 's|@LIB@|/usr/lib/tuxflix|' "$srcdir/packaging/tuxflix-launcher.sh" > "$pkgdir/usr/bin/tuxflix"
    chmod 755 "$pkgdir/usr/bin/tuxflix"
}
