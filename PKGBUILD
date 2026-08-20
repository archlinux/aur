# Maintainer: Ujjwal <ujjwal@example.com>
pkgname=sysbackup-git
_pkgname=sysbackup
pkgver=1.0.0
pkgrel=1
pkgdesc="Advanced AI-powered system backup control plane using restic and rclone"
arch=('any')
url="https://github.com/Ujjwal-Devloper-5/SystemBackup"
license=('custom:CC-BY-NC-SA-4.0')
depends=('restic' 'rclone' 'jq' 'bc' 'python')
optdepends=(
    'gum: for interactive terminal UI dashboards'
    'fzf: for interactive file search in restore wizard'
    'libnotify: for desktop notifications'
    'xprintidle: for smart idle detection on X11'
)
provides=('sysbackup')
conflicts=('sysbackup')
install=sysbackup.install
source=("git+https://github.com/Ujjwal-Devloper-5/SystemBackup.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/SystemBackup"
    printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/SystemBackup"

    # Install binaries/runners
    install -Dm755 src/sysbackup-cli.sh "$pkgdir/usr/bin/sysbackup"
    install -Dm755 src/sysbackup.sh "$pkgdir/usr/bin/sysbackup.sh"
    install -Dm755 src/sysbackup-restore.sh "$pkgdir/usr/bin/sysbackup-restore.sh"

    # Install modules, helpers, and AI scripts
    install -d "$pkgdir/usr/lib/sysbackup/modules"
    install -m644 src/modules/*.sh "$pkgdir/usr/lib/sysbackup/modules/"

    install -d "$pkgdir/usr/lib/sysbackup/ai"
    install -m644 src/ai/*.sh "$pkgdir/usr/lib/sysbackup/ai/"

    install -d "$pkgdir/usr/lib/sysbackup/helpers"
    install -m644 src/helpers/*.py "$pkgdir/usr/lib/sysbackup/helpers/"
    
    install -m755 src/init-wizard.sh "$pkgdir/usr/lib/sysbackup/init-wizard.sh"

    # Install config files (Pacman backup configuration)
    install -d "$pkgdir/etc/sysbackup"
    install -m640 config/sysbackup.conf.example "$pkgdir/etc/sysbackup/sysbackup.conf.example"
    install -m640 config/exclude-home.txt "$pkgdir/etc/sysbackup/exclude-home.txt"
    install -m640 config/exclude-system.txt "$pkgdir/etc/sysbackup/exclude-system.txt"
    install -m640 config/importance.conf "$pkgdir/etc/sysbackup/importance.conf"

    # Install systemd unit files
    install -Dm644 systemd/sysbackup-home.service "$pkgdir/usr/lib/systemd/system/sysbackup-home.service"
    install -Dm644 systemd/sysbackup-home.timer "$pkgdir/usr/lib/systemd/system/sysbackup-home.timer"
    install -Dm644 systemd/sysbackup-system.service "$pkgdir/usr/lib/systemd/system/sysbackup-system.service"
    install -Dm644 systemd/sysbackup-system.timer "$pkgdir/usr/lib/systemd/system/sysbackup-system.timer"
    install -Dm644 systemd/sysbackup-monitor.service "$pkgdir/usr/lib/systemd/system/sysbackup-monitor.service"
    install -Dm644 systemd/sysbackup-monitor.timer "$pkgdir/usr/lib/systemd/system/sysbackup-monitor.timer"

    # Install sound assets
    install -d "$pkgdir/usr/share/sysbackup/sounds"
    if [ -d assets/sounds ] && [ "$(ls -A assets/sounds 2>/dev/null)" ]; then
        install -m644 assets/sounds/* "$pkgdir/usr/share/sysbackup/sounds/"
    fi

    # Create data/cache directories
    install -dm750 "$pkgdir/var/lib/sysbackup/data"
    install -dm750 "$pkgdir/var/lib/sysbackup/logs"
    install -dm700 "$pkgdir/var/lib/sysbackup/repos"
    install -dm750 "$pkgdir/var/lib/sysbackup/cache"
    install -dm750 "$pkgdir/var/lib/sysbackup/config"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Dynamically re-target script paths from /usr/local/ to /usr/ for Pacman compliance
    find "$pkgdir" -type f -exec sed -i 's|/usr/local/lib/sysbackup|/usr/lib/sysbackup|g' {} + 2>/dev/null || true
    find "$pkgdir" -type f -exec sed -i 's|/usr/local/bin/sysbackup|/usr/bin/sysbackup|g' {} + 2>/dev/null || true
}
