# Maintainer: Webarch <contact@webarch.ro>
# Auto-updated by GitHub Actions (see .github/workflows/devin-desktop-next.yml)

pkgname=devin-desktop-next
pkgver=3.5.1015_next.ee593c178a
pkgrel=2
pkgdesc="Devin Desktop (next channel) - AI-powered editor (formerly Windsurf Editor)"
arch=('x86_64')
url="https://docs.devin.ai"
license=('custom:Proprietary')

# APT repository configuration (next channel).
# Update workflow rewrites pkgver, the first sha256sums entry, and (if it
# changes) _apt_pool. Everything else here is static — do not hand-merge this
# file from a template.
_apt_base="https://windsurf-stable.codeiumdata.com/mQfcApCOdSLoWOSI/apt"
_apt_pool="pool/main/d/devin-desktop-next"
_upstream_ver="${pkgver//_/+}"
_debfile="Devin-linux-x64-${_upstream_ver}.deb"

depends=(
    'vulkan-driver'
    'glibc'
    'libglvnd'
    'gtk3'
    'alsa-lib'
    'ripgrep'
    'xdg-utils'
    'electron39'
)
makedepends=()
optdepends=(
    'bash-completion: for bash shell completions'
    'zsh: for zsh shell completions'
)
provides=("devin-desktop-next" "windsurf-next")
conflicts=("windsurf-next")
replaces=("windsurf-next")
options=('!strip' '!debug')

source=(
    "${pkgname}-${pkgver}.deb::${_apt_base}/${_apt_pool}/${_debfile}"
    'devin-desktop-next.desktop'
    'devin-desktop-next-url-handler.desktop'
    'devin-desktop-next.sh'
)

sha256sums=(
    'fa91619b421519683ec85cda2393729671b96966ac633163d0b63948d50f48dc'
    'bc9e2c12080d88a97c30da3bc675fea68bb9a202ce58b48cccfede63c9e6b467'
    '115606abbe310c96631241b6ede64379cbeed11f45dfe24da5bee8b90136507c'
    '4613d61e7d991d9a71298750f89f606597b399f134d5265d1044c69e0a38fd66'
)

prepare() {
    cd "$srcdir"

    # Clean up any previous extraction
    rm -rf deb-extract

    # Extract the .deb file (ar archive)
    mkdir -p deb-extract
    cd deb-extract
    ar x "../${pkgname}-${pkgver}.deb"

    # Extract the data archive (contains the actual files)
    mkdir -p data
    if [[ -f data.tar.xz ]]; then
        tar -xf data.tar.xz -C data
    elif [[ -f data.tar.zst ]]; then
        tar -xf data.tar.zst -C data
    elif [[ -f data.tar.gz ]]; then
        tar -xf data.tar.gz -C data
    fi
}

build() {
    cd "$srcdir/deb-extract/data"

    # The deb installs to usr/share/<name>/ — find the real install dir.
    local _installdir
    for _candidate in "usr/share/devin-desktop-next" "usr/share/windsurf-next"; do
        if [[ -d "$_candidate" ]]; then
            _installdir="$_candidate"
            break
        fi
    done
    if [[ -z "$_installdir" ]]; then
        _installdir=$(find usr/share -maxdepth 1 -type d -not -path "usr/share" | head -1)
    fi
    if [[ -z "$_installdir" || ! -d "$_installdir/resources/app" ]]; then
        echo "Error: Installation directory not found!" >&2
        return 1
    fi

    # Detect the Electron major version required by this release.
    # Primary: package.json devDependency.  Fallback: mine the bundled binary.
    local _electron_major
    _electron_major=$(sed -n '/"electron":/s/.*"electron": *"\{0,1\} *\([0-9]\+\).*/\1/p' "$_installdir/resources/app/package.json" | head -1)
    if [[ -z "$_electron_major" ]]; then
        _electron_major=$(strings "$_installdir/devin-desktop-next" | sed -n 's|Electron/\([0-9]\+\).*|\1|p' | head -1)
    fi
    if [[ -z "$_electron_major" ]]; then
        echo "Error: Could not detect Electron version from package.json or bundled binary" >&2
        return 1
    fi
    printf 'electron%s\n' "$_electron_major" > "$srcdir/.electron-dep"

    # Generate the launcher script with the correct Electron version.
    sed -e "s|@@ELECTRON@@|electron${_electron_major}|g" \
        "$srcdir/$pkgname.sh" > "$srcdir/launcher"
}

package() {
    cd "$srcdir/deb-extract/data"

    # The deb installs to usr/share/<name>/ — find the real install dir.
    local _installdir
    for _candidate in "usr/share/devin-desktop-next" "usr/share/windsurf-next"; do
        if [[ -d "$_candidate" ]]; then
            _installdir="$_candidate"
            break
        fi
    done
    if [[ -z "$_installdir" ]]; then
        _installdir=$(find usr/share -maxdepth 1 -type d -not -path "usr/share" | head -1)
    fi
    if [[ -z "$_installdir" || ! -d "$_installdir" ]]; then
        echo "Error: Installation directory not found!" >&2
        return 1
    fi

    # Copy app resources to /opt/<pkgname>
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -a "$_installdir"/. "$pkgdir/opt/$pkgname/"

    # Strip bundled Electron runtime — keep only resources/ (the app).
    cd "$pkgdir/opt/$pkgname"
    find . -mindepth 1 -maxdepth 1 -not -name resources -exec rm -rf {} +
    cd "$srcdir/deb-extract/data"

    # Replace bundled ripgrep with the system binary.
    ln -sf /usr/bin/rg "$pkgdir/opt/$pkgname/resources/app/node_modules/@vscode/ripgrep/bin/rg"

    # Install the launcher script as the main executable.
    install -Dm755 "$srcdir/launcher" "$pkgdir/opt/$pkgname/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop entries (patched to point at /opt)
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname-url-handler.desktop" "$pkgdir/usr/share/applications/$pkgname-url-handler.desktop"

    # Shell completions
    if [[ -f "$pkgdir/opt/$pkgname/resources/completions/bash/$pkgname" ]]; then
        install -Dm644 "$pkgdir/opt/$pkgname/resources/completions/bash/$pkgname" \
            "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    fi
    if [[ -f "$pkgdir/opt/$pkgname/resources/completions/zsh/_$pkgname" ]]; then
        install -Dm644 "$pkgdir/opt/$pkgname/resources/completions/zsh/_$pkgname" \
            "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    fi

    # Icon — try the known deb icon names
    local _icon
    for _icon in "code-next.png" "devin-next.png" "devin-desktop-next.png" "code.png"; do
        if [[ -f "$pkgdir/opt/$pkgname/resources/app/resources/linux/$_icon" ]]; then
            install -Dm644 "$pkgdir/opt/$pkgname/resources/app/resources/linux/$_icon" \
                "$pkgdir/usr/share/pixmaps/$pkgname.png"
            break
        fi
    done

    # Drift assertion: if upstream bumps the Electron major, fail loudly
    # instead of shipping a broken package.  Bump the electron39 entry in
    # depends above when this fires.
    local _electron_dep
    _electron_dep=$(cat "$srcdir/.electron-dep" 2>/dev/null)
    if [[ -n "$_electron_dep" ]] && ! printf '%s\n' "${depends[@]}" | grep -qxF "$_electron_dep"; then
        error "upstream now requires %s; bump the electron entry in PKGBUILD depends" "$_electron_dep"
        return 1
    fi
}
