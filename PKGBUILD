# Maintainer: Michael Behrens <mfbehrens@t-online.de>

# purple-pen-bin -- Purple Pen, a course setting program for orienteering races.
# Installs the official upstream AppImage (4.0.0 beta 2), extracted to the
# conventional /opt layout. The AppImage is a self-contained .NET application,
# so it bundles its own .NET 10 runtime and needs no system `dotnet`.
#
# The installed application uses the canonical upstream name "purplepen"
# (binary, /opt dir, desktop file, icons, MIME type), matching the official
# Linux packages so that switching between the purple-pen, purple-pen-git and
# purple-pen-bin packages is clean.

pkgname=purple-pen-bin
pkgver=4.0.0.beta2
pkgrel=1
pkgdesc="Course setting program for orienteering races (prebuilt AppImage, 4.0.0 beta 2)"
arch=(x86_64)
url="https://purple-pen.org"
license=(BSD)
# Self-contained AppImage: no dotnet runtime dependency. Only the native system
# libraries the bundled .NET runtime and Avalonia load at run time are needed.
depends=(icu libx11 libice libsm fontconfig xdg-utils)
provides=(purplepen="$pkgver")
conflicts=(purplepen)
options=(!strip)
install="$pkgname.install"

_appname="PurplePen"
_prefix="purplepen"
_installdir="/opt/$_prefix"
_appimage="purplepen-4.0.0-beta2.AppImage"
_appurl="https://downloads.purple-pen.org/linux/appimage/x64/PurplePen-4.0.0-beta2-linux-x64.AppImage"

source=("$_appimage::$_appurl")
sha256sums=('9b48cac03b9d77cc9b0bd3f449ed6dd7ce725fd8d29d7c356c52ed1cce2964e6')

prepare() {
    cd "$srcdir"
    # Extract the self-contained AppImage into ./squashfs-root. Its AppDir holds
    # the application payload under opt/, plus the desktop entry, icons,
    # metainfo and MIME definition. --appimage-extract needs no FUSE.
    chmod +x "$_appimage"
    ./"$_appimage" --appimage-extract >/dev/null
}

package() {
    local _root="$srcdir/squashfs-root"

    # --- Self-contained application payload under /opt/$_prefix ---
    install -d "$pkgdir$_installdir"
    cp -a "$_root/opt/$_prefix/." "$pkgdir$_installdir/"
    chmod 0755 "$pkgdir$_installdir/$_appname"

    # /usr/bin/purplepen symlink. .NET's apphost resolves its assemblies via
    # /proc/self/exe, which follows symlinks, so a symlink works with no wrapper.
    install -d "$pkgdir/usr/bin"
    ln -s "$_installdir/$_appname" "$pkgdir/usr/bin/$_prefix"

    # --- Icons (hicolor + legacy pixmaps) ---
    install -d "$pkgdir/usr/share"
    cp -a "$_root/usr/share/icons" "$pkgdir/usr/share/"
    cp -a "$_root/usr/share/pixmaps" "$pkgdir/usr/share/"

    # --- Desktop entry ---
    install -Dm644 "$_root/usr/share/applications/$_prefix.desktop" \
        "$pkgdir/usr/share/applications/$_prefix.desktop"

    # --- AppStream metainfo (AppImage names it *.appdata.xml) ---
    install -Dm644 "$_root/usr/share/metainfo/$_prefix.appdata.xml" \
        "$pkgdir/usr/share/metainfo/org.purple-pen.PurplePen.metainfo.xml"

    # --- MIME type for .ppen course files ---
    install -Dm644 "$_root/usr/share/mime/packages/$_prefix.xml" \
        "$pkgdir/usr/share/mime/packages/$_prefix.xml"

    # --- License / documentation shipped in the AppImage ---
    install -Dm644 "$_root/usr/share/doc/$_prefix/copyright" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
