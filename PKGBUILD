# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd'
pkgver=3.6.3
pkgrel=1
pkgdesc='Easy to use local storage management for Linux.'
arch=('x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('asciidoc' 'cargo' 'rust' 'clang' 'dracut')
depends=('dbus' 'cryptsetup' 'util-linux-libs' 'clevis' 'systemd')
optdepends=('stratis-cli: command line interface'
            'dracut: stratis as root filesystem support')
checkdepends=('python-pyudev')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/stratisd-v${pkgver}.tar.gz")
b2sums=('ceaa8efb82f0bc76c0cf8900e923049e2b0eeeb0a73c1a40637aebd1aa23df0f789271911966c57eb5c4239961a6d939f88a043d6a0ad500ffa9510ffede8968')

prepare() {
  cd "${pkgname}-${pkgname}-v${pkgver}"
}

build() {
  cd "${pkgname}-${pkgname}-v${pkgver}"

  # Release
  export LIBEXECDIR=/usr/lib
  cargo build --release --bin=stratisd
  cargo build --release --bin=stratis-min --bin=stratisd-min --bin=stratis-utils --no-default-features --features engine,min,systemd_compat
  cargo build --release --bin=stratis-str-cmp --no-default-features --features udev_scripts
  cargo build --release --bin=stratis-base32-decode --no-default-features --features udev_scripts
  cargo build --release --bin=stratis-dumpmetadata --no-default-features --features engine,extras,min

  a2x -f manpage docs/stratisd.txt
  a2x -f manpage docs/stratis-dumpmetadata.txt
}

check() {
  cd "${pkgname}-${pkgname}-v${pkgver}"

  export LIBEXECDIR=/usr/lib
  cargo test --no-run
}

package() {
  cd "${pkgname}-${pkgname}-v${pkgver}"

  export LIBEXECDIR=/usr/lib
  install -dm755 "${pkgdir}/usr/lib/systemd/system-generators"
  install -dm755 "${pkgdir}/usr/bin"
  make install DESTDIR="${pkgdir}" PREFIX="/usr" LIBEXECDIR="/usr/lib" DRACUTDIR="/usr/lib/dracut" PROFILEDIR=release
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
