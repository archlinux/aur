# Maintainer: Zadkiel AHARONIAN <hello@zadkiel.fr>
# Repository: https://github.com/aslafy-z/aur-packages

# Built from a rolling main branch, since upstream publishes neither releases
# nor tags.
#
# pkgver carries the Codex app version on its own, and is the value Renovate
# bumps. A pkgver() alone would not be enough: it only ever runs when somebody
# rebuilds, so an installed copy is never told a newer app exists. Bumping this
# line is what publishes an AUR revision that helpers surface to users, while
# pkgver() below still stamps each build with what it actually produced.
pkgname=codex-desktop-git
pkgver=26.721.81911.r1792.g042adb7b # renovate: datasource=custom.codex-desktop-app depName=codex-desktop
pkgrel=1
pkgdesc='Unofficial ChatGPT desktop with built-in browser (ilysenko/codex-desktop-linux)'
arch=('x86_64')
url='https://github.com/ilysenko/codex-desktop-linux'
# MIT covers the Linux port. The macOS app it converts during build() remains
# OpenAI's, is fetched from their CDN rather than redistributed here, and is not
# covered by that MIT grant.
license=('MIT' 'LicenseRef-OpenAI-Terms')
depends=(
    'bash'
    'python'
    'xdg-utils'
    'hicolor-icon-theme'
    # Electron runtime libraries. Upstream's packaging/linux/PKGBUILD.template
    # names atk, which still resolves because at-spi2-core provides it, but
    # at-spi2-core is the package that actually exists. The template also omits
    # the direct links namcap reports against opt/codex-desktop/electron and the
    # rebuilt native modules: expat, systemd-libs, gcc-libs and glibc.
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'libcups'
    'libdrm'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
)
makedepends=(
    'git'
    'python'
    'curl'
    'unzip'
    # Upstream's template names p7zip here. Either resolves, since 7zip both
    # provides and replaces it, but 7zip is the package that actually exists.
    # The installer does refuse genuinely old p7zip builds, which cannot read
    # the APFS DMG, and those are no longer installable on Arch anyway.
    '7zip'
    'nodejs'
    'npm'
    # The notification action bridge, the Chrome extension host and the Computer
    # Use plugin are Rust, and the installer builds each of them only if it finds
    # cargo, warning and carrying on when it does not. Leaving this out therefore
    # does not fail the build, it silently ships a package whose contents depend
    # on whether the build host happened to have Rust installed.
    'cargo'
)
optdepends=(
    'nodejs: override the bundled managed Node.js runtime'
    'npm: Codex CLI install and update flows'
    'zenity: GTK dialog fallback when the Codex CLI is missing'
    'kdialog: KDE dialog fallback when the Codex CLI is missing'
    'ydotool: synthetic keyboard and pointer input for Computer Use on Wayland'
    'xdg-desktop-portal-wlr: screenshot and remote desktop portal for wlroots'
    'xdg-desktop-portal-gnome: screenshot and remote desktop portal for GNOME'
)
# codex-desktop is upstream's own identity for the app: /opt/codex-desktop, the
# Electron WM_CLASS, the ~/.config/codex-desktop settings directory, and the name
# its deb, rpm and pacman packages all use.
#
# The other two are separate AUR packagings of the same app that cannot be
# co-installed. codex-desktop-linux builds from a soft-fork into the same paths.
# openai-codex-desktop repackages the macOS archive and owns /usr/bin/codex-desktop
# as well, but declares no provides, so the name has to be listed explicitly.
# Listing it also covers chatgpt-desktop-bin, which provides and replaces it.
provides=('codex-desktop')
conflicts=('codex-desktop' 'codex-desktop-linux' 'openai-codex-desktop')
options=('!debug' '!strip')
install="$pkgname.install"
source=("$pkgname::git+https://github.com/ilysenko/codex-desktop-linux.git"
        'LicenseRef-OpenAI-Terms')
sha256sums=('SKIP'
            '7abd10bce8b40b17ff0902c0fa0750fcea831fd5afe67f8b4c02e4aeb8505ed3')

