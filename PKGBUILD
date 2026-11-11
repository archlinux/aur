# Maintainer: Jeff Melton (AUR: JeffMelton)
# Maintainer: Marat Bakeev <hawara at gmail dot com>
# Contributor: David Mulder <dmulder@suse.com>
#
# Follows upstream's platform/arch/PKGBUILD at the release tag, building from
# the release archive instead of a git checkout, with these changes for the
# Arch package and Rust package guidelines:
# - direct library dependencies from readelf (adds libgcc and systemd-libs, drops
#   libunistring, which nothing links) and cargo as makedepends
# - RUSTUP_TOOLCHAIN/CARGO_TARGET_DIR exports for builds outside a chroot
# - the HSM PIN helper in /usr/lib/himmelblau instead of /usr/libexec
# - a package-specific name for the display-manager drop-in
# - every installed /etc file in backup, so local edits survive upgrades
# - service units generated for systemd 257 rather than the build host's
#   detected version, which falls back to weaker units (User=root) if detection
#   fails; 257 is the newest feature the generator checks for
# - tpm2-tools required, so the first HSM PIN setup can provision the TPM SRK:
#   the setup unit runs only until a credential exists, so a host-key-only
#   credential is never upgraded later
# - no Debian AppArmor fragments: untested on Arch, and the unix-chkpwd one
#   widens Arch's own profile (dac_override); the orchestrator they serve is
#   not built
# - PAM is not configured on install; the admin runs aad-tool configure-pam
# Upstream does not sign its tags, so the archive checksum is the integrity check.

pkgname=himmelblau
pkgver=4.0.8
pkgrel=2
pkgdesc="Azure Entra ID authentication for Linux (daemon, PAM, NSS, broker, SSO)"
arch=('x86_64' 'aarch64')
url="https://github.com/himmelblau-idm/himmelblau"
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'dbus'
  'glibc'
  'libgcc'
  'openssl'
  'pam'
  'sqlite'
  'systemd>=257'
  'systemd-libs'
  'tpm2-tools'
  'tpm2-tss'
)
makedepends=(
  'clang'
  'cmake'
  'gettext'
  'libcap'
  'pcre2'
  'cargo'
  'python'
)
# The qr-greeter tests run its JavaScript under node.
checkdepends=('nodejs')
# Mirrors the recommends and suggests the DEB and RPM packages declare.
optdepends=(
  'chromium: browser SSO via native messaging'
  'cronie: Intune policy scripts'
  'dconf: enables the QR greeter extension at install time'
  'firefox: browser SSO via native messaging'
  'gnome-shell: QR greeter extension'
  'google-chrome: browser SSO via native messaging'
  'krb5: Kerberos ticket support'
  'openssh: SSH logon with MFA'
)
# Single package: the DEB/RPM split has no equivalent on Arch, so the
# subpackage names are recorded as provides.
provides=(
  'himmelblau-broker'
  'himmelblau-qr-greeter'
  'himmelblau-sshd-config'
  'himmelblau-sso'
  'himmelblau-sso-policies'
  'linux-entra-sso'
  'nss-himmelblau'
  'pam-himmelblau'
)
backup=(
  'etc/chromium/native-messaging-hosts/linux_entra_sso.json'
  'etc/chromium/policies/managed/himmelblau.json'
  'etc/himmelblau/himmelblau.conf'
  'etc/opt/chrome/native-messaging-hosts/linux_entra_sso.json'
  'etc/opt/chrome/policies/managed/himmelblau.json'
  'etc/ssh/sshd_config.d/30-himmelblau.conf'
)
install=himmelblau.install
# !lto: LTO is configured by cargo, not CFLAGS.
# !debug: the release binaries are packaged stripped, as on the other distros.
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('49accdf01c314b1f79618758a08aa4dd219787b957290ea512c761aca892148e')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  python3 src/common/scripts/gen_param_code.py \
    --gen-man --man-output man/man5/himmelblau.conf.5

  python3 src/common/scripts/gen_param_code.py \
    --gen-conf-example \
    --conf-example-output target/config/himmelblau.conf.example \
    --xml-dir src/common/docs-xml/himmelblauconf

  python3 scripts/gen_servicefiles.py --out ./platform/opensuse/ --assume-version 257

  # `tpm` is defined by himmelblau_unix_common, so with an explicit package
  # selection it has to be requested as <crate>/<feature>.
  cargo build --release --frozen --features himmelblau_unix_common/tpm \
    -p aad-tool \
    -p broker \
    -p himmelblaud \
    -p nss_himmelblau \
    -p pam_himmelblau \
    -p qr-greeter \
    -p sso
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # test_cache_db_account_password opens /dev/tpmrm0 when built with the tpm
  # feature, which build hosts lack. Run it against the software TPM instead.
  cargo test --frozen --no-fail-fast --workspace --features himmelblau_unix_common/tpm -- \
    --skip db::tests::test_cache_db_account_password
  cargo test --frozen -p himmelblau_unix_common --lib -- \
    --exact db::tests::test_cache_db_account_password
}

