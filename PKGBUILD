# Maintainer: r3f <r3flector@pm.me>

pkgname=warp-terminal-git
_srcname=warp
pkgver=0.2026.04.29.08.56.preview_00.r1.g3f0ac51
pkgrel=1
pkgdesc="Warp, the Rust-based terminal for developers and teams (built from source, OSS channel)"
arch=('x86_64' 'aarch64')
url='https://github.com/warpdotdev/warp'
license=('AGPL3' 'MIT')
depends=(
    'curl'
    'fontconfig'
    'libegl'
    'libx11'
    'libxcb'
    'libxcursor'
    'libxi'
    'libxkbcommon-x11'
    'xdg-utils'
    'zlib'
)
makedepends=(
    'git'
    'rust'
    'cmake'
    'pkgconf'
    'protobuf'
    'openssl'
    'freetype2'
    'expat'
    'libgit2'
    'alsa-lib'
    'brotli'
    'jq'
    'cargo-about'
)
optdepends=(
    'zenity: for file dialogs in Gnome'
    'kdialog: for file dialogs in KDE'
    'org.freedesktop.secrets: for securely storing passwords'
)
provides=('warp-terminal-oss')
options=('!lto' '!debug')
source=("${_srcname}::git+https://github.com/warpdotdev/warp.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"
    local tag rev count
    if tag=$(git describe --long --tags --abbrev=7 2>/dev/null); then
        echo "${tag}" | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
    else
        count=$(git rev-list --count HEAD)
        rev=$(git rev-parse --short=7 HEAD)
        printf '0.r%s.g%s' "$count" "$rev"
    fi
}

prepare() {
    cd "${srcdir}/${_srcname}"
    # Используем системный rust (1.95+) вместо запиненного rustup-toolchain (1.92).
    rm -f rust-toolchain.toml
}

build() {
    cd "${srcdir}/${_srcname}"
    export CARGO_TARGET_DIR="${srcdir}/target"
    export CARGO_HOME="${srcdir}/cargo-home"
    export RUSTFLAGS="--remap-path-prefix=${srcdir}=/build ${RUSTFLAGS:-}"
    export CFLAGS+=" -ffile-prefix-map=${srcdir}=/build"
    export CXXFLAGS+=" -ffile-prefix-map=${srcdir}=/build"
    cargo build \
        --release \
        --locked \
        --package warp \
        --bin warp-oss \
        --features 'release_bundle,gui,nld_improvements'
}

package() {
    local opt_dir="/opt/warpdotdev/${pkgname}"
    cd "${srcdir}/${_srcname}"

    # Бинарник.
    install -Dm755 "${srcdir}/target/release/warp-oss" \
        "${pkgdir}${opt_dir}/warp-oss"

    # Bundled-ресурсы (skills, fonts и т. п.). Лицензии и settings schema —
    # генерируются опционально, скипаем чтобы не плодить лишние cargo-вызовы.
    SKIP_SETTINGS_SCHEMA=1 NO_LICENSES=1 \
        ./script/prepare_bundled_resources \
        "${pkgdir}${opt_dir}/resources" \
        oss

    # .desktop и иконка из OSS-канала.
    install -Dm644 "app/channels/oss/dev.warp.WarpOss.desktop" \
        "${pkgdir}/usr/share/applications/dev.warp.WarpOss.desktop"
    install -Dm644 "app/channels/oss/icon/no-padding/512x512.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/dev.warp.WarpOss.png"

    # Перепишем Exec в .desktop'е, чтобы запускалось через /usr/bin/${pkgname}.
    sed -i "s|^Exec=.*|Exec=/usr/bin/${pkgname} %U|" \
        "${pkgdir}/usr/share/applications/dev.warp.WarpOss.desktop"

    # Launcher: подхватывает ~/.config/${pkgname}-flags.conf, как делает upstream.
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/bash
XDG_CONFIG_HOME=\${XDG_CONFIG_HOME:-~/.config}
if [[ -f \$XDG_CONFIG_HOME/${pkgname}-flags.conf ]]; then
    WARP_USER_FLAGS="\$(grep -v '^#' \$XDG_CONFIG_HOME/${pkgname}-flags.conf)"
fi
exec ${opt_dir}/warp-oss \$WARP_USER_FLAGS "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Лицензии.
    install -Dm644 LICENSE-AGPL "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-AGPL"
    install -Dm644 LICENSE-MIT  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
