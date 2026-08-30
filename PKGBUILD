# Maintainer: musqz <gummy-fang-deputy@duck.com>
pkgname=archcanary
pkgver=0.1.32
pkgrel=1
pkgdesc="Layered security detection stack for Arch Linux — malicious AUR packages, systemd/eBPF persistence, npm/bun cache poisoning, kernel module tampering"
arch=('any')
url="https://github.com/musqz/archcanary"
license=('MIT')
depends=('bash' 'pacman')
optdepends=(
  'libnotify: desktop alerts on infected scan result'
  'polkit: privileged remediation commands (allowlist edits, audit-rules/lynis-config writes)'
  'bpf: bpftool for eBPF rootkit detection'
  'yay: AUR helper with Lua hook support'
  'paru: AUR helper with PreBuildCommand hook support'
  'bash-completion: tab-completion for archcanary/canary flags'
)
backup=('etc/archcanary/dkms_allowlist.conf'
        'etc/archcanary/systemd_allowlist.conf'
        'etc/archcanary/bpftool_allowlist.conf'
        'etc/archcanary/autostart_allowlist.conf')
install=archcanary.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/musqz/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('61f49e8ef54ad7bb2465d8d99f14af63ba2a68dfdb03f834cf535eb0746ec15e')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Stamp the real version into the placeholder install.sh normally sed's at
  # install time — package() bypasses install.sh entirely, so without this
  # every installed copy keeps the literal "@VERSION@" and --version shows
  # "unknown".
  sed -i "s/@VERSION@/$pkgver/" archcanary.sh
  sed -i "s/@VERSION@/$pkgver/" man/archcanary.1

  # Main user-facing binary
  install -Dm755 archcanary.sh    "$pkgdir/usr/bin/archcanary"

  # Interactive terminal menu (replaces the removed yad GUI)
  install -Dm755 archcanary-tui.sh "$pkgdir/usr/bin/archcanary-tui"

  # Desktop entry launching the interactive menu
  install -Dm644 configs/archcanary.desktop \
    "$pkgdir/usr/share/applications/archcanary.desktop"

  # Man page
  install -Dm644 man/archcanary.1 "$pkgdir/usr/share/man/man1/archcanary.1"

  # Bash completion (archcanary + canary alias)
  install -Dm644 configs/archcanary-completion.bash \
    "$pkgdir/usr/share/bash-completion/completions/archcanary"
  ln -sf archcanary "$pkgdir/usr/share/bash-completion/completions/canary"

  # System lib: scanner + root helper + threat lists (used by the root scan)
  install -dm755 "$pkgdir/usr/lib/archcanary"
  install -m755  archcanary.sh         "$pkgdir/usr/lib/archcanary/archcanary.sh"
  install -m755  lib/archcanary-root-helper "$pkgdir/usr/lib/archcanary/root-helper"
  for _list in package_list.txt malicious_npm_packages.txt \
               chaos_rat_packages.txt malicious_russian_spam_packages.txt \
               community_reports.txt; do
    install -Dm644 "lists/$_list" "$pkgdir/usr/lib/archcanary/$_list"
  done
  install -Dm644 configs/lynis-custom.prf \
    "$pkgdir/usr/lib/archcanary/lynis-custom.prf"
  install -Dm644 configs/audit-rules.conf \
    "$pkgdir/usr/lib/archcanary/audit-rules.conf"
  # yay Lua hook template — read-only reference copy, never installed to
  # ~/.config/yay/init.lua automatically (that's a per-user path a pacman
  # transaction can't reach, and hooks are opt-in either way). Lets an
  # AUR-only install (no git clone) still have something to `cp`; see
  # `archcanary --doctor`.
  install -Dm644 configs/yay-init.lua \
    "$pkgdir/usr/lib/archcanary/yay-init.lua"

  # Polkit policy (authorises root-helper via pkexec)
  install -Dm644 configs/org.archcanary.policy \
    "$pkgdir/usr/share/polkit-1/actions/org.archcanary.policy"

  # Systemd system units (root scan: weekly timer + pacman-triggered path;
  # scan-all-homes: opt-in weekly sweep of every real local user's home)
  for _unit in systemd/system/archcanary.service \
               systemd/system/archcanary.timer \
               systemd/system/archcanary.path \
               systemd/system/archcanary-onchange.service \
               systemd/system/archcanary-scan-all-homes.service \
               systemd/system/archcanary-scan-all-homes.timer; do
    install -Dm644 "$_unit" "$pkgdir/usr/lib/systemd/system/$(basename "$_unit")"
  done

  # Systemd user units (user-scope scan + result notifier)
  for _unit in systemd/user/archcanary-user.service \
               systemd/user/archcanary-user.timer \
               systemd/user/archcanary-notify.path \
               systemd/user/archcanary-notify.service; do
    install -Dm644 "$_unit" "$pkgdir/usr/lib/systemd/user/$(basename "$_unit")"
  done

  # Allowlists — seeded as commented templates; users edit in place. pacman's
  # backup=() array (see above) preserves local edits across upgrades.
  install -dm755 "$pkgdir/etc/archcanary"
  cat > "$pkgdir/etc/archcanary/dkms_allowlist.conf" << 'EOF'
