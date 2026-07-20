# Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
pkgname=ente-duckling-bin
_pkgname=duckling
pkgver=0.2.1
pkgrel=1
pkgdesc='Headless ente client — runs ente desktop'\''s audited upload/auth/crypto code as a single binary, no Electron'
arch=('x86_64' 'aarch64')
url='https://github.com/dustindoan/duckling'
license=('AGPL-3.0-only')
depends=('glibc')
optdepends=('ffmpeg: video thumbnails and metadata extraction during upload')
# Upstream name "duckling" collides on the AUR with an unrelated project
# (l1xnan's DB viewer), so the package is named ente-duckling-bin. The binary
# and command stay "duckling" (upstream UX); provides/conflicts track the
# would-be source package ente-duckling, not the ambiguous bare "duckling".
provides=("ente-duckling=$pkgver")
conflicts=("ente-duckling")
# Prebuilt bun --compile binary: the JS bundle is appended to the ELF, so
# stripping would corrupt it. No debug info to package either.
options=('!strip' '!debug')
install="$pkgname.install"
source=("$_pkgname-$pkgver.LICENSE::https://raw.githubusercontent.com/dustindoan/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-linux-x64.zip::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x64.zip")
source_aarch64=("$_pkgname-$pkgver-linux-arm64.zip::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-arm64.zip")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('69774b53dc1272e047aa5bfcc28c17724ee96042f62cba33ad5afa60301e14eb')
sha256sums_aarch64=('54ad3b08e4af5257a205da19b13279efebabbc69b37c85a325e005c027a97b74')

package() {
    local _bin
    case "$CARCH" in
        x86_64)  _bin="$_pkgname-linux-x64" ;;
        aarch64) _bin="$_pkgname-linux-arm64" ;;
    esac

    # Real upstream binary in a private libdir. /usr/bin/duckling is the wrapper
    # below. DUCKLING_FFMPEG_PATH's "sibling of binary, then PATH" lookup still
    # resolves /usr/bin/ffmpeg through the PATH fallback.
    install -Dm755 "$_bin" "$pkgdir/usr/lib/$pkgname/duckling"

    # Upstream duckling has no config file — it reads its DUCKLING_* settings
    # only from the environment. This wrapper sources an XDG config file so
    # settings like DUCKLING_ENDPOINT can be set persistently, and defaults
    # session/token storage to the XDG state dir (XDG_STATE_HOME) instead of
    # ~/.duckling. The binary creates the state dir itself, recursively, 0700.
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$_pkgname" <<'WRAPPER'
#!/bin/sh
# Persistent settings: a POSIX shell fragment sourced on every run, e.g.
#     export DUCKLING_ENDPOINT=https://your-museum.example.org
_cfg="${XDG_CONFIG_HOME:-$HOME/.config}/duckling/env"
[ -r "$_cfg" ] && . "$_cfg"

# Session/token storage. Honour an explicit DUCKLING_STATE_DIR (from the env or
# the config file above); else keep a pre-existing ~/.duckling so old logins
# survive; else default to the XDG state dir.
if [ -z "${DUCKLING_STATE_DIR:-}" ]; then
    if [ -d "$HOME/.duckling" ]; then
        DUCKLING_STATE_DIR="$HOME/.duckling"
    else
        DUCKLING_STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/duckling"
    fi
    export DUCKLING_STATE_DIR
fi

exec /usr/lib/ente-duckling-bin/duckling "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$_pkgname-$pkgver.LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Template for the config file the wrapper sources.
    install -d "$pkgdir/usr/share/doc/$pkgname"
    cat > "$pkgdir/usr/share/doc/$pkgname/env.example" <<'ENVEXAMPLE'
# duckling settings — a POSIX shell fragment sourced by /usr/bin/duckling.
# Copy to "${XDG_CONFIG_HOME:-$HOME/.config}/duckling/env" and edit.

# Museum API endpoint (default https://api.ente.io):
#export DUCKLING_ENDPOINT=https://your-museum.example.org

# Session/token storage (default ~/.local/state/duckling, or a pre-existing
# ~/.duckling):
#export DUCKLING_STATE_DIR="$HOME/.local/state/duckling"

# ffmpeg binary for video thumbnails/metadata (default: found on PATH):
#export DUCKLING_FFMPEG_PATH=/usr/bin/ffmpeg
ENVEXAMPLE
}

# vim: ts=4 sw=4 et:
