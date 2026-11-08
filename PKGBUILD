# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=comfy-desktop-bin
pkgver=1.1.9
pkgrel=1
pkgdesc='Official desktop application for ComfyUI — install, run, and manage ComfyUI with GPU-ready environments'
arch=('x86_64' 'aarch64')
url='https://www.comfy.org/'
license=('MIT')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gtk3'
    'libcups'
    'libdrm'
    'libnotify'
    'libsecret'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'libxss'
    'libxtst'
    'mesa'
    'nss'
    'pango'
    'systemd-libs'
    'xdg-utils'
)
optdepends=('git: fallback for git operations if bundled pygit2 fails')
makedepends=('patchelf')
provides=('comfy-desktop')
conflicts=('comfy-desktop' 'comfyui-desktop-2-beta')
replaces=('comfyui-desktop-2-beta')
options=('!strip' '!debug')

_dl_base='https://dl.todesktop.com/241130tqe9q3y'
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/Comfy-Org/Comfy-Desktop/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_dl_base}/versions/${pkgver}/linux/deb/x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${_dl_base}/versions/${pkgver}/linux/deb/arm64")
sha256sums=('0cea5d109b4d245ea1110c205df0f825a1088c9e45e257514c1661c7c14f7bc3')
sha256sums_x86_64=('186495cc3ec5b7cc5f54c4335f5b78c5d386fa7fe3d6c31c9cfcbf8ddea5b19e')
sha256sums_aarch64=('6a03d1aaf28777f5ef507316b37b7e2e3fe6a424a9b9e578f1baf0931a86cbec')

latestver() {
    # electron-builder update feed — the authoritative published Linux version.
    # Small YAML, instant response, no large download.
    curl -sL "https://download.todesktop.com/241130tqe9q3y/latest-linux.yml" |
        sed -nE 's/^version: *//p'
}

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"

    # Prune non-target 7zip binaries
    local _7z="$pkgdir/opt/Comfy Desktop/resources/app.asar.unpacked/node_modules/7zip-bin"
    rm -rf "$_7z/mac"
    case "$CARCH" in
        x86_64)  find "$_7z/linux" -mindepth 1 -maxdepth 1 -type d ! -name x64 -exec rm -rf {} + ;;
        aarch64) find "$_7z/linux" -mindepth 1 -maxdepth 1 -type d ! -name arm64 -exec rm -rf {} + ;;
    esac

    # Remove deb-specific changelog
    rm -rf "$pkgdir/usr/share/doc"

    # The bundled CPython/Tcl is built in a container whose dependency prefix
    # leaks in as an absolute rpath (/tools/deps/lib) on libtcl9.0.so and
    # libtcl9tk9.0.so. It resolves nowhere on a user system, and every library
    # in this tree ships beside its siblings, so $ORIGIN is the correct
    # relocatable value for an entry that is not already $ORIGIN-relative.
    local _pylib="$pkgdir/opt/Comfy Desktop/resources/bootstrap-python/lib" _elf _rpath _entry _relative _entries
    while IFS= read -r -d '' _elf; do
        _rpath=$(readelf -d "$_elf" 2>/dev/null | sed -nE 's/.*\((RPATH|RUNPATH)\).*\[(.*)\]/\2/p')
        [[ -n $_rpath ]] || continue
        _relative=1
        IFS=: read -ra _entries <<< "$_rpath"
        for _entry in "${_entries[@]}"; do
            [[ $_entry == '$ORIGIN'* ]] || _relative=0
        done
        (( _relative )) || patchelf --force-rpath --set-rpath '$ORIGIN' "$_elf"
    done < <(find "$_pylib" -type f \( -name '*.so' -o -name '*.so.*' \) -print0)

    install -d "$pkgdir/usr/bin"
    ln -s '/opt/Comfy Desktop/comfyui-desktop-2' "$pkgdir/usr/bin/comfy-desktop"

    # License
    install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