# DKMS modules to skip during --check-kmod (system-wide allowlist).
# One module name per line. Everything after # is a comment.
# Add modules that are known-good but not tracked by pacman.
#
# Common examples (uncomment as needed):
# tuxedo-drivers  # TUXEDO Computers hardware driver
# v4l2loopback    # virtual camera (OBS, video conferencing)
# vboxdrv         # VirtualBox host kernel module
# vmmon           # VMware Workstation
EOF

  cat > "$pkgdir/etc/archcanary/systemd_allowlist.conf" << 'EOF'
# systemd units to skip during the systemd persistence check (--check-systemd),
# system-wide allowlist. One unit name per line. Everything after # is a comment.
# Add units that are known-good but not tracked by pacman and not vetted by the
# standard-prefix check (e.g. a self-hosted app installed from an upstream
# binary release rather than a package). A .timer is matched by its OWN name,
# not its target .service — allowlist both if you want to silence both findings.
#
# Example:
# forgejo.service  # self-hosted git, installed from upstream binary release
# forgejo.timer    # only needed if forgejo also ships a persistent timer
EOF

  cat > "$pkgdir/etc/archcanary/bpftool_allowlist.conf" << 'EOF'
# eBPF loader binaries to skip during the bpftool LSM-loader check
# (--check-bpftool), system-wide allowlist. One binary basename per line.
# Everything after # is a comment.
# Add loaders that are known-good but not pacman-owned (a self-built or
# manually-installed security/monitoring tool that legitimately loads LSM
# eBPF hooks) — matched against the basename of /proc/<pid>/exe.
#
# Example:
# falco  # runtime security monitoring, installed from upstream binary release
EOF

  cat > "$pkgdir/etc/archcanary/autostart_allowlist.conf" << 'EOF'
# Names to skip during the XDG autostart check (--check-autostart),
# system-wide allowlist. One entry per line. Everything after # is a
# comment. Covers two separate findings within the same check, each with
# its own matching rule:
#
# 1. .desktop Exec= names that are known-good but can't be resolved via
#    $PATH or a standard system prefix — e.g. a package-private helper
#    binary the non-PATH fallback (search of /usr/lib, /usr/libexec) still
#    can't find, or an AppImage/Flatpak export. Matched against the bare
#    Exec= value exactly as written in the .desktop file (not a resolved
#    path) — usually just a command name.
#
# 2. User systemd service ExecStart= binaries unowned by pacman. Matched
#    against the ExecStart binary's exact, full path (NOT its basename —
#    a basename match would let an unrelated binary sharing that name
#    anywhere on disk slip through undetected). Useful for a package that
#    ships its user unit via /etc/skel (copied into ~/.config/systemd/user/
#    at account creation, so pacman never tracks that specific copy even
#    though the binary itself is a normal pacman-owned file).
#
# Examples:
# zeitgeist-datahub               # desktop activity logging, ships in a non-PATH libdir
# /usr/bin/eos-update-notifier    # EndeavourOS update notifier, user unit ships via /etc/skel
EOF
}
