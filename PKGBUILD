# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for Mailbox — repackages the official GitHub release tarball.
# Submit by pushing this (plus the generated .SRCINFO) to ssh://aur@aur.archlinux.org/mailbox-bin.git
#   makepkg --printsrcinfo > .SRCINFO
pkgname=mailbox-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Desktop mail client with a ribbon, calendar peek and reading pane (POP3, IMAP, SMTP)"
arch=('x86_64' 'aarch64')
url="https://github.com/codingncaffeine/Mailbox"
license=('GPL-3.0-or-later')
provides=('mailbox')
conflicts=('mailbox')
# wpewebkit renders the reading pane (text-only without it); libsecret keeps passwords in the
# keyring through secret-tool; libnotify raises the toasts. The publish is otherwise
# self-contained (.NET bundled).
depends=('glibc' 'gcc-libs' 'bash'
         'fontconfig' 'libx11' 'libxext' 'libxi' 'libxrandr' 'libxcursor' 'libice' 'libsm'
         'libglvnd' 'wayland' 'libxkbcommon' 'mesa' 'glib2' 'libsoup3'
         'wpewebkit' 'libwpe' 'wpebackend-fdo' 'libsecret' 'libnotify')
optdepends=('libldap: look people up in a company or university LDAP directory'
            'hunspell-en_us: spelling, against the desktop dictionaries'
            'ttf-carlito: renders mail set in Calibri at the same metrics'
            'ttf-caladea: renders mail set in Cambria at the same metrics'
            'gtk3: file dialogs where no desktop portal answers'
            'xdg-desktop-portal: file dialogs through the desktop'
            'xorg-xwayland: the send/receive progress window on Wayland, shown without taking the keyboard')
options=('!strip')   # self-contained .NET bundle — stripping breaks it
# One tarball per machine, each a self-contained publish for that architecture. The .NET names
# differ from Arch's — linux-x64 and linux-arm64 against x86_64 and aarch64 — so the release
# asset's name is not the array's suffix and the two cannot be folded into one line.
source_x86_64=("$url/releases/download/v$pkgver/Mailbox-$pkgver-linux-x64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/Mailbox-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('6ef232d66a2e2bc6cdbdf649251cc2fb703943763b47f6190acf1cfcf269b789')
# Filled from the release's own aarch64 tarball, the same step as the line above it. Until an
# aarch64 asset is published there is nothing to hash, and a hash that is merely plausible is
# worse than one makepkg refuses.
sha256sums_aarch64=('SKIP')

package() {
    install -dm755 "$pkgdir/usr/lib/mailbox" "$pkgdir/usr/bin" "$pkgdir/usr/share/doc/mailbox"
    cp -a "$srcdir"/. "$pkgdir/usr/lib/mailbox/"

    # makepkg links every source file into srcdir, and the copy above would ship that link as
    # a dangling symlink in every install. Globbed over the architecture: srcdir holds whichever
    # of the two tarballs this machine's build downloaded.
    rm -f "$pkgdir/usr/lib/mailbox/Mailbox-$pkgver-linux-"*.tar.gz

    # The tarball carries the desktop files and licences for a reader who unpacks it by hand;
    # here they go where a package puts them.
    DESTDIR="$pkgdir" PREFIX=/usr bash "$srcdir/packaging/install-desktop-files.sh" > /dev/null
    rm -rf "$pkgdir/usr/lib/mailbox/packaging" "$pkgdir/usr/lib/mailbox/assets"
    for f in LICENSE NOTICES.txt Selawik-LICENSE.txt; do
        install -Dm644 "$srcdir/$f" "$pkgdir/usr/share/doc/mailbox/$f"
        rm -f "$pkgdir/usr/lib/mailbox/$f"
    done
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # The launcher confines the application in a hardened transient systemd user unit; it
    # execs the binary directly where there is no user manager to ask.
    sed 's|@LIB@|/usr/lib/mailbox|' "$srcdir/packaging/mailbox-launcher.sh" \
        > "$pkgdir/usr/bin/mailbox"
    chmod 755 "$pkgdir/usr/bin/mailbox"
}
