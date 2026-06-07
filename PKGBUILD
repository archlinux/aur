# Maintainer: Patrick Lorio <patrick@playit.gg>
# Contributor: swweetp <swweetp@outlook.com>
# Contributor: Amirul Fitri <tounghacker@gmail.com>

pkgname=playit
pkgver=1.0.9
pkgrel=1
pkgdesc='Tool to make your locally running game server public'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://playit.gg'
license=('BSD-2-Clause')
depends=('logrotate' 'systemd')
makedepends=('cargo')
conflicts=('playit-bin' 'playit-bin-debug')
install="${pkgname}.install"
# ring's native objects can fail to link with Arch package LTO enabled.
options=('!lto')

_repo='playit-cloud/playit-agent'
_source_dir="playit-agent-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_repo}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9f32e5be5781e6d8918a8478b180a5a7552a83de880601910a6e71f02de0912c')

prepare() {
  cd "${srcdir}/${_source_dir}"

  cargo fetch --locked
}

build() {
  cd "${srcdir}/${_source_dir}"

  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --package playit-cli --bin playit-cli
  cargo build --frozen --release --package playitd --bin playitd
}

package() {
  cd "${srcdir}/${_source_dir}"

  install -Dm0755 target/release/playit-cli "${pkgdir}/opt/playit/agent"
  install -Dm0755 target/release/playitd "${pkgdir}/opt/playit/playitd"
  install -Dm0755 linux/playit "${pkgdir}/opt/playit/playit"

  install -Dm0644 linux/logrotate.conf "${pkgdir}/etc/logrotate.d/playit"
  install -Dm0644 linux/playit.service "${pkgdir}/usr/lib/systemd/system/playit.service"
  install -Dm0644 linux/playit.sysusers "${pkgdir}/usr/lib/sysusers.d/playit.conf"
  install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  install -dm0750 "${pkgdir}/etc/playit"
  install -dm0755 "${pkgdir}/usr/bin"

  ln -s /opt/playit/playit "${pkgdir}/usr/bin/playit"
  ln -s /opt/playit/playitd "${pkgdir}/usr/bin/playitd"
}
