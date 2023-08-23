# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd'
pkgver=3.5.8
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
b2sums=('7b51d8c2467ed450737fb462f20cb71ae376a1398fb395b1d45177a6086c7f2b0a354e4349d5278527b7bf0a2520b9d395603af5e4c870933b82312a3ac144a2')

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
