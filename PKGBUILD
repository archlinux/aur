# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=paseo
pkgver=0.1.95
pkgrel=2
pkgdesc="One interface for all your Claude Code, Codex and OpenCode agents (built from source, runs on system Electron)"
arch=('x86_64')
url="https://paseo.sh"
_github_url="https://github.com/getpaseo/paseo"
# Keep in sync with packages/desktop/package.json devDependencies.electron —
# prepare() fails the build when the majors drift apart.
_electron_pkg=electron41
license=('AGPL-3.0-or-later')
depends=("${_electron_pkg}" 'gcc-libs' 'glibc' 'hicolor-icon-theme')
makedepends=('nodejs' 'npm' 'python' 'git')
optdepends=('git: agent worktree management')
conflicts=('paseo-bin' 'paseo-desktop-bin' 'paseo-appimage')
options=('!debug')
install=paseo.install
source=(
    "${pkgname}-${pkgver}.tar.gz::${_github_url}/archive/refs/tags/v${pkgver}.tar.gz"
    'paseo.sh'
    'paseo.desktop'
    'paseo.service'
    'trace-desktop.mjs'
    'system-electron-paths.patch'
)
sha256sums=('d32caf9b1495757e422d234fccb5a3c10f96170f2d2f0a5198b65f13361fb007'
            '5f744a24a3605f78ee30348e1d705f47d803f915e58e076ea6e11f151d678407'
            '6ae9c520668f639a22f17df7814548056ee46aa99a2886639405297a7b1ef212'
            '2f6c6150888597966eeaf15726bbffce1e45fa3aa4a34104f3b109e1b916569b'
            '6be3fbd2634a77faa21fed02abe3d486680cdb880db97f5c1a9fe948a99e1865'
            '437a8ef0ad31411c6c96dc361718d6de32bb286cc1e0ed1d25c932080290c7d6')

prepare() {
    cd "${pkgname}-${pkgver}"

    # Refuse to build against the wrong Electron major: the app would compile
    # fine but hit runtime API drift. Bump _electron_pkg= (and pkgrel) when
    # upstream moves on.
    local _upstream_electron
    _upstream_electron="$(node -p "require('./packages/desktop/package.json').devDependencies.electron.match(/\d+/)[0]")"
    if [[ "electron${_upstream_electron}" != "${_electron_pkg}" ]]; then
        printf 'ERROR: upstream now pins electron %s but this package uses %s; update _electron_pkg= in the PKGBUILD\n' \
            "${_upstream_electron}" "${_electron_pkg}" >&2
        return 1
    fi

    # Arch's system electron reports app.isPackaged=true, so the app takes
    # its packaged code paths; point the electron-builder resource lookups
    # (process.resourcesPath / app.asar*) at /usr/lib/paseo instead, and
    # leave updates to pacman rather than electron-updater.
    patch -Np1 -i "${srcdir}/system-electron-paths.patch"

    # Keep npm state inside $srcdir; skip lifecycle scripts (no electron /
    # onnxruntime binary downloads — mirrors upstream nix/desktop-package.nix).
    export npm_config_cache="${srcdir}/npm-cache"
    export npm_config_update_notifier=false
    npm ci --ignore-scripts --no-audit --no-fund

    # Root postinstall applies patches/ via patch-package.
    npm run postinstall
}

build() {
    cd "${pkgname}-${pkgver}"

    export npm_config_cache="${srcdir}/npm-cache"
    export npm_config_update_notifier=false
    export EXPO_NO_TELEMETRY=1
    export CI=1

    # node-pty is the only native addon the daemon needs (N-API, so it stays
    # ABI-compatible with the Electron runtime). Compiled directly with
    # node-gyp: `npm rebuild` is skipped by npm 11's allowScripts gate and by
    # the npm-shipped prebuild.
    (cd node_modules/node-pty && npx node-gyp rebuild)

    # Mirrors upstream nix/desktop-package.nix — tsc workspaces, Expo web
    # export for the renderer, then the desktop main process. No
    # electron-builder involved.
    npm run build:server
    npm run build --workspace=@getpaseo/expo-two-way-audio
    (cd packages/app && PASEO_WEB_PLATFORM=electron npx expo export --platform web)
    npm run build:main --workspace=@getpaseo/desktop
}

