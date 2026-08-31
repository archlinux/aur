# Maintainer: Zadkiel AHARONIAN <hello@zadkiel.fr>
# Repository: https://github.com/aslafy-z/aur-packages

# Built from a rolling main branch, since upstream publishes neither releases
# nor tags.
#
# pkgver carries the ChatGPT app version on its own, and is the value Renovate
# bumps. A pkgver() alone would not be enough: it only ever runs when somebody
# rebuilds, so an installed copy is never told a newer app exists. Bumping this
# line is what publishes an AUR revision that helpers surface to users, while
# pkgver() below still stamps each build with what it actually produced.
pkgname=codex-desktop-git
pkgver=26.825.51511.r2062.g241435e5 # renovate: datasource=deb depName=codex-desktop packageName=chatgpt registryUrl=https://persistent.oaistatic.com/codex-app-prod/linux/deb?suite=stable&components=main&binaryArch=amd64
pkgrel=1
pkgdesc="Unofficial ChatGPT desktop repackaged from OpenAI's official Linux build (ilysenko/codex-desktop-linux)"
arch=('x86_64')
url='https://github.com/ilysenko/codex-desktop-linux'
# MIT covers the Linux repackaging. The app payload install.sh downloads is
# OpenAI's official Linux package, fetched from their signed APT repository
# rather than redistributed here, and is not covered by that MIT grant.
license=('MIT' 'LicenseRef-OpenAI-Terms')
depends=(
    'bash'
    'xdg-utils'
    'hicolor-icon-theme'
    # Electron runtime libraries: the Depends field of the official deb, which
    # ships in the payload as .codex-linux/upstream-package/control, mapped to
    # Arch names. That field is authoritative where namcap is blind: Electron
    # only dlopens libdrm, libglvnd, libnotify, libusb and xz, so namcap calls
    # them unneeded. at-spi2-core is the package that provides the atk the deb
    # names. gcc-libs and glibc are the direct links namcap reports. polkit,
    # curl, dpkg, gnupg and nodejs serve only codex-update-manager, and
    # package() stages the payload with PACKAGE_WITH_UPDATER=0, so nothing in
    # it runs the updater.
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'libcups'
    'libdrm'
    'libglvnd'
    'libnotify'
    'libusb'
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
    'xz'
)
makedepends=(
    'git'
    # install.sh check_deps requires node, curl, dpkg-deb, gpg and gpgv: the
    # official payload is resolved from OpenAI's signed stable APT index and
    # extracted from the deb it names.
    'curl'
    'dpkg'
    'gnupg'
    'nodejs'
    # The transactional candidate promotion in install.sh runs
    # scripts/lib/candidate-promotion.py, and pkgver() reads build-info.json.
    'python'
)
optdepends=(
    'git: project source control integration'
    'pulseaudio: audio integration'
    'apparmor: confine the ChatGPT binary with the shipped profile'
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

    # install.sh fetches OpenAI's official Linux deb from their signed APT
    # repository, verifies it, and stages the patched app tree here.
    export CODEX_INSTALL_DIR="$srcdir/codex-app"

    ./install.sh
}

# Reports the version of the app that was actually built, from the deb Version
# install.sh recorded for the official Linux package it downloaded.
#
# Deliberately does not derive from $pkgver: makepkg rewrites the pkgver= line
# with whatever this returns, so appending to the previous value would compound
# the .rN.gSHA suffix on every rebuild. The pkgver= line above stays the ChatGPT
# app version alone, which is what Renovate bumps and what reaches users as an
# AUR revision; makepkg's rewrite preserves its trailing annotation.
pkgver() {
    local _appver
    _appver=$(python -c '
import json, sys
version = json.load(open(sys.argv[1]))["upstreamLinuxPackage"]["version"]
if not version:
    raise SystemExit("build-info.json recorded no upstreamLinuxPackage.version")
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
