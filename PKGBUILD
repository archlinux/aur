# Maintainer: Lolle2000la
pkgname=tapauth-git
pkgver=0.1.0.r3.80e2c50
pkgrel=1
pkgdesc="Local smartphone-based authentication framework engine (Development/Git version)"
arch=('x86_64')
url="https://github.com/lolle2000la/tapauth"
license=('Apache-2.0')
depends=('dbus' 'gtk4' 'pam')
makedepends=('cargo' 'rust' 'protobuf' 'git')
provides=('tapauth')
conflicts=('tapauth')
source=("tapauth::git+https://github.com/lolle2000la/tapauth.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/tapauth"
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/\([^-]*-\)*g/r/;s/-/./g'
  else
    printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "${srcdir}/tapauth"
  cargo build --workspace --release
}

package() {
  cd "${srcdir}/tapauth"
  
  # Binaries & Shared Objects
  install -Dm0755 target/release/tapauthd "${pkgdir}/usr/bin/tapauthd"
  install -Dm0755 target/release/tapauth-config "${pkgdir}/usr/bin/tapauth-config"
  install -Dm0755 target/release/libclient_pam.so "${pkgdir}/usr/lib/security/pam_tapauth.so"
  
  # System Services
  install -Dm0644 systemd/tapauthd.service "${pkgdir}/usr/lib/systemd/system/tapauthd.service"
  install -Dm0644 systemd/tapauthd.socket "${pkgdir}/usr/lib/systemd/system/tapauthd.socket"
  
  # Declarative Infrastructure
  install -Dm0644 packaging/sysusers.conf "${pkgdir}/usr/lib/sysusers.d/tapauth.conf"
  install -Dm0644 packaging/tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/tapauth.conf"
}
