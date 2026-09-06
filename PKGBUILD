# Maintainer: Haven Software <havensoftware@zohomail.com>
pkgname=haven-desktop-git
pkgver=0.8.5.r8.g5183659258
pkgrel=1
pkgdesc="Matrix chat and social client, built on Element Web/Desktop (built from source)"
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
# HAVEN_SESHAT=0 skips building matrix-seshat (local encrypted-room message search) from
# source - on by default, matching every other Haven build/release (arguably the reason to
# pick this package over the community element-desktop-git, which never builds it at all).
# Skipping it is a real, safe feature tradeoff, not a build-machine workaround: the packaged
# app simply lacks local search (falls back to the same "Cannot find package 'matrix-seshat'"
# gap every Haven release before 0.8.0 silently shipped with, not a crash or install
# failure) - pnpm-workspace.yaml's own matrix-seshat "link:" dependency tolerates its target
# directory not existing at all, confirmed by a real fresh-clone build with no .hak/
# succeeding well before hak's own build step ever runs.
# NOTE for whoever edits this next: .SRCINFO is a static snapshot from `makepkg
# --printsrcinfo` - it only reflects whichever branch below is true at generation time (the
# default, HAVEN_SESHAT unset), not both. AUR helpers reading .SRCINFO alone won't discover
# the makedepends change a user's own HAVEN_SESHAT=0 build makes - an accepted, if unusual,
# tradeoff for a PKGBUILD with an optional variant like this.
_seshat=${HAVEN_SESHAT:-1}

# rust/perl are for building matrix-seshat from source - it bundles SQLCipher, whose
# "bundled-sqlcipher" cargo feature also vendors+compiles OpenSSL from source (openssl-src
# crate), which needs perl for its Configure script. No libclang/bindgen in the dependency
# tree, so no clang makedepend needed - see the release repo's own flatpak/build.sh for how
# this was worked out from a real Flathub aarch64 CI failure.
# libxcrypt-compat: fpm's own vendored Ruby needs libcrypt.so.1, the legacy SONAME modern
# Arch's glibc/libxcrypt split dropped in favor of libxcrypt's own newer one - confirmed
# live ("ruby: error while loading shared libraries: libcrypt.so.1: cannot open shared
# object file"). The community element-desktop-git AUR package already carries this same
# makedepend for the identical reason.
makedepends=('git' 'nodejs' 'npm' 'libxcrypt-compat')
if [ "$_seshat" = 1 ]; then
    makedepends+=('rust' 'perl')
