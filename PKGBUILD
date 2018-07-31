# fork https://aur.archlinux.org/stratisd.git

pkgname='stratisd-single'
_pkgname='stratisd'
pkgver=0.5.4
pkgrel=0
pkgdesc='Easy to use local storage management for Linux.'
arch=('x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('asciidoc' 'cargo' 'rust' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz")
sha256sums=('373493ff36684e6595c1377af9f34cd7f6389a7a74921c84355608f75e208422')

build() {
  cd "${_pkgname}-${pkgver}"

  # Append '--release' to `cargo build` (line 24):
  sed -i 's/cargo build --target/cargo build --release --target/' Makefile

  # Release
  make build
  make stratisd.8

  # patch systemd config
  sed -i 's,/usr/libexec,/usr/bin,g' stratisd.service
}

check() {
  cd "${_pkgname}-${pkgver}"

  make test
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -d -m 755 "${pkgdir}/etc/dbus-1/system.d"
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/lib/systemd/system"
  install -d -m 755 "${pkgdir}/usr/share/dbus-1/system-services"
  install -d -m 755 "${pkgdir}/usr/share/doc/"
  install -d -m 755 "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -d -m 755 "${pkgdir}/usr/share/man/man8"

  install -m 755 "target/x86_64-unknown-linux-gnu/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -m 644 stratisd.service "${pkgdir}/usr/lib/systemd/system"
  install -m 644 org.storage.stratis1.service "${pkgdir}/usr/share/dbus-1/system-services"
  install -m 644 stratisd.conf "${pkgdir}/etc/dbus-1/system.d"
  install -m 644 docs/stratisd.8 "${pkgdir}/usr/share/man/man8"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
