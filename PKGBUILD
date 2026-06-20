# Maintainer: Webarch <contact@webarch.ro>
# Auto-updated by GitHub Actions (see .github/workflows/devin-desktop-next.yml)

pkgname=devin-desktop-next
pkgver=3.3.1009_next.1d521e1d44
pkgrel=1
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
    'ffmpeg'
    'glibc'
    'libglvnd'
    'gtk3'
    'alsa-lib'
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
)

sha256sums=(
    'af3b1c01c2bb019560853f008c14d358c1fda6b3e246d7bbb688d9c7c9bfb84e'
    'bc9e2c12080d88a97c30da3bc675fea68bb9a202ce58b48cccfede63c9e6b467'
    '115606abbe310c96631241b6ede64379cbeed11f45dfe24da5bee8b90136507c'
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

    # Copy all files to /opt/<pkgname>
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -a "$_installdir"/. "$pkgdir/opt/$pkgname/"

    # Create symlink for the executable in /usr/bin.
    install -dm755 "$pkgdir/usr/bin"
    if [[ -f "$pkgdir/opt/$pkgname/$pkgname" ]]; then
        ln -sf "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    else
        # Binary has a different name (e.g. after another rebrand) — find it.
        local _bin _binname
        _bin=$(find "$pkgdir/opt/$pkgname" -maxdepth 1 -type f -name 'devin-*' -executable | head -1)
        : "${_bin:=$(find "$pkgdir/opt/$pkgname" -maxdepth 1 -type f -name 'windsurf-*' -executable | head -1)}"
        _binname=$(basename "$_bin")
        if [[ -z "$_binname" ]]; then
            echo "Error: Could not find executable in $pkgdir/opt/$pkgname" >&2
            return 1
        fi
        ln -sf "$_binname" "$pkgdir/opt/$pkgname/$pkgname"
        ln -sf "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    fi

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

    # Fix permissions
    local _main_bin
    for _main_bin in "$pkgdir/opt/$pkgname/$pkgname" "$pkgdir/opt/$pkgname/devin-desktop-next"; do
        [[ -f "$_main_bin" ]] && chmod 755 "$_main_bin"
    done
    if [[ -f "$pkgdir/opt/$pkgname/chrome-sandbox" ]]; then
        chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"
    fi
}
