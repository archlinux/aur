# Maintainer: Haven Software <havensoftware@zohomail.com>
pkgname=haven-desktop-git
pkgver=0.10.0.r11.g65e9fcb786
pkgrel=1
pkgdesc="Matrix chat and social client, built on Element Web/Desktop (built from source - see docs/building.md for build flags)"
arch=('x86_64')
url="https://github.com/Haven-Organization/haven-desktop"
license=('AGPL-3.0-only')
provides=('haven-desktop')
conflicts=('haven-desktop')
options=('!strip' '!debug')
depends=(
    'gtk3'
    'nss'
    'libxss'
    'libnotify'
    'libayatana-appindicator'
    'alsa-lib'
    'at-spi2-core'
    'libsecret'
    'c-ares'
    'libevent'
    'libvpx'
    'libxslt'
    're2'
    'snappy'
)
# libxcrypt-compat: fpm's own vendored Ruby (used by electron-builder's pacman target) needs
# libcrypt.so.1, the legacy SONAME modern Arch's glibc/libxcrypt split dropped. The community
# element-desktop-git AUR package carries this same makedepend for the identical reason.
# matrix-seshat (local encrypted-room message search) comes from upstream's prebuilt
# @matrix-org/seshat-linux-x64 package, the same module every Haven release ships, so no Rust
# toolchain is needed.
makedepends=('git' 'nodejs' 'npm' 'libxcrypt-compat')
source=("${pkgname%-git}::git+https://github.com/Haven-Organization/haven-desktop.git#branch=develop")
sha256sums=('SKIP')
install=haven-desktop-git.install

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --tags --long | sed 's/^haven-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_build_env() {
    export PATH="$srcdir/pnpm-local/bin:$PATH"
    export CI=true
    export NX_NON_INTERACTIVE=true
    # The workspace pins its pnpm version via devEngines.packageManager; the pnpm installed in
    # prepare() is that version, and these keep a user-global corepack/yarn pin from blocking it.
    export COREPACK_ENABLE_STRICT=0
    export PNPM_CONFIG_PM_ON_FAIL=ignore
    export npm_config_pm_on_fail=ignore
}

# @element-hq/element-call-component is a git dependency (a subdirectory of the element-call
# repository) that only exists once its prepare script has built it from the whole repository
# with element-call's own dependencies; apps/web's webpack config and Call.ts import its output.
# "pnpm install --ignore-scripts" skips that prepare script, so build the component from the
# commit apps/web pins and put the component directory - what the dependency resolves to - in
# place of what the install left. Only the JS build runs: Haven's webpack build doesn't read the
# component's type declarations.
_build_element_call_component() {
    local _ec_commit _component
    _ec_commit=$(node -p 'require("./apps/web/package.json").dependencies["@element-hq/element-call-component"].match(/#([0-9a-f]{40})/)[1]')
    rm -rf "$srcdir/element-call"
    git clone --filter=blob:none --no-checkout https://github.com/element-hq/element-call.git "$srcdir/element-call"
    git -C "$srcdir/element-call" checkout --quiet "$_ec_commit"
    (
        cd "$srcdir/element-call"
        PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 pnpm install --frozen-lockfile
        pnpm build:component:js
    )
    _component=$(realpath apps/web/node_modules/@element-hq/element-call-component)
    find "$_component" -mindepth 1 -delete
    cp -r "$srcdir/element-call/component/." "$_component/"
}

prepare() {
    # This is a unified fork repo, not a plain element-web checkout - the pnpm workspace root
    # lives under element-web/.
    cd "$srcdir/${pkgname%-git}/element-web"

    # Install the exact pnpm the workspace pins rather than trusting Arch's own "pnpm" package,
    # which has lagged far enough behind to be unable to parse pnpm-workspace.yaml at all.
    npm install --global --prefix "$srcdir/pnpm-local" \
        "pnpm@$(node -p 'require("./package.json").devEngines.packageManager.version')"
    _build_env

    # HAVEN_NO_BRANDING/HAVEN_LOGIN_BACKGROUND/HAVEN_NOTIFICATION_SOUND are real source-tree
    # mutations handled by scripts/setup.sh, which also runs a full "pnpm install" (scripts
    # included, so the Element Call component's own prepare script builds it). Only pay that
    # cost on the opt-in path.
    if [ -n "${HAVEN_NO_BRANDING:-}${HAVEN_LOGIN_BACKGROUND:-}${HAVEN_NOTIFICATION_SOUND:-}" ]; then
        bash "$srcdir/${pkgname%-git}/scripts/setup.sh"
    else
        # --ignore-scripts skips the workspace root's postinstall, which runs apps/desktop's
        # "sane-postinstall" (electron-builder install-app-deps) across every workspace
        # project - a native-module rebuild pass this build doesn't need, and one that spiked
        # memory hard enough to get the build OOM-killed.
        pnpm install --frozen-lockfile=false --ignore-scripts
        _build_element_call_component
    fi
}

build() {
    cd "$srcdir/${pkgname%-git}/element-web"
    _build_env
    cd apps/web
    # Invoke nx directly (not "pnpm build -- --parallel=1": pnpm passes a literal "--" that
    # makes nx ignore the flag, and "pnpm exec" re-runs the install-app-deps step skipped
    # above). One task at a time: several concurrent production webpack builds OOM-killed this.
    # HAVEN_INCLUDE_OLD_ROOM_LIST is what every Haven release is built with.
    HAVEN_INCLUDE_OLD_ROOM_LIST="${HAVEN_INCLUDE_OLD_ROOM_LIST:-1}" \
        "$srcdir/${pkgname%-git}/element-web/node_modules/.bin/nx" build --parallel=1

    # electron-builder requires apps/desktop/webapp.asar; config.sample.json gives it a
    # generic config.json (a generic build can't choose a homeserver).
    cp config.sample.json webapp/config.json
    cd ../desktop
    pnpm exec asar pack ../web/webapp webapp.asar

    # electron-builder's default linux.target list is extended, not replaced, by CLI flags, so
    # build only the pacman target package() uses; and CI=true makes it assume publishing, so
    # turn that off at the config level.
    sed -i 's/target: \["tar.gz", "deb", "AppImage"\],/target: ["pacman"],/' electron-builder.ts
    sed -i 's#export default config;#config.publish = null; export default config;#' electron-builder.ts

    # VERSION must be plain X.Y.Z; HAVEN_FULL_VERSION is the descriptive string Help & About
    # shows (haven-v<version>+element-v<tag>...).
    VERSION="${pkgver%%.r*}" \
        HAVEN_FULL_VERSION="$("$srcdir/${pkgname%-git}/scripts/compute-haven-version.sh")" \
        pnpm build -- --publish=never
}

package() {
    cd "$srcdir/${pkgname%-git}/element-web/apps/desktop"
    bsdtar -xf dist/*.pacman -C "$pkgdir" --exclude='.PKGINFO' --exclude='.MTREE' --exclude='.BUILDINFO' --exclude='.INSTALL'

    install -Dm644 ../../../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
