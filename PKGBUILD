# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd'
pkgver=0.5.1
pkgrel=5
pkgdesc='Stratis is a new tool that meets the needs of Red Hat Enterprise Linux (RHEL) users calling for an easily configured, tightly integrated solution for storage that works within the existing Red Hat storage management stack.'
arch=('x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('asciidoc' 'cargo' 'git' 'mpfr' 'rust')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz"
  'initcpio-install'
  'org.storage.stratis1.service'
  'stratisd.service'
  'stratisd-boot.service'
)
sha256sums=(
  '668792b4fde50fcca6410ff689eda1bd62f5c23f185f652b7a08fe7e9e458808'
  'e12069c231c3f7c6e16b347ffcddb5cf919c9e5105c56a7b9a994e1adc49da25'
  '72ab992ff564d4dd6f0290bd12e973268e45ac0b154e4695796e9737ffed31fe'
  '2143a3f942a3c2975a006c96ec78cf960417943a2425b564f91425f3a50a7ccd'
  'cf2a2ed28cdcfa2a3b90b63a50a6ab8ca9690f8def273feab2d92d84113b931c'
)

build() {
  cd "${pkgname}-${pkgver}"

  # replace service files
  cp -fT ../org.storage.stratis1.service org.storage.stratis1.service
  cp -fT ../stratisd.service stratisd.service
  cp -fT ../stratisd-boot.service stratisd-boot.service

  # Append '--release' to `cargo build` (line 24):
  sed -i '24s/cargo build/cargo build --release/' Makefile

  # build standard binary (with dbus)
  msg2 "Build standard binary (dbus enabled)"
  make build

  # move standard binary
  mv target/release/stratisd stratisd

  # patch makefile to create boot build
  sed -i 's, --features "dbus_enabled",,g' Makefile

  # build boot binary (no dbus)
  msg2 "Build boot binary (dbus disabled)"
  make build

  # move init binary
  mv target/release/stratisd stratisd-boot

  # build docs
  make docs
}

check() {
  cd "${pkgname}-${pkgver}"

  make test
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d -m 755 "${pkgdir}/etc/dbus-1/system.d"
  install -d -m 755 "${pkgdir}/usr/bin"
  install -d -m 755 "${pkgdir}/usr/lib/initcpio/install"
  install -d -m 755 "${pkgdir}/usr/lib/systemd/system"
  install -d -m 755 "${pkgdir}/usr/share/dbus-1/system-services"
  install -d -m 755 "${pkgdir}/usr/share/doc"
  install -d -m 755 "${pkgdir}/usr/share/licenses/stratisd"
  install -d -m 755 "${pkgdir}/usr/share/man/man8"

  install -m 755 "stratisd" "${pkgdir}/usr/bin/stratisd"
  install -m 755 "stratisd-boot" "${pkgdir}/usr/bin/stratisd-boot"
  install -m 644 stratisd.service "${pkgdir}/usr/lib/systemd/system"
  install -m 644 stratisd-boot.service "${pkgdir}/usr/lib/systemd/system"
  install -m 644 ../initcpio-install "${pkgdir}/usr/lib/initcpio/install/stratis"
  install -m 644 org.storage.stratis1.service "${pkgdir}/usr/share/dbus-1/system-services"
  install -m 644 stratisd.conf "${pkgdir}/etc/dbus-1/system.d"
  cp -r target/doc/* "${pkgdir}/usr/share/doc/"
  install -m 644 docs/stratisd.8 "${pkgdir}/usr/share/man/man8"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/stratisd/LICENSE"

  msg2 "If you are planning to boot from a stratis volume remember to make the following changes to '/etc/mkinitcpio.conf':"
  msg2 "Add 'stratis systemd' to HOOKS"
  msg2 "Remove 'udev', 'usr' and 'resume' from HOOKS"
  msg2 ""
  msg2 "Also run the following:"
  msg2 "systemctl enable stratisd.service"
  msg2 ""
  msg2 "Set your root volume to root=/dev/dm-5 in your bootloader config."
}

# vim: ts=2 sw=2 et:
