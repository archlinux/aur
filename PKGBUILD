# SPDX-FileCopyrightText: 2026 Atay Özcan <atay@oezcan.me>
# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: Atay Özcan <atay@oezcan.me>
#
# BINARY package — installs prebuilt binaries from the GitHub release
# bundle (no source build). The bundle is produced reproducibly by
# `scripts/release-local.sh` and attached to the `v$pkgver` release.
# `sha256sums_*` are 'SKIP' in-repo and filled in by release-local.sh when
# it stages the PKGBUILD for the AUR push.
pkgname=sentinel-kde
pkgver=0.13.0
pkgrel=1
install=sentinel-kde.install
options=('!debug' '!strip')   # binaries are already stripped at link time
pkgdesc="UAC-style confirmation dialog for privilege escalation on KDE Plasma (Wayland)"
arch=('x86_64' 'aarch64')
url="https://github.com/atayozcan/sentinel"
license=('GPL-3.0-or-later')
depends=(
    'pam'
    'polkit'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'kirigami'
    'kirigami-addons'
    'layer-shell-qt'
    'plasma-workspace'   # org.kde.desktop QQuickStyle + breeze integration
    'libplasma'
    'wayland'
    'libxkbcommon'
    'fontconfig'
    'freetype2'
    'mesa'
    'vulkan-icd-loader'
    'gcc-libs'
    'glibc'
)
# No makedepends — this is a prebuilt package; nothing is compiled.
optdepends=(
    'sudo-rs: memory-safe sudo replacement'
    'libcanberra: UAC-style audio cue at dialog open'
)
provides=("polkit-kde-agent=$pkgver" "sentinel-kde=$pkgver")
conflicts=('polkit-kde-agent' 'sentinel' 'sentinel-git')
backup=('etc/security/sentinel.conf' 'etc/pam.d/polkit-1')

# Per-arch prebuilt bundles from the GitHub release (no build step).
_base="$url/releases/download/v$pkgver"
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$_base/sentinel-kde-$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$_base/sentinel-kde-$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('4c532334498cce09cd6ccfe8d7d20799f9a48856e3ee4565523ff3ec48dea4f3')
sha256sums_aarch64=('bde0a1df077ce4f3d3a2a4eeb2d5be84c431d6b60e6ba42b7bb6a73b1dddf438')

package() {
    cd "sentinel-kde-$pkgver"

    # --- binaries (prebuilt for $CARCH) ---
    install -Dm755 target/release/sentinel-helper-kde   "$pkgdir/usr/lib/sentinel-helper-kde"
    install -Dm755 target/release/sentinel-polkit-agent "$pkgdir/usr/lib/sentinel-polkit-agent"
    install -Dm755 target/release/sentinel-broker       "$pkgdir/usr/lib/sentinel-broker"
    # 0755 — libpam under a sandboxed PAM stack refuses to dlopen a .so
    # without the execute bit.
    install -Dm755 target/release/libpam_sentinel.so    "$pkgdir/usr/lib/security/pam_sentinel.so"

    # --- config + PAM ---
    install -Dm644 config/sentinel.conf "$pkgdir/etc/security/sentinel.conf"
    install -Dm644 config/polkit-1      "$pkgdir/etc/pam.d/polkit-1"
    # sudo/su are docs-only — auto-rewriting /etc/pam.d/sudo is a foot-gun.
    install -Dm644 config/sudo "$pkgdir/usr/share/doc/$pkgname/sudo"
    install -Dm644 config/su   "$pkgdir/usr/share/doc/$pkgname/su"

    # --- systemd: user agent unit (+ autostart) and the broker system unit ---
    install -Dm644 packaging-kde/packaging/systemd/user/sentinel-polkit-agent.service \
        "$pkgdir/usr/lib/systemd/user/sentinel-polkit-agent.service"
    install -d "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants"
    ln -s ../sentinel-polkit-agent.service \
        "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants/sentinel-polkit-agent.service"
    # @LIBEXEC@ → /usr/lib (where the broker binary lands above); the raw
    # template's literal @LIBEXEC@ makes systemd reject the unit.
    install -d "$pkgdir/usr/lib/systemd/system"
    sed 's#@LIBEXEC@#/usr/lib#' packaging/systemd/sentinel-broker.service \
        > "$pkgdir/usr/lib/systemd/system/sentinel-broker.service"
    chmod 644 "$pkgdir/usr/lib/systemd/system/sentinel-broker.service"

    # --- D-Bus policy + polkit admin rule ---
    install -Dm644 packaging-kde/packaging/dbus/org.sentinel.Agent.conf \
        "$pkgdir/usr/share/dbus-1/system.d/org.sentinel.Agent.conf"
    install -Dm644 packaging-kde/packaging/arch/49-sentinel-admin.rules \
        "$pkgdir/etc/polkit-1/rules.d/49-sentinel-admin.rules"

    # --- shell completions + man (pre-generated into the bundle) ---
    install -Dm644 target/release/share/sentinel-polkit-agent.bash \
        "$pkgdir/usr/share/bash-completion/completions/sentinel-polkit-agent"
    install -Dm644 target/release/share/sentinel-polkit-agent.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/sentinel-polkit-agent.fish"
    install -Dm644 target/release/share/_sentinel-polkit-agent \
        "$pkgdir/usr/share/zsh/site-functions/_sentinel-polkit-agent"
    install -Dm644 target/release/share/sentinel-polkit-agent.1 \
        "$pkgdir/usr/share/man/man1/sentinel-polkit-agent.1"
    install -Dm644 packaging-kde/packaging/man/sentinel.conf.5 \
        "$pkgdir/usr/share/man/man5/sentinel.conf.5"
    install -Dm644 packaging-kde/packaging/man/pam_sentinel.8 \
        "$pkgdir/usr/share/man/man8/pam_sentinel.8"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
