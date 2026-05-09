# Maintainer: JamesFromFL <jamesfromfl@penguinmail.com>

pkgname=mykey
pkgver=0.1.0
pkgrel=1
pkgdesc="Hardware-focused local authentication, Secret Service, and tray stack for Linux"
arch=('x86_64')
url="https://github.com/JamesFromFL/mykey"
license=('MIT')
depends=(
  'dbus'
  'pam'
  'polkit'
  'systemd'
  'tpm2-tss'
)
optdepends=(
  'fprintd: fingerprint enrollment and runtime biometric authentication'
  'howdy: face biometric authentication backend (AUR)'
  'pam-u2f: security-key enrollment and security-key authentication testing'
)
makedepends=(
  'cargo'
  'clang'
  'pkgconf'
  'rust'
)
provides=('mykey')
conflicts=('mykey-git')
install='mykey.install'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('03d34e72ace540078023dad9655f9bc86ff73a5b4db5268f467dbbb28f03f4c2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CARGO_TARGET_DIR="${srcdir}/target"

  cargo build --manifest-path mykey-daemon/Cargo.toml --features tpm2 --release
  cargo build --manifest-path mykey/Cargo.toml --release
  cargo build --manifest-path mykey-tray/Cargo.toml --release
  cargo build --manifest-path mykey-secrets/Cargo.toml --release
  cargo build --manifest-path mykey-migrate/Cargo.toml --release
  cargo build --manifest-path mykey-auth/mykey-pin/Cargo.toml --release
  cargo build --manifest-path mykey-auth/mykey-pam/Cargo.toml --release
  cargo build --manifest-path mykey-auth/mykey-security-key/Cargo.toml --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/lib/mykey"
  install -dm755 "${pkgdir}/usr/lib/security"
  install -dm755 "${pkgdir}/etc/pam.d"
  install -dm755 "${pkgdir}/usr/lib/systemd/system"
  install -dm755 "${pkgdir}/usr/lib/systemd/user"
  install -dm755 "${pkgdir}/usr/share/libalpm/hooks"
  install -dm755 "${pkgdir}/usr/share/polkit-1/actions"
  install -dm755 "${pkgdir}/usr/share/dbus-1/system.d"
  install -dm755 "${pkgdir}/usr/lib/sysusers.d"
  install -dm755 "${pkgdir}/usr/lib/tmpfiles.d"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm755 "${srcdir}/target/release/mykey-daemon" \
    "${pkgdir}/usr/bin/mykey-daemon"
  install -Dm755 "${srcdir}/target/release/mykey" \
    "${pkgdir}/usr/bin/mykey"
  install -Dm755 "${srcdir}/target/release/mykey-tray" \
    "${pkgdir}/usr/bin/mykey-tray"
  install -Dm755 "${srcdir}/target/release/mykey-secrets" \
    "${pkgdir}/usr/bin/mykey-secrets"
  install -Dm755 "${srcdir}/target/release/mykey-migrate" \
    "${pkgdir}/usr/bin/mykey-migrate"
  install -Dm755 "${srcdir}/target/release/mykey-pin" \
    "${pkgdir}/usr/bin/mykey-pin"
  install -Dm755 "${srcdir}/target/release/mykey-pin-auth" \
    "${pkgdir}/usr/bin/mykey-pin-auth"
  install -Dm755 "${srcdir}/target/release/mykey-auth" \
    "${pkgdir}/usr/bin/mykey-auth"
  install -Dm755 "${srcdir}/target/release/mykey-elevated-auth" \
    "${pkgdir}/usr/bin/mykey-elevated-auth"
  install -Dm755 "${srcdir}/target/release/mykey-security-key" \
    "${pkgdir}/usr/bin/mykey-security-key"
  install -Dm755 "${srcdir}/target/release/mykey-security-key-auth" \
    "${pkgdir}/usr/bin/mykey-security-key-auth"

  install -Dm755 "${srcdir}/target/release/libmykeypin.so" \
    "${pkgdir}/usr/lib/security/mykeypin.so"
  install -Dm755 "${srcdir}/target/release/libpam_mykey.so" \
    "${pkgdir}/usr/lib/security/pam_mykey.so"
  install -Dm644 scripts/mykey-elevated-auth.pam \
    "${pkgdir}/etc/pam.d/mykey-elevated-auth"
  install -Dm644 scripts/mykey-security-key-auth.pam \
    "${pkgdir}/etc/pam.d/mykey-security-key-auth"

  install -Dm644 scripts/mykey-daemon.service \
    "${pkgdir}/usr/lib/systemd/system/mykey-daemon.service"
  install -Dm644 scripts/mykey-secrets.service \
    "${pkgdir}/usr/lib/systemd/user/mykey-secrets.service"
  install -Dm644 scripts/mykey-tray.service \
    "${pkgdir}/usr/lib/systemd/user/mykey-tray.service"

  install -Dm644 scripts/com.mykey.Daemon.conf \
    "${pkgdir}/usr/share/dbus-1/system.d/com.mykey.Daemon.conf"
  install -Dm644 scripts/com.mykey.authenticate.policy \
    "${pkgdir}/usr/share/polkit-1/actions/com.mykey.authenticate.policy"
  install -Dm644 packaging/arch/mykey.sysusers \
    "${pkgdir}/usr/lib/sysusers.d/mykey.conf"
  install -Dm644 packaging/arch/mykey.tmpfiles \
    "${pkgdir}/usr/lib/tmpfiles.d/mykey.conf"
  install -Dm755 packaging/arch/mykey-post-transaction.sh \
    "${pkgdir}/usr/lib/mykey/arch-package-hook"
  install -Dm644 packaging/arch/90-mykey-post-install.hook \
    "${pkgdir}/usr/share/libalpm/hooks/90-mykey-post-install.hook"
  install -Dm644 packaging/arch/90-mykey-post-upgrade.hook \
    "${pkgdir}/usr/share/libalpm/hooks/90-mykey-post-upgrade.hook"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
