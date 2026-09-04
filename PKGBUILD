# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=picot
pkgver=0.5.3
pkgrel=1
# Keep in sync with scripts/pi-version.json; prepare() fails the build on drift.
_pi_ver=0.84.4
pkgdesc="Local Codex-style desktop GUI for the Pi coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/shixin-guo/picot"
license=('MIT')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gcc-libs'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
)
makedepends=(
    'bun'
    'rust'
    'cargo'
    'pkgconf'
)
# Upstream renamed the project pi-studio -> picot (GitHub repo redirect); this
# package supersedes pi-studio. replaces= migrates existing installs on -Syu.
provides=('pi-studio')
replaces=('pi-studio')
conflicts=('pi-studio' 'picot-bin')
options=('!lto' '!debug')

_pi_relurl="https://github.com/earendil-works/pi-mono/releases/download/v${_pi_ver}"

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bb136349913e8340c9a74b4e0740ed8001c18462504da77cf3fd1081b4a91af1')
sha256sums_x86_64=('c2f3c3e6a1850bd87654cc3ca8811013272397c3d042a4e2a64c43ee1b423972')
sha256sums_aarch64=('135580f6b942151646e67b8b866d987d28ce3cff5a497030775ddd29659f943d')
source_x86_64=("pi-linux-x64-${_pi_ver}.tar.gz::${_pi_relurl}/pi-linux-x64.tar.gz")
source_aarch64=("pi-linux-arm64-${_pi_ver}.tar.gz::${_pi_relurl}/pi-linux-arm64.tar.gz")

prepare() {
    cd "picot-${pkgver}"

    export HOME="${srcdir}/.home"
    mkdir -p "$HOME"

    # Drift here means we'd bundle a pi build upstream never pinned.
    local _locked_pi
    _locked_pi="$(node -p "require('./scripts/pi-version.json').version")"
    if [[ "${_locked_pi}" != "${_pi_ver}" ]]; then
        printf 'ERROR: scripts/pi-version.json pins pi %s but this PKGBUILD fetches %s; update _pi_ver=\n' \
            "${_locked_pi}" "${_pi_ver}" >&2
        return 1
    fi

    # Place the pre-downloaded pi binary so the fetch script is skipped
    local _pidir="src-tauri/resources/pi"
    mkdir -p "${_pidir}"
    cp -a "${srcdir}/pi/". "${_pidir}/"
    printf '%s' "${_pi_ver}" > "${_pidir}/.version"

    # 0.3.4 wired fetch:terminal-font / fetch:cjk-font into beforeBuildCommand.
    # Both are no-ops here because upstream commits the converted webfonts
    # (public/fonts/*/ plus a .version marker matching the lock file), so they
    # short-circuit and build() stays offline. If a release ever stops shipping
    # them, the scripts would quietly download mid-build instead — fail now.
    local _font _dir _locked
    for _font in 'terminal:terminal-font-version.json' 'cjk:cjk-font-version.json'; do
        _dir="public/fonts/${_font%%:*}"
        _locked="$(node -p "require('./scripts/${_font#*:}').version")"
        if [[ ! -r "${_dir}/.version" || "$(< "${_dir}/.version")" != "${_locked}" ]]; then
            printf 'ERROR: %s/.version missing or not %s; the font fetch scripts would hit the network in build()\n' \
                "${_dir}" "${_locked}" >&2
            return 1
        fi
    done

    # The upstream development fallback embeds $srcdir through
    # env!("CARGO_MANIFEST_DIR") even in release builds.
    sed -i '/PathBuf::from(env!("CARGO_MANIFEST_DIR"))/,+2c\
        PathBuf::from("public"),' src-tauri/src/main.rs

    bun install --frozen-lockfile

    export CARGO_HOME="${srcdir}/.cargo"
    export RUSTUP_TOOLCHAIN=stable
    (cd src-tauri && cargo fetch --target "${CARCH}-unknown-linux-gnu")
}

build() {
    cd "picot-${pkgver}"

    export HOME="${srcdir}/.home"
    export CARGO_HOME="${srcdir}/.cargo"
    export RUSTUP_TOOLCHAIN=stable
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}/picot-${pkgver}=/build/${pkgname} --remap-path-prefix=${srcdir}/.cargo/registry=/cargo-registry"

    # Build extensions
    bun run build:extensions

    # Build Tauri app without bundling
    bun run tauri build --no-bundle
}

package() {
    cd "picot-${pkgver}"

    # ponytail: upstream 0.3.1 added .cargo/config.toml (target-dir = "target"),
    # moving the binary out of src-tauri/. Accept either layout.
    install -Dm755 "$(ls target/release/picot src-tauri/target/release/picot 2>/dev/null | head -1)" \
        "${pkgdir}/usr/bin/${pkgname}"

    # Frontend resources
    local _libdir="${pkgdir}/usr/lib/Picot"
    install -d "${_libdir}"
    cp -a public "${_libdir}/public"

    # Bundled pi runtime
    cp -a src-tauri/resources/pi "${_libdir}/pi"

    # Bundled extensions
    install -d "${_libdir}/extensions"
    install -Dm644 extensions/dist/*.mjs "${_libdir}/extensions/"

    # Icons
    local _icondir="${pkgdir}/usr/share/icons/hicolor"
    install -Dm644 "src-tauri/icons/32x32.png" "${_icondir}/32x32/apps/${pkgname}.png"
    install -Dm644 "src-tauri/icons/128x128.png" "${_icondir}/128x128/apps/${pkgname}.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" "${_icondir}/256x256/apps/${pkgname}.png"

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Picot
Comment=Local Codex-style desktop GUI for the Pi coding agent
Exec=picot
Icon=picot
Terminal=false
Categories=Development;
StartupWMClass=picot
EOF

    # Upstream declares MIT in package.json but ships no LICENSE file
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
}