package() {
    cd "${pkgname}-${pkgver}"

    # Runtime closure by static module-graph tracing: upstream's daemon/CLI
    # trace plus our desktop-main trace, instead of the 2 GB node_modules.
    node scripts/trace-daemon.mjs > "${srcdir}/runtime-files.txt"
    node "${srcdir}/trace-desktop.mjs" >> "${srcdir}/runtime-files.txt"

    local _libdir="${pkgdir}/usr/lib/paseo"
    install -d "${_libdir}"

    # Root manifest lets node resolve the workspace layout at runtime.
    cp package.json "${_libdir}/"

    # Copy file-by-file, preserving workspace symlinks
    # (node_modules/@getpaseo/* -> packages/*). Directory entries are skipped:
    # their contents are listed individually, and copying a directory onto a
    # path that already exists would nest instead of merge.
    # node-pty's npm-shipped prebuilds are dropped: its loader prefers the
    # build/Release addon we compile ourselves (lib/utils.js search order).
    sort -u "${srcdir}/runtime-files.txt" | grep -v '^node_modules/node-pty/prebuilds/' | \
    while IFS= read -r f; do
        if [ ! -e "$f" ] && [ ! -L "$f" ]; then
            continue
        fi
        if [ -d "$f" ] && [ ! -L "$f" ]; then
            continue
        fi
        install -d "${_libdir}/$(dirname "$f")"
        cp -a "$f" "${_libdir}/$f"
    done

    # Launcher tracks _electron_pkg so an Electron bump is a one-line change.
    install -d "${pkgdir}/usr/bin"
    sed "s/electron41/${_electron_pkg}/g" "${srcdir}/paseo.sh" > "${pkgdir}/usr/bin/paseo"
    chmod 755 "${pkgdir}/usr/bin/paseo"

    install -Dm644 "${srcdir}/paseo.desktop" \
        "${pkgdir}/usr/share/applications/paseo.desktop"

    install -Dm644 "${srcdir}/paseo.service" \
        "${pkgdir}/usr/lib/systemd/user/paseo.service"

    install -Dm644 packages/app/dist/pwa-icon-192.png \
        "${pkgdir}/usr/share/icons/hicolor/192x192/apps/paseo.png"
    install -Dm644 packages/app/dist/pwa-icon-512.png \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/paseo.png"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Guard against trace regressions: every path here is load-bearing for
    # the CLI, the daemon spawn chain, or the renderer. A miss fails the
    # build instead of surfacing as a runtime error after install.
    local _required=(
        usr/bin/paseo
        usr/lib/paseo/package.json
        usr/lib/paseo/packages/desktop/dist/main.js
        usr/lib/paseo/packages/desktop/dist/preload.js
        usr/lib/paseo/packages/desktop/dist/daemon/node-entrypoint-runner.js
        usr/lib/paseo/packages/desktop/package.json
        usr/lib/paseo/packages/cli/dist/index.js
        usr/lib/paseo/packages/cli/dist/run.js
        usr/lib/paseo/packages/server/dist/scripts/supervisor-entrypoint.js
        usr/lib/paseo/node_modules/@getpaseo/cli
        usr/lib/paseo/node_modules/@getpaseo/server
        usr/lib/paseo/node_modules/node-pty/build/Release/pty.node
        usr/lib/paseo/packages/app/dist/index.html
        usr/lib/paseo/skills
    )
    local _f
    for _f in "${_required[@]}"; do
        if [[ ! -e "${pkgdir}/${_f}" ]]; then
            printf 'ERROR: runtime closure check failed: missing %s\n' "${_f}" >&2
            return 1
        fi
    done
}
