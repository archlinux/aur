# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd'
pkgver=3.8.6
pkgrel=3
pkgdesc='Easy to use local storage management for Linux.'
arch=('x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('asciidoc' 'cargo' 'rust' 'clang' 'dracut')
depends=('dbus' 'cryptsetup' 'util-linux-libs' 'clevis' 'systemd')
optdepends=('stratis-cli: command line interface'
            'dracut: stratis as root filesystem support')
checkdepends=('python-pyudev')
#source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/stratisd-v${pkgver}.tar.gz")
source=('git+https://github.com/stratis-storage/stratisd.git')
b2sums=('SKIP')

prepare() {
  #cd "${pkgname}-${pkgname}-v${pkgver}"
  cd "${srcdir}/${pkgname/-git}"
}

build() {
  cd "${srcdir}/${pkgname/-git}"
  #cd "${pkgname}-${pkgname}-v${pkgver}"

  # Release

  cargo build --release --bin=stratisd
  cargo build --release --bin=stratis-min --bin=stratisd-min --bin=stratis-utils --no-default-features --features engine,min,systemd_compat
  cargo build --release --bin=stratis-utils --no-default-features --features engine,systemd_compat
  cargo build --release --bin=stratis-str-cmp --no-default-features --features udev_scripts
  cargo build --release --bin=stratis-str-cmp --no-default-features --features udev_scripts
  cargo build --release --bin=stratis-base32-decode --no-default-features --features udev_scripts
  #cargo build --release --bin=stratis-dumpmetadata --no-default-features --features engine,extras,min
  cargo build --release --bin=stratisd-tools --no-default-features --features engine,extras
  cargo build --release --bin=stratis-str-cmp --no-default-features --features udev_scripts

  #make build
  export LIBEXECDIR=/usr/lib
  #make build

  a2x -f manpage docs/stratisd.txt
  a2x -f manpage docs/stratis-dumpmetadata.txt
}

check() {
  cd "${srcdir}/${pkgname/-git}"
  #cd "${pkgname}-${pkgname}-v${pkgver}"

  export LIBEXECDIR=/usr/lib
  cargo test --no-run
}

package() {
  #cd "${pkgname}-${pkgname}-v${pkgver}"
  cd "${srcdir}/${pkgname/-git}"

  export LIBEXECDIR=/usr/lib
  install -dm755 "${pkgdir}/usr/lib/systemd/system-generators"
  install -dm755 "${pkgdir}/usr/bin"
  make install DESTDIR="${pkgdir}" PREFIX="/usr" LIBEXECDIR="/usr/lib" DRACUTDIR="/usr/lib/dracut" PROFILEDIR=release
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
