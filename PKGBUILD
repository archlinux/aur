# Maintainer: xzl <xzl01@outlook.com>

pkgname=yesplaymusic-axuanran-git
_pkgname=xump
_electronversion=42
pkgver=0.1.1.alpha.14.r32.g1d0dadf
pkgrel=1
pkgdesc="XuMP - a third-party Netease Cloud Music player (git version)"
arch=('x86_64')
url="https://github.com/axuanran/YesPlayMusic"
license=('MIT')
provides=("${_pkgname}")
conflicts=(
    'yesplaymusic'
    'yesplaymusic-bin'
    'yesplaymusic-electron'
    'yesplaymusic-git'
    'yesplaymusic-axuanran-bin'
)
depends=(
    "electron${_electronversion}"
    'alsa-lib'
    'gtk3'
    'libxss'
    'nss'
)
optdepends=(
    'libnotify: desktop notifications'
    'libayatana-appindicator: system tray support'
    'xdg-utils: open URLs with default browser'
    'nodejs: xumpctl / xump-mcp-http control CLI'
)
makedepends=(
    'git'
    'nodejs'
    'npm'
    'yarn'
)
options=('!strip' '!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    set -o pipefail
    git describe --long --tags --match 'v*' --abbrev=7 |
        sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g' ||
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

_set_build_env() {
    export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
    export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export HOME="${srcdir}/.home"
    export XDG_CACHE_HOME="${srcdir}/.home/.cache"
    export XDG_CONFIG_HOME="${srcdir}/.home/.config"
    export npm_config_cache="${srcdir}/.home/.npm"
    export YARN_CACHE_FOLDER="${srcdir}/.yarn-cache"
    mkdir -p "${HOME}" "${XDG_CACHE_HOME}" "${XDG_CONFIG_HOME}" "${npm_config_cache}" "${YARN_CACHE_FOLDER}"
}

prepare() {
    cd "${pkgname}"
    cp .env.example .env

    # the app is built against the system electron, so keep the pin honest
    local _expected
    _expected="$(node -p "require('./package.json').devDependencies.electron.replace(/[^0-9.]/g, '').split('.')[0]" 2>/dev/null || echo '?')"
    if [[ "${_expected}" != "${_electronversion}" ]]; then
        printf '\n==> upstream expects electron %s but this PKGBUILD pins electron%s\n' \
            "${_expected}" "${_electronversion}" >&2
        printf '==> bump _electronversion (and the depends entry) in the PKGBUILD\n\n' >&2
    fi
}

build() {
    cd "${pkgname}"
    _set_build_env

    # yarn skips devDependencies when NODE_ENV=production
    export NODE_ENV=development
    yarn install --frozen-lockfile --ignore-scripts --ignore-engines --non-interactive

    export NODE_ENV=production
    set -a
    . ./.env
    set +a

    yarn electron-vite build
    yarn tui:build

    # package against the system electron instead of the bundled one
    ./node_modules/.bin/electron-builder --linux dir \
        -c.electronDist="${ELECTRON_DIST}" \
        --publish never
}

package() {
    cd "${pkgname}"

    local _libdir="${pkgdir}/usr/lib/${pkgname}"
    local _unpacked
    _unpacked="$(find dist_electron/linux-unpacked -maxdepth 1 -type f -name resources.pak -printf '%h')"

    install -dm755 "${_libdir}"
    cp -a "${_unpacked}/resources/app.asar" "${_libdir}/"
    if [[ -d "${_unpacked}/resources/app.asar.unpacked" ]]; then
        cp -a "${_unpacked}/resources/app.asar.unpacked" "${_libdir}/"
    fi

    install -dm755 "${pkgdir}/usr/bin"
    cat >"${pkgdir}/usr/bin/${_pkgname}" <<EOF
#!/bin/sh
export CHROME_DESKTOP="${_pkgname}.desktop"
# the app is started from a directory, so make it believe it is packaged
export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_IS_DEV=0
export ELECTRON_OZONE_PLATFORM_HINT="\${ELECTRON_OZONE_PLATFORM_HINT:-auto}"
exec /usr/lib/electron${_electronversion}/electron /usr/lib/${pkgname}/app.asar "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat >"${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=XuMP
Name[zh_CN]=XuMP 网易云音乐
GenericName=Music Player
GenericName[zh_CN]=音乐播放器
Comment=Third-party Netease Cloud Music client
Comment[zh_CN]=高颜值的第三方网易云播放器
Exec=${_pkgname} %U
Icon=${_pkgname}
Terminal=false
Categories=AudioVideo;Audio;Player;
Keywords=music;netease;player;
StartupWMClass=${_pkgname}
EOF

    # node-only control CLI: it talks to the running app over
    # $XDG_RUNTIME_DIR/xump-control.sock (see docs/control-api.md), so it needs
    # nodejs (optdepend) but not the app itself to be installed from here
    install -Dm755 scripts/xumpctl.mjs "${pkgdir}/usr/lib/${pkgname}/cli/xumpctl.mjs"
    install -Dm644 scripts/xump-mcp-http.mjs \
        "${pkgdir}/usr/lib/${pkgname}/cli/xump-mcp-http.mjs"
    cat >"${pkgdir}/usr/bin/xumpctl" <<EOF
#!/bin/sh
exec node /usr/lib/${pkgname}/cli/xumpctl.mjs "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/xumpctl"
    cat >"${pkgdir}/usr/bin/xump-mcp-http" <<EOF
#!/bin/sh
exec node /usr/lib/${pkgname}/cli/xump-mcp-http.mjs "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/xump-mcp-http"

    local _size
    for _size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "build/icons/${_size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${_pkgname}.png"
    done

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
