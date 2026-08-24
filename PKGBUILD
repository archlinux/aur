# Maintainer: simplyyjessie <simplyyjessie@pm.me>
#
# Release checklist (per tag):
#   1. bump pkgver to the tag (without the leading v), reset pkgrel=1
#   2. updpkgsums
#   3. makepkg --printsrcinfo > .SRCINFO
#   4. push PKGBUILD + .SRCINFO to ssh://aur@aur.archlinux.org/autoroute.git

pkgname=autoroute
pkgver=0.4.0
pkgrel=1
pkgdesc="Persistent PipeWire routing manager — routing rules that survive app relaunches"
arch=('x86_64')
# The GitHub mirror is the AUR source: git.bussy.cloud is a self-hosted Gitea behind
# Cloudflare, so it is not a dependable fetch target for everyone building this package.
url="https://github.com/SimplyJustJessie/AutoRoute"
license=('MIT')
# pipewire: pw-dump / pw-link / pw-mon — how AutoRoute reads and edits the graph.
# libpulse: pactl — loads/unloads the null sinks behind app-managed virtual sinks.
# fontconfig: Avalonia's text stack resolves fonts through it at startup.
depends=('pipewire' 'wireplumber' 'libpulse' 'dotnet-runtime-10.0' 'fontconfig'
         'hicolor-icon-theme')
makedepends=('dotnet-sdk-10.0')
# GitHub archives extract to <repo>-<pkgver>, e.g. AutoRoute-0.4.0 (not $pkgname).
_srcdir="AutoRoute-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e5aca89b6577b0e28c343d88c1a22d6c0232d49db0aacd510c2fcaac19d26b8')
options=('!strip') # .NET assemblies must not be stripped

build() {
    cd "$_srcdir"
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
    # Framework-dependent on purpose: the runtime comes from dotnet-runtime-10.0 rather than
    # being vendored, so security updates to .NET reach this package through pacman. (The
    # AppImage is the self-contained build; see scripts/build-appimage.sh.)
    # Version is baked in so the app reports the packaged version; the in-app self-updater
    # stays inert either way — it is gated on $APPIMAGE, which pacman installs never set.
    # DebugType=none: a Release build otherwise ships .pdb files AND stamps their absolute build
    # path into each assembly, which drags $srcdir into the package (makepkg flags it, and it
    # breaks reproducibility). Exception method names survive without PDBs; only line numbers go.
    # -r linux-x64 (with --no-self-contained) keeps the publish framework-dependent while pinning
    # it to this arch: without a RID, Avalonia's Skia/HarfBuzz natives ship for every RID it
    # supports — arm, riscv64, musl, osx, win — none of which are usable in an x86_64 package.
    dotnet publish src/AutoRoute.App -c Release -r linux-x64 --no-self-contained \
        -p:Version="$pkgver" -p:InformationalVersion="$pkgver" \
        -p:DebugType=none -p:DebugSymbols=false \
        -o "$srcdir/publish"
}

package() {
    cd "$_srcdir"
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -a "$srcdir/publish/." "$pkgdir/usr/lib/$pkgname/"
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/lib/$pkgname/AutoRoute.App" "$pkgdir/usr/bin/autoroute"
    install -Dm644 packaging/autoroute.desktop "$pkgdir/usr/share/applications/autoroute.desktop"
    install -Dm644 packaging/autoroute.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/autoroute.png"
    # The in-repo unit targets the manual install (a binary or AppImage symlink under
    # ~/.local/bin) and carries AppImage caveats that cannot apply here; repoint it at the
    # packaged binary instead of vendoring a second copy of the hardening block.
    sed -e 's|^ExecStart=.*|ExecStart=/usr/bin/autoroute --background|' \
        -e '/^# %h\/\.local\/bin\/AutoRoute must exist/,+1d' \
        -e '/^# !!! AppImage users:/,+3d' \
        dist/systemd/autoroute.service > "$srcdir/autoroute.service"
    grep -q '^ExecStart=/usr/bin/autoroute --background$' "$srcdir/autoroute.service"
    install -Dm644 "$srcdir/autoroute.service" \
        "$pkgdir/usr/lib/systemd/user/autoroute.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
