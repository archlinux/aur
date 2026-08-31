# Maintainer: bermudi <github.igizp@dabg.uk>
# Contributor: Luiz Silva <luizsv.dev@gmail.com>
# Contributor: Webarch <contact@webarch.ro>
# Auto-updated by GitHub Actions (see .github/workflows/devin-desktop.yml)

pkgname=devin-desktop
pkgver=3.8.20
pkgrel=1
pkgdesc="A team of agents for every engineer — Devin Desktop"
arch=('x86_64')
url="https://devin.ai/desktop"
license=('LicenseRef-Devin Desktop')

# APT repository configuration (stable channel).
# Update workflow rewrites pkgver, the first sha256sums entry, and (if it
# changes) _apt_pool. Everything else here is static — do not hand-merge this
# file from a template.
_apt_base="https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt"
_apt_pool="pool/main/d/devin-desktop"
_upstream_ver="${pkgver}" # stable versions carry no channel suffix
_debfile="Devin-linux-x64-${_upstream_ver}.deb"

depends=(
    'electron42'
    'glibc'
    'gtk3'
    'libglvnd'
    'vulkan-driver'
    'alsa-lib'
    'libsecret'
    'libxss'
    'libxkbfile'
    'libnotify'
    'ripgrep'
    'fd'
    'xdg-utils'
)
makedepends=()
optdepends=(
    'bash-completion: for bash shell completions'
    'zsh: for zsh shell completions'
)
options=('!strip' '!debug')

source=(
    "${pkgname}-${pkgver}.deb::${_apt_base}/${_apt_pool}/${_debfile}"
    'devin-desktop.desktop'
    'devin-desktop-url-handler.desktop'
    'devin-desktop.sh'
)

sha256sums=(
    '9036621091ac37ce5344689dc23a77ed3d6022018f60aec5a274d8b4a9919a28'
    '74b6568385dbcbb8c0f118bd81c526ab019f91726dd7b7b15742c1ac0228cd13'
    '9fffea94a75faca248102cd830508932a674f469c1b42d48e2387db45b81cb33'
    'a6d17d4f506181b3061dbdc882e258ca494a5f84636694bba1742c3a8c7f1c5e'
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
    for _candidate in "usr/share/devin-desktop" "usr/share/windsurf"; do
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
        _electron_major=$(strings "$_installdir/devin-desktop" | sed -n 's|Electron/\([0-9]\+\).*|\1|p' | head -1)
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
    for _candidate in "usr/share/devin-desktop" "usr/share/windsurf"; do
        if [[ -d "$_candidate" ]]; then
            _installdir="$_candidate"
            break
        fi
    done
    if [[ -z "$_installdir" || ! -d "$_installdir" ]]; then
        echo "Error: Installation directory not found!" >&2
        return 1
    fi

    # AppStream metadata and MIME registration shipped in the deb.
    if [[ -f "usr/share/appdata/$pkgname.appdata.xml" ]]; then
        install -Dm644 "usr/share/appdata/$pkgname.appdata.xml" \
            "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
    fi
    if [[ -f "usr/share/mime/packages/$pkgname-workspace.xml" ]]; then
        install -Dm644 "usr/share/mime/packages/$pkgname-workspace.xml" \
            "$pkgdir/usr/share/mime/packages/$pkgname-workspace.xml"
    fi

    # Copy app resources to /opt/<pkgname>
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -a "$_installdir"/. "$pkgdir/opt/$pkgname/"

    # Strip bundled Electron runtime — keep only resources/ (the app).
    cd "$pkgdir/opt/$pkgname"
    find . -mindepth 1 -maxdepth 1 -not -name resources -exec rm -rf {} +
    cd "$srcdir/deb-extract/data"

    # Replace the bundled ripgrep with the system binary. VS Code moved it to
    # ripgrep-universal in 3.6; retain the prior layout for older releases.
    local _ripgrep_binary _candidate
    for _candidate in \
        "node_modules/@vscode/ripgrep-universal/bin/linux-x64/rg" \
        "node_modules/@vscode/ripgrep/bin/rg"; do
        if [[ -f "$pkgdir/opt/$pkgname/resources/app/$_candidate" ]]; then
            _ripgrep_binary="$_candidate"
            break
        fi
    done
    if [[ -z "$_ripgrep_binary" ]]; then
        error "bundled ripgrep binary not found in a supported upstream layout"
        return 1
    fi
    ln -sf /usr/bin/rg "$pkgdir/opt/$pkgname/resources/app/$_ripgrep_binary"

    # Replace bundled fd (windsurf extension) and xdg-open with system
    # binaries when upstream ships them.
    if [[ -f "$pkgdir/opt/$pkgname/resources/app/extensions/windsurf/bin/fd" ]]; then
        ln -sf /usr/bin/fd "$pkgdir/opt/$pkgname/resources/app/extensions/windsurf/bin/fd"
    else
        echo "Note: no bundled fd found; skipping system-fd symlink" >&2
    fi
    if [[ -f "$pkgdir/opt/$pkgname/resources/app/node_modules/open/xdg-open" ]]; then
        ln -sf /usr/bin/xdg-open "$pkgdir/opt/$pkgname/resources/app/node_modules/open/xdg-open"
    else
        echo "Note: no bundled xdg-open found; skipping system-xdg-open symlink" >&2
    fi

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
    for _icon in "devin.png" "devin-desktop.png" "code.png"; do
        if [[ -f "$pkgdir/opt/$pkgname/resources/app/resources/linux/$_icon" ]]; then
            install -Dm644 "$pkgdir/opt/$pkgname/resources/app/resources/linux/$_icon" \
                "$pkgdir/usr/share/pixmaps/$pkgname.png"
            break
        fi
    done

    # Drift assertion: if upstream bumps the Electron major, fail loudly
    # instead of shipping a broken package.  Bump the electron entry in
    # depends above when this fires.
    local _electron_dep
    _electron_dep=$(cat "$srcdir/.electron-dep" 2>/dev/null)
    if [[ -n "$_electron_dep" ]] && ! printf '%s\n' "${depends[@]}" | grep -qxF "$_electron_dep"; then
        error "upstream now requires %s; bump the electron entry in PKGBUILD depends" "$_electron_dep"
        return 1
    fi
}