fi
source=("${pkgname%-git}::git+https://github.com/Haven-Organization/haven-desktop.git#branch=develop")
sha256sums=('SKIP')
install=haven-desktop-git.install

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --tags --long | sed 's/^haven-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # This is a unified fork repo, not a plain element-web checkout - the actual pnpm
    # workspace root (package.json, pnpm-workspace.yaml) lives under element-web/, while the
    # repo root itself only has HAVEN_VERSION/flatpak/scripts/LICENSE etc. Confirmed live: a
    # bare "pnpm install" at the repo root fails outright with ERR_PNPM_NO_PKG_MANIFEST.
    cd "$srcdir/${pkgname%-git}/element-web"

    # hak (Element's native-module build tool) hardcodes "yarn" for matrix-seshat's own
    # install/build steps, not pnpm. Pin real Yarn Classic (1.x) locally instead of trusting
    # whatever "yarn" the build machine happens to have on PATH - could be missing entirely,
    # or a Yarn Berry shim via corepack, which behaves very differently. Matches the same
    # reasoning flatpak/build.sh landed on after chasing several aarch64 CI failures back to
    # exactly this kind of assumption.
    npm install --global --prefix "$srcdir/yarn-local" yarn@1.22.22

    # root package.json's devEngines.packageManager pins pnpm@11.23.0 for a real reason, not
    # just style: pnpm-workspace.yaml's allowBuilds gained a git-URL-keyed entry (needed for
    # pnpm >=11.9's stricter git-hosted-package security gate) that older pnpm can't even
    # parse - confirmed live against Arch's own official "pnpm" package (11.3.0, the latest
    # available there as of this writing): "pnpm install" fails outright with
    # ERR_PNPM_INVALID_VERSION_UNION. This isn't a version-pin *check* to bypass (that's what
    # COREPACK_ENABLE_STRICT=0/PNPM_CONFIG_PM_ON_FAIL=ignore below are for) - it's a real
    # functionality gap in the pnpm binary itself, so pin a genuinely modern one the same way
    # yarn is pinned above, matching flatpak/build.sh's own pnpm-11.23.0.tgz vendoring for
    # this identical reason.
    npm install --global --prefix "$srcdir/pnpm-local" pnpm@11.23.0
    export PATH="$srcdir/pnpm-local/bin:$PATH"

    export CI=true
    export NX_NON_INTERACTIVE=true
    # See the repo's own feedback-build-command notes: root package.json pins an exact pnpm
    # version via devEngines.packageManager, and corepack separately pins a yarn version at
    # the user-global level that otherwise blocks pnpm outright - both bypassed the same way
    # every other real build in this project already does it.
    export COREPACK_ENABLE_STRICT=0
    export PNPM_CONFIG_PM_ON_FAIL=ignore
    export npm_config_pm_on_fail=ignore
    # HAVEN_NO_BRANDING/HAVEN_LOGIN_BACKGROUND/HAVEN_NOTIFICATION_SOUND are real source-tree
    # mutations (a git-checkout-based revert loop plus two webpack.config.ts source patches
    # for the first one; file substitution for the other two), not simple env-read switches -
    # they live in scripts/setup.sh, which this PKGBUILD otherwise deliberately doesn't call
    # (its own plain "pnpm install" would re-trigger the expensive install-app-deps
    # postinstall --ignore-scripts below exists to skip). Only pay that cost on the less
    # common opt-in path; the default build keeps the fast, already-proven recipe untouched.
    if [ -n "${HAVEN_NO_BRANDING:-}${HAVEN_LOGIN_BACKGROUND:-}${HAVEN_NOTIFICATION_SOUND:-}" ]; then
        bash "$srcdir/${pkgname%-git}/scripts/setup.sh"
    else
        # --ignore-scripts skips the workspace root's own postinstall, which runs
        # apps/desktop's "sane-postinstall" (electron-builder install-app-deps) across all 12
        # workspace projects - a generic native-module rebuild pass that isn't needed here
        # (the only real native dependency, matrix-seshat, is hak-managed and built
        # separately below with SQLCIPHER_BUNDLED=1, not through electron-builder's own
        # rebuild machinery at all) and spiked memory hard enough with its own default
        # per-core parallelism to get this build OOM-killed twice in a row on an otherwise
        # healthy machine.
        pnpm install --frozen-lockfile=false --ignore-scripts
    fi
}

