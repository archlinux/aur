# Maintainer: Hyprland Control Center <https://github.com/laosifu/Hyprland-Control-Center>
# Contributor: laosifu

pkgname=hcc-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="Hyprland Control Center — Install and manage Hyprland desktops"
arch=('any')
url="https://github.com/laosifu/Hyprland-Control-Center"
license=('GPL-3.0-only')
depends=('bash' 'git' 'curl' 'sudo')
optdepends=(
    'python: TOML config parser (faster than pure-bash)'
    'yay: AUR package installation'
    'paru: AUR package installation'
)
conflicts=('hcc-git')
provides=('hcc')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
install=hcc.install

package() {
    cd "$srcdir/Hyprland-Control-Center-$pkgver"

    # Install hcc entry point with system path detection
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/hcc" << 'HCC_EOF'
#!/usr/bin/env bash

set -euo pipefail

if [[ "$(dirname "${BASH_SOURCE[0]}")" == "/usr/bin" ]]; then
    PROJECT_ROOT="/usr/share/hcc"
else
    PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fi

if [[ "$(id -u)" -eq 0 && -n "${SUDO_USER:-}" ]]; then
    HCC_REAL_USER="$SUDO_USER"
    HCC_REAL_HOME="$(getent passwd "$SUDO_USER" 2>/dev/null | cut -d: -f6 || echo "/home/$SUDO_USER")"
    export HCC_REAL_USER HCC_REAL_HOME
fi

source "$PROJECT_ROOT/lib/bootstrap.sh"
source "$PROJECT_ROOT/services/bootstrap.sh"
source "$PROJECT_ROOT/modules/bootstrap.sh"
execution_set_command_context "$@"
source "$PROJECT_ROOT/lib/dispatcher.sh"

load_config
log_info "Starting HCC..."
VERSION="$(<"$PROJECT_ROOT/VERSION")"
command_context_set "$@"
dispatch_command "$@"
HCC_EOF
    chmod 755 "$pkgdir/usr/bin/hcc"

    install -Dm755 lib/launchers/session-launcher.sh \
        "$pkgdir/usr/lib/hcc/session-launcher"

    install -dm755 "$pkgdir/usr/share/hcc"
    cp -a desktops "$pkgdir/usr/share/hcc/desktops"
    cp -a lib "$pkgdir/usr/share/hcc/lib"
    cp -a services "$pkgdir/usr/share/hcc/services"
    cp -a operations "$pkgdir/usr/share/hcc/operations"
    cp -a modules "$pkgdir/usr/share/hcc/modules"
    cp -a plugins "$pkgdir/usr/share/hcc/plugins"
    cp -a themes "$pkgdir/usr/share/hcc/themes"
    cp -a handlers "$pkgdir/usr/share/hcc/handlers"
    cp -a VERSION "$pkgdir/usr/share/hcc/VERSION"
    cp -a docs "$pkgdir/usr/share/hcc/docs"
    cp -a completions "$pkgdir/usr/share/hcc/completions"

    # Install shell completions (bash)
    install -Dm644 completions/hcc.bash "$pkgdir/usr/share/bash-completion/completions/hcc"

    # Fix LOG_DIR to use user-writable path
    sed -i 's|LOG_DIR="\$PROJECT_ROOT/logs"|LOG_DIR="${HCC_LOG_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/hcc/logs}"|' \
        "$pkgdir/usr/share/hcc/lib/logger.sh"
}
