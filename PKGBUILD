# Maintainer: akaessens
pkgname=fusioninventory-agent-rust-git
_pkgname=fusioninventory-agent-rust
pkgver=3.0.0.dev
pkgrel=1
pkgdesc='An application for keeping track of the hardware and software'
url='http://fusioninventory.org'
source=("git+https://github.com/fusioninventory/$_pkgname")
arch=(x86_64)
license=('AGPL-3.0-or-later')
makedepends=('cargo')
options=(!debug !lto)
depends=('lshw' 'dmidecode')
provides=('fusioninventory-agent')
conflicts=('fusioninventory-agent')
sha256sums=('SKIP')

build () {
  cd "$srcdir/$_pkgname"

  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  # binary
  install -Dm755 target/release/fusioninventory-agent "${pkgdir}/opt/fusioninventory/fusioninventory-agent"
  # config and webserver
  install agent.cfg "${pkgdir}/opt/fusioninventory/"
  cp -r src/static "${pkgdir}/opt/fusioninventory/"

  cd "$srcdir/.."
  # custom systemd service
  install -Dm644 fusioninventory-agent.service "${pkgdir}/usr/lib/systemd/system/fusioninventory-agent.service"
}