package() {
  cd "$pkgname-$pkgver"

  # Daemon and CLI. Arch has no /usr/sbin, it is a symlink to /usr/bin, so the
  # /usr/sbin paths in the systemd units still resolve.
  install -Dm755 target/release/aad-tool "$pkgdir/usr/bin/aad-tool"
  install -Dm755 target/release/himmelblaud "$pkgdir/usr/bin/himmelblaud"
  install -Dm755 target/release/himmelblaud_tasks "$pkgdir/usr/bin/himmelblaud_tasks"
  install -Dm755 src/daemon/scripts/himmelblau-init-hsm-pin \
    "$pkgdir/usr/lib/$pkgname/himmelblau-init-hsm-pin"
  install -Dm644 target/config/himmelblau.conf.example \
    "$pkgdir/etc/himmelblau/himmelblau.conf"

  install -Dm644 platform/opensuse/himmelblaud.service \
    "$pkgdir/usr/lib/systemd/system/himmelblaud.service"
  install -Dm644 platform/opensuse/himmelblaud.socket \
    "$pkgdir/usr/lib/systemd/system/himmelblaud.socket"
  install -Dm644 platform/opensuse/himmelblaud-tasks.socket \
    "$pkgdir/usr/lib/systemd/system/himmelblaud-tasks.socket"
  install -Dm644 platform/opensuse/himmelblaud-broker.socket \
    "$pkgdir/usr/lib/systemd/system/himmelblaud-broker.socket"
  install -Dm644 platform/opensuse/himmelblaud-tasks.service \
    "$pkgdir/usr/lib/systemd/system/himmelblaud-tasks.service"
  install -Dm644 platform/opensuse/himmelblau-hsm-pin-init.service \
    "$pkgdir/usr/lib/systemd/system/himmelblau-hsm-pin-init.service"
  sed -i "s|^ExecStart=/usr/libexec/|ExecStart=/usr/lib/$pkgname/|" \
    "$pkgdir/usr/lib/systemd/system/himmelblau-hsm-pin-init.service"
  grep -qx "ExecStart=/usr/lib/$pkgname/himmelblau-init-hsm-pin" \
    "$pkgdir/usr/lib/systemd/system/himmelblau-hsm-pin-init.service"
  install -Dm644 platform/opensuse/himmelblau-compliance-check.service \
    "$pkgdir/usr/lib/systemd/user/himmelblau-compliance-check.service"
  install -Dm644 platform/opensuse/himmelblau-compliance-check.timer \
    "$pkgdir/usr/lib/systemd/user/himmelblau-compliance-check.timer"
  install -Dm644 src/config/gdm3_service_override.conf \
    "$pkgdir/usr/lib/systemd/system/display-manager.service.d/himmelblau.conf"

  install -Dm644 src/daemon/src/himmelblaud.tmpfiles.conf \
    "$pkgdir/usr/lib/tmpfiles.d/himmelblaud.conf"
  install -Dm644 src/daemon/src/himmelblau-policies.tmpfiles.conf \
    "$pkgdir/usr/lib/tmpfiles.d/himmelblau-policies.conf"

  install -Dm644 man/man1/aad-tool.1 "$pkgdir/usr/share/man/man1/aad-tool.1"
  install -Dm644 man/man5/himmelblau.conf.5 "$pkgdir/usr/share/man/man5/himmelblau.conf.5"
  install -Dm644 man/man8/himmelblaud.8 "$pkgdir/usr/share/man/man8/himmelblaud.8"
  install -Dm644 man/man8/himmelblaud_tasks.8 "$pkgdir/usr/share/man/man8/himmelblaud_tasks.8"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 target/config/himmelblau.conf.example \
    "$pkgdir/usr/share/doc/$pkgname/himmelblau.conf.example"

  # Translation catalogs, compiled from po/LINGUAS by src/common/build.rs
  if [[ ! -d target/release/locale ]]; then
    echo "error: target/release/locale is missing; is gettext installed?" >&2
    return 1
  fi
  local mo rel
  while IFS= read -r -d '' mo; do
    rel="${mo#target/release/locale/}"
    install -Dm644 "$mo" "$pkgdir/usr/share/locale/$rel"
  done < <(find target/release/locale -type f -name '*.mo' -print0)

  # NSS and PAM. Arch has no lib64, so these land in /usr/lib.
  install -Dm755 target/release/libnss_himmelblau.so \
    "$pkgdir/usr/lib/libnss_himmelblau.so.2"
  install -Dm644 src/nss/src/nss-himmelblau.tmpfiles.conf \
    "$pkgdir/usr/lib/tmpfiles.d/nss-himmelblau.conf"
  install -Dm755 target/release/libpam_himmelblau.so \
    "$pkgdir/usr/lib/security/pam_himmelblau.so"

  # Broker
  install -Dm755 target/release/broker "$pkgdir/usr/bin/himmelblau_broker"
  install -Dm644 src/broker/platform/com.microsoft.identity.broker1.service \
    "$pkgdir/usr/share/dbus-1/services/com.microsoft.identity.broker1.service"
  install -Dm644 src/broker/platform/himmelblau-broker.service \
    "$pkgdir/usr/lib/systemd/user/himmelblau-broker.service"

  # Browser SSO
  install -Dm755 target/release/linux-entra-sso "$pkgdir/usr/bin/linux-entra-sso"
  install -Dm644 src/sso/src/firefox/linux_entra_sso.json \
    "$pkgdir/usr/lib/mozilla/native-messaging-hosts/linux_entra_sso.json"
  install -Dm644 src/sso/src/chrome/linux_entra_sso.json \
    "$pkgdir/etc/opt/chrome/native-messaging-hosts/linux_entra_sso.json"
  install -Dm644 src/sso/src/chrome/linux_entra_sso.json \
    "$pkgdir/etc/chromium/native-messaging-hosts/linux_entra_sso.json"
  install -Dm644 src/sso/src/chrome/extension.json \
    "$pkgdir/usr/share/google-chrome/extensions/jlnfnnolkbjieggibinobhkjdfbpcohn.json"
  install -Dm644 src/sso-policies/src/chrome/policies.json \
    "$pkgdir/etc/opt/chrome/policies/managed/himmelblau.json"
  install -Dm644 src/sso-policies/src/chrome/policies.json \
    "$pkgdir/etc/chromium/policies/managed/himmelblau.json"
  install -Dm644 src/sso-policies/src/firefox/policies.json \
    "$pkgdir/usr/share/doc/$pkgname/firefox-policies.json.example"
  install -Dm644 src/sso-policies/src/thunderbird/policies.json \
    "$pkgdir/usr/share/doc/$pkgname/thunderbird-policies.json.example"

  # sshd drop-in. The EL variant is used because Arch also ships a recent sshd.
  install -Dm644 platform/el/sshd_config \
    "$pkgdir/etc/ssh/sshd_config.d/30-himmelblau.conf"

  # GNOME QR greeter extension
  local greeter='qr-greeter@himmelblau-idm.org'
  local asset
  for asset in extension.js qrcodegen.js qrselection.js metadata.json \
               stylesheet.css security-key.svg security-key-touch.svg; do
    install -Dm644 "target/release/qr-greeter-build/$greeter/$asset" \
      "$pkgdir/usr/share/gnome-shell/extensions/$greeter/$asset"
  done
}