# The conversion runs in prepare() rather than build() so that pkgver() can read
# the version out of its result: makepkg runs prepare() before pkgver(), and
# build() only after it.
prepare() {
    cd "$pkgname"

    # Electron and the managed Node runtime arrive prebuilt. makepkg's default
    # flags do not match their ABI and break the native module rebuild.
    unset CFLAGS CXXFLAGS LDFLAGS

    # install.sh writes a job summary and run metadata into the DMG acceptance
    # report whenever it finds these set. Under a container build action the
    # runner's summary file is present in the environment but owned by another
    # user, so the write fails with EACCES and takes the build down with it.
    unset GITHUB_STEP_SUMMARY GITHUB_RUN_ID GITHUB_RUN_ATTEMPT \
        GITHUB_SERVER_URL GITHUB_REPOSITORY

    # The installer fetches the macOS payload, an Electron runtime, a managed
    # Node runtime and npm modules. Its caches default to the caller's home, so
    # redirect them into srcdir while still honouring a warm cache if set.
    export CODEX_INSTALL_DIR="$srcdir/codex-app"
    export CODEX_MANAGED_NODE_CACHE_DIR="${CODEX_MANAGED_NODE_CACHE_DIR:-$srcdir/cache/node-runtime}"
    export CODEX_ELECTRON_CACHE_DIR="${CODEX_ELECTRON_CACHE_DIR:-$srcdir/cache/electron}"
    export CODEX_BROWSER_USE_RUNTIME_CACHE_DIR="${CODEX_BROWSER_USE_RUNTIME_CACHE_DIR:-$srcdir/cache/browser-use}"
    export MAX_BUILD_THREADS="$(nproc)"

    ./install.sh
}

# Reports the version of the app that was actually built, from the
# CFBundleShortVersionString install.sh recorded for the payload it downloaded.
#
# Deliberately does not derive from $pkgver: makepkg rewrites the pkgver= line
# with whatever this returns, so appending to the previous value would compound
# the .rN.gSHA suffix on every rebuild. The pkgver= line above stays the Codex
# app version alone, which is what Renovate bumps and what reaches users as an
# AUR revision; makepkg's rewrite preserves its trailing annotation.
pkgver() {
    local _appver
    _appver=$(python -c '
import json, sys
version = json.load(open(sys.argv[1]))["upstreamDmg"]["appVersion"]
if not version:
    raise SystemExit("build-info.json recorded no upstreamDmg.appVersion")
print(version)
' "$srcdir/codex-app/.codex-linux/build-info.json")

    cd "$pkgname"

    printf '%s.r%s.g%s' \
        "$_appver" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=8 HEAD)"
}

package() {
    # Subshell: package-common.sh defines its own error(), which would otherwise
    # shadow makepkg's for the rest of the build.
    (
        cd "$srcdir/$pkgname"

        export REPO_DIR="$PWD"
        export APP_DIR="$srcdir/codex-app"
        export PACKAGE_NAME='codex-desktop'
        export DESKTOP_TEMPLATE="$REPO_DIR/packaging/linux/codex-desktop.desktop"
        # pacman owns updates here, so codex-update-manager, its systemd user
        # service and its polkit action are all left out of the payload.
        export PACKAGE_WITH_UPDATER=0

        # Upstream's own staging library. scripts/build-pacman.sh cannot be
        # called directly because it runs makepkg itself, but the PKGBUILD it
        # renders does nothing beyond copying this staging tree into pkgdir.
        . scripts/lib/package-common.sh
        ICON_SOURCE="$(resolve_package_icon_source)"

        stage_common_package_files "$pkgdir"
        write_launcher_stub "$pkgdir"
        stage_linux_feature_package_resources "$pkgdir" pacman
        run_linux_feature_package_hooks "$pkgdir" pacman
        normalize_package_payload_permissions "$pkgdir"
        restore_linux_feature_payload_permissions "$pkgdir"
        restore_linux_feature_package_resource_permissions "$pkgdir" pacman
    )

    install -Dm644 "$srcdir/$pkgname/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Every non-common licence identifier needs a file under
    # /usr/share/licenses. OpenAI publishes no redistributable licence text to
    # ship for theirs, so the identifier is backed by this notice.
    install -Dm644 "$srcdir/LicenseRef-OpenAI-Terms" \
        "$pkgdir/usr/share/licenses/$pkgname/LicenseRef-OpenAI-Terms"
}
