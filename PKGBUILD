# Maintainer: Lolle2000la
pkgname=tapauth-git
pkgver=0.3.0_preview1.r0.gf1ebec1
pkgrel=1
pkgdesc="Local smartphone-based authentication framework engine (Development/Git version)"
arch=('x86_64')
url="https://github.com/lolle2000la/tapauth"
license=('Apache-2.0')
depends=('dbus' 'pam')
makedepends=('cargo' 'rust' 'protobuf' 'git')
provides=('tapauth')
conflicts=('tapauth')
source=("tapauth::git+https://github.com/lolle2000la/tapauth.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/tapauth"
  local desc
  if desc=$(git describe --long --tags 2>/dev/null); then
    echo "$desc" | sed -E 's/^v//;s/-([0-9]+)-g([0-9a-f]+)$/.r\1.g\2/;s/-/_/g'
  else
    local base
    base=$(git tag --sort=-version:refname 2>/dev/null | grep -E '^v[0-9]' | head -1 | sed 's/^v//')
    printf "%s.r%s.%s" "${base:-0.0.0}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "${srcdir}/tapauth"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/tapauth"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_PROFILE_RELEASE_STRIP=true
  cargo build --frozen --workspace --release
}

package() {
  cd "${srcdir}/tapauth"

  install -Dm0755 target/release/tapauthd "${pkgdir}/usr/bin/tapauthd"
  install -Dm0755 target/release/tapauth-config "${pkgdir}/usr/bin/tapauth-config"
  install -Dm0755 target/release/libclient_pam.so "${pkgdir}/usr/lib/security/pam_tapauth.so"

  install -Dm0644 systemd/tapauthd.service "${pkgdir}/usr/lib/systemd/system/tapauthd.service"
  install -Dm0644 systemd/tapauthd.socket "${pkgdir}/usr/lib/systemd/system/tapauthd.socket"

  install -Dm0644 packaging/sysusers.conf "${pkgdir}/usr/lib/sysusers.d/tapauth.conf"
  install -Dm0644 packaging/tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/tapauth.conf"

  install -Dm0644 client-config-gui/tapauth-config.desktop "${pkgdir}/usr/share/applications/tapauth-config.desktop"
  install -Dm0644 client-config-gui/assets/tapauth-config.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tapauth-config.svg"
  install -Dm0644 tapauthd/dev.rourunisen.tapauth.config.admin.policy "${pkgdir}/usr/share/polkit-1/actions/dev.rourunisen.tapauth.config.admin.policy"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
