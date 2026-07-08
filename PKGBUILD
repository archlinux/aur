# Maintainer: ChargeGuard contributors
pkgbase=chargeguard
pkgname=("chargeguard" "gnome-shell-extension-chargeguard")
pkgver=0.1.1
pkgrel=1
pkgdesc="Native battery charge modes and battery diagnostics for GNOME Quick Settings and CLI"
arch=("x86_64")
url="https://github.com/Ca11back/ChargeGuard"
license=("MIT")
makedepends=("cargo" "gettext")
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bd504e94db6ab5bf5778ea8f5557c7f92fc69231bbf3b5d9788f6ef41be1fa1a')

_srcdir="ChargeGuard-${pkgver}"

build() {
  cd "${srcdir}/${_srcdir}"
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo build --release --locked -p chargeguard-cli -p chargeguardd
}

check() {
  cd "${srcdir}/${_srcdir}"
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo test --locked --workspace --all-features
}

package_chargeguard() {
  pkgdesc="Native battery charge modes and battery diagnostics for GNOME Quick Settings and CLI"
  depends=("dbus" "gcc-libs" "glibc" "polkit" "systemd")
  install="chargeguard.install"

  cd "${srcdir}/${_srcdir}"

  install -Dm755 "${srcdir}/target/release/chargeguard" \
    "${pkgdir}/usr/bin/chargeguard"
  install -Dm755 "${srcdir}/target/release/chargeguardd" \
    "${pkgdir}/usr/libexec/chargeguardd"

  install -Dm644 "packaging/dbus/io.github.ChargeGuard1.service" \
    "${pkgdir}/usr/share/dbus-1/system-services/io.github.ChargeGuard1.service"
  install -Dm644 "packaging/dbus/io.github.ChargeGuard1.conf" \
    "${pkgdir}/usr/share/dbus-1/system.d/io.github.ChargeGuard1.conf"
  install -Dm644 "packaging/polkit/io.github.ChargeGuard1.policy" \
    "${pkgdir}/usr/share/polkit-1/actions/io.github.ChargeGuard1.policy"
  install -Dm644 "packaging/systemd/chargeguardd.service" \
    "${pkgdir}/usr/lib/systemd/system/chargeguardd.service"

  install -Dm644 "docs/architecture.md" \
    "${pkgdir}/usr/share/doc/chargeguard/architecture.md"
  install -Dm644 "docs/compatibility.md" \
    "${pkgdir}/usr/share/doc/chargeguard/compatibility.md"
  install -Dm644 "README.md" \
    "${pkgdir}/usr/share/doc/chargeguard/README.md"
  install -Dm644 "README.zh-CN.md" \
    "${pkgdir}/usr/share/doc/chargeguard/README.zh-CN.md"
  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/chargeguard/LICENSE"
}

package_gnome-shell-extension-chargeguard() {
  pkgdesc="Native battery charge modes and battery diagnostics for GNOME Quick Settings and CLI"
  depends=("chargeguard=${pkgver}-${pkgrel}" "gnome-shell")

  cd "${srcdir}/${_srcdir}"

  install -Dm644 "gnome-extension/metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/chargeguard@github.com/metadata.json"
  install -Dm644 "gnome-extension/extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/chargeguard@github.com/extension.js"
  install -Dm644 "gnome-extension/prefs.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/chargeguard@github.com/prefs.js"
  install -Dm644 "gnome-extension/README.md" \
    "${pkgdir}/usr/share/doc/gnome-shell-extension-chargeguard/README.md"
  install -d "${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES"
  msgfmt -c -o "${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES/chargeguard.mo" \
    "gnome-extension/po/zh_CN.po"
  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/gnome-shell-extension-chargeguard/LICENSE"
}
