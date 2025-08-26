# -----------------------------------------------------------------------------
# author: damachine (christkue79@gmail.com)
# website: https://github.com/damachine
# copyright: (c) 2025 damachine
# license: MIT
# version: 1.0
#
# Info:
# 	CoolerDash PKGBUILD
#   Build system for CoolerDash (C99 LCD daemon)
# 	Project coding standards and packaging notes (see README for details)
# 	Maintainer: DAMACHINE <christkue79@gmail.com>
# Details:
#   This PKGBUILD handles build, install, dependencies, and packaging for Arch/AUR.
#   Edit dependencies, paths, and user as needed for your system.
#   Do not run as root. Use a dedicated user for security.
#   Ensure all required dependencies are installed.
#   It uses color output and Unicode icons for better readability. All paths and dependencies are configurable.
#   See README.md and AUR-README.md for further details.
# Example:
#   makepkg -si
#   makepkg -s
#   makepkg -c
#   makepkg -f
#
# --- Dependency notes ---
# -		'cairo', 'libcurl-gnutls', 'libinih', 'coolercontrol' are required for core functionality
# - 	'nvidia-utils' and 'lm_sensors' are optional for extended hardware monitoring
# - 	'ttf-roboto' is required for proper font rendering on the LCD
# - All dependencies are documented in README.md and AUR-README.md
# -----------------------------------------------------------------------------
pkgname=coolerdash-git
pkgver=1.25
pkgrel=1
provides=('coolerdash')
replaces=('coolerdash')
conflicts=('coolerdash')
pkgdesc="Extends CoolerControl with a polished LCD dashboard"
arch=('x86_64')
url="https://github.com/damachine/coolerdash"
license=('MIT')
depends=('cairo' 'coolercontrol' 'jansson' 'libcurl-gnutls' 'libinih' 'ttf-roboto')
makedepends=('gcc' 'make' 'pkg-config' 'git')
optdepends=()
backup=('etc/coolerdash/config.ini')
install=coolerdash.install
_tag=v1.25
source=("git+https://github.com/damachine/coolerdash.git#tag=$_tag")
sha256sums=('SKIP')
validpgpkeys=('160A147D7BFD360F41C4E52BC841EA18095F5D74')

prepare() {
    cd "$srcdir/coolerdash" || return 1

    # best-effort: try GitHub user .gpg first, then keyserver (no hard-fail)
    repo_user=$(printf "%s" "$url" | sed -n 's|https://github.com/\([^/]*\)/.*|\1|p')
    if [[ -n $repo_user ]]; then
        curl -fsSL "https://github.com/${repo_user}.gpg" | gpg --import >/dev/null 2>&1 || true
    fi

    for key in "${validpgpkeys[@]}"; do
        # if key present locally, good; otherwise warn (do not fail)
        if ! gpg --list-keys "$key" >/dev/null 2>&1; then
            # optional try keyserver as last resort (still non-fatal)
            gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys "$key" >/dev/null 2>&1 || true
            if ! gpg --list-keys "$key" >/dev/null 2>&1; then
                echo "WARNING: GPG key $key not available; tag verification will be skipped" >&2
            fi
        fi
    done

    # Only verify tag if it exists AND the key is available; otherwise warn and continue
    if git rev-parse --verify --quiet "refs/tags/$_tag" >/dev/null; then
        # check whether any validpgpkeys are available locally
        if gpg --list-keys "${validpgpkeys[@]}" >/dev/null 2>&1; then
            if ! git tag -v "$_tag" >/dev/null 2>&1; then
                echo "ERROR: git tag $_tag signature verification failed" >&2
                return 1
            fi
        else
            echo "WARNING: tag $_tag present but no matching GPG key available; skipping verification" >&2
        fi
    else
        echo "WARNING: $_tag is not a tag in this checkout; skipping tag signature verification" >&2
    fi
}

