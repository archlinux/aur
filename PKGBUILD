# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for SiegeFX: repackages the official GitHub release tarball.
# Submit by pushing this (plus the generated .SRCINFO) to
#   ssh://aur@aur.archlinux.org/siegefx-bin.git
#   makepkg --printsrcinfo > .SRCINFO
pkgname=siegefx-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Open-source reimplementation of the Dungeon Siege engine, in alpha (needs the original game data)"
arch=('x86_64')
url="https://github.com/codingncaffeine/SiegeFX"
license=('GPL-3.0-only')
provides=('siegefx')
conflicts=('siegefx')
# The tarball is a self-contained .NET publish that runs without ICU (invariant
# globalization). It bundles GLFW, which loads OpenGL and the X11 or Wayland
# libraries of the session, and OpenAL Soft, which this package replaces with
# the system's (PipeWire and PulseAudio backends). OpenSSL backs the
# multiplayer encryption.
depends=('openal' 'libgl' 'libxkbcommon' 'openssl' 'gcc-libs' 'glibc')
optdepends=('xdg-desktop-portal: choosing a screenshots folder in Options')
options=('!strip' '!debug')   # a self-contained .NET bundle: stripping breaks it
source=("$url/releases/download/v$pkgver/SiegeFX-v$pkgver-linux-x64.tar.gz")
sha256sums=('f6f5530c787ca5f937e371b2415803476e285ec00679de4250df84fb64c12eec')

package() {
    local _src="$srcdir/SiegeFX-v$pkgver-linux-x64"
    install -dm755 "$pkgdir/usr/lib/siegefx" "$pkgdir/usr/bin"

    # Copy the whole publish and remove what goes elsewhere. Never narrow this
    # to a list of names: the payload is the apphost, ~190 managed assemblies,
    # the native libraries and the runtime JSON files.
    cp -a "$_src/." "$pkgdir/usr/lib/siegefx/"
    rm -r "$pkgdir/usr/lib/siegefx/share"
    rm "$pkgdir/usr/lib/siegefx/"{README.txt,LICENSE,THIRD-PARTY-NOTICES.txt}
    rm "$pkgdir/usr/lib/siegefx/libopenal.so"   # the system openal (see depends)

    # Guard the copy: nothing in the build or install path notices a missing assembly.
    local _dlls _f
    _dlls=$(find "$pkgdir/usr/lib/siegefx" -maxdepth 1 -name '*.dll' | wc -l)
    if (( _dlls < 150 )); then
        echo "==> ERROR: only $_dlls managed assemblies packaged (expected ~190)." >&2
        return 1
    fi
    for _f in SiegeFX SiegeFX.dll SiegeFX.Core.dll SiegeFX.Audio.dll SiegeFX.runtimeconfig.json \
              SiegeFX.deps.json libcoreclr.so libhostfxr.so libglfw.so.3; do
        if [[ ! -f "$pkgdir/usr/lib/siegefx/$_f" ]]; then
            echo "==> ERROR: $_f is missing from the package payload." >&2
            return 1
        fi
    done

    cat > "$pkgdir/usr/bin/siegefx" <<'EOF'
#!/bin/sh
exec /usr/lib/siegefx/SiegeFX "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/siegefx"

    # The desktop entry and the hicolor icons, laid out in the tarball as here.
    cp -a "$_src/share" "$pkgdir/usr/"
    install -Dm644 "$_src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$_src/README.txt" "$pkgdir/usr/share/doc/$pkgname/README.txt"
    install -Dm644 "$_src/THIRD-PARTY-NOTICES.txt" "$pkgdir/usr/share/doc/$pkgname/THIRD-PARTY-NOTICES.txt"
}
