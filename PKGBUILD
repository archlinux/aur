# Maintainer: David Mulder <dmulder@suse.com>
pkgname=himmelblau-git
_reponame=himmelblau
pkgver=r2187.1f848d27
pkgrel=1
pkgdesc="Entra ID / Azure AD authentication for Linux (PAM, NSS, broker, SSO)"
arch=('x86_64' 'aarch64')
url="https://github.com/himmelblau-idm/himmelblau"
license=('GPL-3.0-or-later')
depends=(
    'dbus'
    'krb5'
    'libcap'
    'openssl'
    'pam'
    'sqlite'
    'systemd'
    'systemd-libs'
)
optdepends=(
    'tpm2-tss: TPM 2.0 hardware security module support'
    'openssh: SSH certificate authentication'
)
makedepends=(
    'cargo'
    'clang'
    'cmake'
    'libunistring'
    'pcre2'
    'pkgconf'
    'python'
)
provides=('aad-cli' 'authd-msentraid' 'linux-entra-sso' 'intune-portal')
backup=('etc/himmelblau/himmelblau.conf')
source=("git+https://github.com/himmelblau-idm/himmelblau")
sha256sums=('SKIP')

pkgver() {
    cd "${_reponame}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_reponame}"

    # Generate systemd unit files with directives appropriate for Arch Linux.
    # Arch ships systemd 254+ so we pin to 254 to get all modern directives
    # (TypeNotifyReload, DynamicUser, ProtectHostname, etc.) without
    # requiring a live systemd-detect-virt call inside the build environment.
    python3 scripts/gen_servicefiles.py --out-dir ./platform/opensuse/ --assume-version 254

    CC=clang CXX=clang++ cargo build \
        --release \
        --target "${CARCH}-unknown-linux-gnu"
}

package() {
    cd "${_reponame}"
    local _t="target/${CARCH}-unknown-linux-gnu/release"

    # ── Binaries ──────────────────────────────────────────────────────────────
    install -Dm755 "${_t}/aad-tool"          "${pkgdir}/usr/bin/aad-tool"
    install -Dm755 "${_t}/himmelblaud"        "${pkgdir}/usr/bin/himmelblaud"
    install -Dm755 "${_t}/himmelblaud_tasks"  "${pkgdir}/usr/bin/himmelblaud_tasks"
    install -Dm755 "${_t}/broker"             "${pkgdir}/usr/bin/himmelblau_broker"
    install -Dm755 "${_t}/linux-entra-sso"    "${pkgdir}/usr/bin/linux-entra-sso"

    # ── Init helper ───────────────────────────────────────────────────────────
    install -Dm755 src/daemon/scripts/himmelblau-init-hsm-pin \
        "${pkgdir}/usr/libexec/himmelblau-init-hsm-pin"

    # ── NSS library ───────────────────────────────────────────────────────────
    install -Dm755 "${_t}/libnss_himmelblau.so" \
        "${pkgdir}/usr/lib/libnss_himmelblau.so.2"

    # ── PAM module ────────────────────────────────────────────────────────────
    install -Dm755 "${_t}/libpam_himmelblau.so" \
        "${pkgdir}/usr/lib/security/pam_himmelblau.so"

    # ── Systemd system units ──────────────────────────────────────────────────
    install -Dm644 platform/opensuse/himmelblaud.service \
        "${pkgdir}/usr/lib/systemd/system/himmelblaud.service"
    install -Dm644 platform/opensuse/himmelblaud-tasks.service \
        "${pkgdir}/usr/lib/systemd/system/himmelblaud-tasks.service"
    install -Dm644 platform/opensuse/himmelblau-hsm-pin-init.service \
        "${pkgdir}/usr/lib/systemd/system/himmelblau-hsm-pin-init.service"
    install -Dm644 src/config/gdm3_service_override.conf \
        "${pkgdir}/usr/lib/systemd/system/display-manager.service.d/himmelblau-gdm-override.conf"

    # ── Systemd user unit (broker) ────────────────────────────────────────────
    install -Dm644 src/broker/platform/himmelblau-broker.service \
        "${pkgdir}/usr/lib/systemd/user/himmelblau-broker.service"

    # ── D-Bus activation service ──────────────────────────────────────────────
    install -Dm644 src/broker/platform/com.microsoft.identity.broker1.service \
        "${pkgdir}/usr/share/dbus-1/services/com.microsoft.identity.broker1.service"

    # ── Configuration ─────────────────────────────────────────────────────────
    install -Dm644 target/config/himmelblau.conf.example \
        "${pkgdir}/etc/himmelblau/himmelblau.conf"

    # ── tmpfiles.d ────────────────────────────────────────────────────────────
    install -Dm644 src/daemon/src/himmelblaud.tmpfiles.conf \
        "${pkgdir}/usr/lib/tmpfiles.d/himmelblaud.conf"
    install -Dm644 src/daemon/src/himmelblau-policies.tmpfiles.conf \
        "${pkgdir}/usr/lib/tmpfiles.d/himmelblau-policies.conf"
    install -Dm644 src/nss/src/nss-himmelblau.tmpfiles.conf \
        "${pkgdir}/usr/lib/tmpfiles.d/nss-himmelblau.conf"

    # ── Browser SSO (native messaging hosts) ──────────────────────────────────
    install -Dm644 src/sso/src/firefox/linux_entra_sso.json \
        "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/linux_entra_sso.json"
    install -Dm644 src/sso/src/chrome/linux_entra_sso.json \
        "${pkgdir}/etc/opt/chrome/native-messaging-hosts/linux_entra_sso.json"
    install -Dm644 src/sso/src/chrome/linux_entra_sso.json \
        "${pkgdir}/etc/chromium/native-messaging-hosts/linux_entra_sso.json"

    # ── Browser SSO policies ──────────────────────────────────────────────────
    install -Dm644 src/sso-policies/src/chrome/policies.json \
        "${pkgdir}/etc/opt/chrome/policies/managed/himmelblau.json"
    install -Dm644 src/sso-policies/src/chrome/policies.json \
        "${pkgdir}/etc/chromium/policies/managed/himmelblau.json"

    # ── Man pages ─────────────────────────────────────────────────────────────
    install -Dm644 man/man1/aad-tool.1         "${pkgdir}/usr/share/man/man1/aad-tool.1"
    install -Dm644 man/man5/himmelblau.conf.5  "${pkgdir}/usr/share/man/man5/himmelblau.conf.5"
    install -Dm644 man/man8/himmelblaud.8      "${pkgdir}/usr/share/man/man8/himmelblaud.8"
    install -Dm644 man/man8/himmelblaud_tasks.8 \
        "${pkgdir}/usr/share/man/man8/himmelblaud_tasks.8"

    # ── Documentation ─────────────────────────────────────────────────────────
    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${_reponame}/README.md"
    install -Dm644 target/config/himmelblau.conf.example \
        "${pkgdir}/usr/share/doc/${_reponame}/himmelblau.conf.example"
}