build() {
    echo "================================================================"
    echo '   .--.  '
    echo '  |o_o | '
    echo '  |:_/ | '
    echo ' //   \ \ '
    echo '(|     | ) '
    echo "/'\\_  _/' \\ "
    echo '\___)=(___/ '
    echo "  ____    _    __  __    _    ____ _   _ ___ _   _ _____ "
    echo " |  _ \  / \  |  \/  |  / \  / ___| | | |_ _| \ | | ____|"
    echo " | | | |/ _ \ | |\/| | / _ \| |   | |_| || ||  \| |  _|  "
    echo " | |_| / ___ \| |  | |/ ___ \ |___|  _  || || |\  | |___ "
    echo " |____/_/   \_\_|  |_/_/   \_\____|_| |_|___|_| \_|_____|"
    echo " "

    # Build inside the checked-out repository
    cd "$srcdir/coolerdash" || return 1

    # Remove all previous tarball builds from srcdir (avoid using $srcdir)
    rm -rf "$srcdir"/coolerdash-*.pkg.* || true

    # Clean any previous builds if a Makefile exists
    if [[ -f Makefile || -f GNUmakefile ]]; then
        make clean || true
    fi

    # Build
    make || return 1

    # Copy binary to $srcdir/bin for packaging
    mkdir -p "$srcdir/bin"
    cp -a bin/coolerdash "$srcdir/bin/coolerdash"

    # Copy all required files for packaging to $srcdir
    cp -a README.md "$srcdir/README.md"
    cp -a AUR-README.md "$srcdir/AUR-README.md"
    cp -a CHANGELOG.md "$srcdir/CHANGELOG.md"
    cp -a VERSION "$srcdir/VERSION"
    cp -a LICENSE "$srcdir/LICENSE"
    cp -a etc/coolerdash/config.ini "$srcdir/config.ini"
    mkdir -p "$srcdir/images"
    cp -a images/shutdown.png "$srcdir/images/shutdown.png"
    mkdir -p "$srcdir/systemd"
    cp -a etc/systemd/coolerdash.service "$srcdir/systemd/coolerdash.service"
    mkdir -p "$srcdir/man"
    cp -a man/coolerdash.1 "$srcdir/man/coolerdash.1"
    echo "================================================================"
}

check() {
    # Check in the checked-out repository
    cd "$srcdir/coolerdash" || return 1

    if [[ -f bin/coolerdash ]]; then
        echo "Build successful - binary created"
    else
        echo "ERROR: Binary not found"
        return 1
    fi
}

package() {
    # For local build: use current directory directly
    install -dm755 "$pkgdir/opt/coolerdash"
    install -Dm644 "$srcdir/AUR-README.md" "$pkgdir/opt/coolerdash/AUR-README.md"
    install -Dm644 "$srcdir/README.md" "$pkgdir/opt/coolerdash/README.md"
    install -Dm644 "$srcdir/VERSION" "$pkgdir/opt/coolerdash/VERSION"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/opt/coolerdash/LICENSE"
    install -Dm644 "$srcdir/CHANGELOG.md" "$pkgdir/opt/coolerdash/CHANGELOG.md"
    install -Dm644 "$srcdir/config.ini" "$pkgdir/etc/coolerdash/config.ini"
    install -dm755 "$pkgdir/opt/coolerdash/bin"
    install -Dm755 "$srcdir/bin/coolerdash" "$pkgdir/opt/coolerdash/bin/coolerdash"
    install -dm755 "$pkgdir/opt/coolerdash/images"
    install -Dm644 "$srcdir/images/shutdown.png" "$pkgdir/opt/coolerdash/images/shutdown.png"
    install -dm755 "$pkgdir/usr/bin"
    ln -sf /opt/coolerdash/bin/coolerdash "$pkgdir/usr/bin/coolerdash"
    install -Dm644 "$srcdir/systemd/coolerdash.service" "$pkgdir/etc/systemd/system/coolerdash.service"
    install -Dm644 "$srcdir/man/coolerdash.1" "$pkgdir/usr/share/man/man1/coolerdash.1"
}
