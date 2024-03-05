# Maintainer: Butter Cat <ButteredCats@protonmail.com>

_pkgname="intellectual"
pkgname="${_pkgname}-git"
pkgver=r376.aa4ffb2
pkgrel=1
pkgdesc="An alternative frontend for Genius focused on privacy and simplicity."
arch=('x86_64' 'aarch64')
url="https://github.com/Insprill/intellectual"
license=('AGPL-3.0-only')
makedepends=('git' 'rust')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}"
        'intellectual.conf'
        'intellectual.service')
sha256sums=('SKIP'
            '90f3dbe07e6284ff4f5d90c0edb2a653fb16b19c63daf0401837016497e48c60'
            '299f94def28836caf5abf4afcb794f0a78d503aa2460e5fbf196595f69239876')
backup=('etc/intellectual.conf')
options=('!buildflags')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "${_pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 ../../intellectual.conf -t "${pkgdir}/etc/"
  install -Dm644 ../../intellectual.service -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm755 "target/release/intellectual" -t "${pkgdir}/usr/bin/"
}
