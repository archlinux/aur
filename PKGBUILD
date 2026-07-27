# Maintainer: David Raznick <david.raznick@globalenergymonitor.org>
#
# Prebuilt-binary package, repackaging the GitHub release artifacts.
# After each release: bump pkgver, reset pkgrel, run `updpkgsums`.
#
# This is the window version. The command-line `sqlnow` is packaged separately
# as sqlnow-bin: the two are the same server and the same session store, so
# either can open a session the other left, and both can be installed at once.
#
# The app is an Electron shell around that same server, released as an
# AppImage. It is unpacked here rather than installed whole, so it needs no
# FUSE at runtime and its desktop entry and icons go where the rest of the
# system looks for them.
pkgname=sqlnow-desktop-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="Local SQL viewer for files and databases, in a native window"
arch=('x86_64' 'aarch64')
url="https://github.com/kindly/sqlnow"
# taken as it was released: stripping would rewrite a file whose checksum was
# just verified, and Electron ships no split debug symbols worth keeping
options=('!strip' '!debug')
license=('MIT')
# what Electron needs; the server bundled inside carries DuckDB and the UI
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libnotify' 'gcc-libs' 'glibc')
optdepends=('sqlnow-bin: the command-line version, sharing the same sessions')
provides=('sqlnow-desktop')
conflicts=('sqlnow-desktop')
source_x86_64=("$pkgname-$pkgver-x86_64.AppImage::$url/releases/download/v$pkgver/sqlnow-desktop-linux-x86_64.AppImage")
source_aarch64=("$pkgname-$pkgver-aarch64.AppImage::$url/releases/download/v$pkgver/sqlnow-desktop-linux-arm64.AppImage")
sha256sums_x86_64=('8053b0341c0cb38e9a829b4ae9c55984639d7caa1d1c62ede45b28621f9c321a')
sha256sums_aarch64=('b572559b7f6971413ae8dc53ba82297f59b3863de5ff98f5009c1eabd6b066c7')

_image="$pkgname-$pkgver-$CARCH.AppImage"

prepare() {
    chmod +x "$srcdir/$_image"
    "$srcdir/$_image" --appimage-extract > /dev/null
}

package() {
    cd "$srcdir/squashfs-root"

    install -d "$pkgdir/usr/lib/$pkgname"
    cp -a --no-preserve=ownership . "$pkgdir/usr/lib/$pkgname/"

    # --appimage-extract unpacks with 0700 directories, and cp -a copies that
    # faithfully: installed as root, nothing else can even traverse them. Reset
    # to what a package should carry — readable dirs, readable files, execute
    # kept where it already was.
    chmod -R u=rwX,go=rX "$pkgdir/usr/lib/$pkgname"
    chown -R root:root "$pkgdir/usr/lib/$pkgname"
    # the AppImage's own launcher and top-level metadata are replaced below
    rm -f "$pkgdir/usr/lib/$pkgname/AppRun" \
          "$pkgdir/usr/lib/$pkgname/.DirIcon" \
          "$pkgdir/usr/lib/$pkgname/sqlnow-desktop.desktop" \
          "$pkgdir/usr/lib/$pkgname/sqlnow-desktop.png"
    rm -rf "$pkgdir/usr/lib/$pkgname/usr"

    # Applied after the chmod above, which would clear the setuid bit.
    # Chromium uses its namespace sandbox where unprivileged user namespaces are
    # allowed, which is the case on Arch, and falls back to this helper where
    # they are not. Setuid root is what makes that fallback work, and is what
    # every Electron package here does.
    chmod 4755 "$pkgdir/usr/lib/$pkgname/chrome-sandbox"

    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/$pkgname/sqlnow-desktop" "$pkgdir/usr/bin/sqlnow-desktop"

    # our own entry rather than the AppImage's, which runs AppRun --no-sandbox
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/sqlnow-desktop.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=sqlnow
GenericName=SQL viewer
Comment=Local SQL viewer for files and databases
Exec=sqlnow-desktop %U
Icon=sqlnow-desktop
Terminal=false
StartupNotify=true
StartupWMClass=sqlnow
Categories=Development;Database;
Keywords=SQL;DuckDB;CSV;Parquet;query;
MimeType=text/csv;application/vnd.apache.parquet;application/x-sqlite3;
DESKTOP

    for size in 32x32 128x128; do
        install -Dm644 "usr/share/icons/hicolor/$size/apps/sqlnow-desktop.png" \
            "$pkgdir/usr/share/icons/hicolor/$size/apps/sqlnow-desktop.png"
    done

    install -Dm644 resources/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 resources/README.md "$pkgdir/usr/share/doc/sqlnow-desktop/README.md"
    install -Dm644 resources/AGENTS.md "$pkgdir/usr/share/doc/sqlnow-desktop/AGENTS.md"
}