build() {
    cd "$srcdir/${pkgname%-git}/element-web"
    export PATH="$srcdir/yarn-local/bin:$srcdir/pnpm-local/bin:$PATH"
    export CI=true
    export NX_NON_INTERACTIVE=true
    export COREPACK_ENABLE_STRICT=0
    export PNPM_CONFIG_PM_ON_FAIL=ignore
    export npm_config_pm_on_fail=ignore
    cd apps/web
    # nx's default task parallelism (3) runs multiple projects' webpack/Terser builds
    # concurrently ("build" depends on "^build" - element-web + 4 dependency tasks were
    # reported running together) - each one memory-heavy enough on its own (production
    # minification is the slow, RAM-hungry part) that running them concurrently OOM-killed
    # this build even with the machine otherwise idle. NX_PARALLEL is not a real nx env var
    # (confirmed - not referenced anywhere in nx's own source). "pnpm build -- --parallel=1"
    # doesn't work either - pnpm's own "--" passthrough delivers a literal "--" token
    # followed by the flag (confirmed live: process.argv came through as
    # ["--","--parallel=1"]), which nx's yargs-based parser treats as "everything after
    # this is positional", not a real --parallel option - it silently kept using the
    # default the whole time. Invoke nx directly via "pnpm exec" instead, which passes the
    # flag through cleanly with no "--" involved at all.
    # HAVEN_INCLUDE_OLD_ROOM_LIST is required for any real/deployed build, not just dev -
    # without it the "Use Old Room List" Labs toggle silently has nothing to switch to
    # (legacy-room-list resolves to a stub at build time otherwise).
    # Invoke the installed nx binary directly rather than through "pnpm exec" - the latter
    # re-runs its own lockfile-freshness check first, which re-triggers the exact
    # apps/desktop "sane-postinstall" (electron-builder install-app-deps) step prepare()
    # already deliberately skipped with --ignore-scripts.
    HAVEN_INCLUDE_OLD_ROOM_LIST="${HAVEN_INCLUDE_OLD_ROOM_LIST:-1}" \
        "$srcdir/${pkgname%-git}/element-web/node_modules/.bin/nx" build --parallel=1

    # electron-builder's own beforeBuild hook hard-requires apps/desktop/webapp.asar to
    # already exist ("The webapp.asar archive is missing. Building without a webapp is
    # fruitless.", confirmed live) - "nx build" above only produces the raw unpacked
    # apps/web/webapp/ directory, it doesn't pack it. config.sample.json is copied in first
    # since electron-builder needs *some* config.json present; a generic build can't bake in
    # a real homeserver choice. Matches flatpak/build.sh's own equivalent step exactly.
    cp config.sample.json webapp/config.json
    cd ../desktop
    pnpm exec asar pack ../web/webapp webapp.asar

    # Build matrix-seshat from source before packaging (unless HAVEN_SESHAT=0 - see that
    # variable's own comment near makedepends above) - SQLCIPHER_BUNDLED=1 statically links
    # SQLCipher/OpenSSL into index.node instead of dynamically linking the system's
    # libsqlcipher.so.0 (confirmed via ldd - without it, this becomes a real, silent
    # runtime-breakage risk on any machine without that exact package/SONAME installed).
    if [ "$_seshat" = 1 ]; then
        SQLCIPHER_BUNDLED=1 pnpm run build:native
    fi

    # VARIANT_PATH (e.g. VARIANT_PATH=element.io/release/build.json for a stock-Element
    # identity/appId/protocols instead of Haven's own) needs no handling here at all -
    # electron-builder.ts reads it straight from process.env, and an exported env var
    # already reaches this function's child processes through normal shell inheritance.

    # electron-builder.ts's own default linux.target is ["tar.gz", "deb", "AppImage"] - the
    # CLI's "--linux pacman" flag ADDS to that list rather than replacing it (confirmed
    # live: a real build with just that flag built all four targets, wasting ~12 minutes and
    # hitting an unrelated deb-specific failure before ever reaching pacman). Sed-patch the
    # target list directly instead, the same way flatpak/build.sh already does for its own
    # "dir" target, to build only what package() actually uses.
    sed -i 's/target: \["tar.gz", "deb", "AppImage"\],/target: ["pacman"],/' electron-builder.ts

    # "--publish=never" alone isn't enough to stop electron-builder from generating
    # autoupdate metadata (confirmed live: "GitHub Personal Access Token is not set" -
    # CI=true, needed elsewhere in this build, makes electron-builder implicitly assume
    # publishing is wanted regardless of the CLI flag). flatpak/build.sh already solved this
    # identical problem the same way: force config.publish = null at the config level.
    sed -i 's#export default config;#config.publish = null; export default config;#' electron-builder.ts

    # Build the real pacman target (same electron-builder/fpm output already published in
    # GitHub releases and used by haven-desktop-bin) rather than the raw "dir" target and
    # hand-assembling a .desktop/icon layout ourselves - fpm already gets the Exec path,
    # icon name, MIME handlers and StartupWMClass right, confirmed by inspecting a real
    # release .pacman directly.
    VERSION="${pkgver%%.r*}" pnpm build -- --publish=never
}

package() {
    cd "$srcdir/${pkgname%-git}/element-web/apps/desktop"
    bsdtar -xf dist/*.pacman -C "$pkgdir" --exclude='.PKGINFO' --exclude='.MTREE' --exclude='.BUILDINFO' --exclude='.INSTALL'

    install -Dm644 ../../../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
