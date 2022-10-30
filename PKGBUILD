# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd'
pkgver=3.3.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz")
b2sums=('e815b736129de78ca1e6b0a6bdb4a5ee60d93b6b24feb2af0470333f4c7f1157507af52bc724f88cee980b940c29c82c6e4481bb8f50289cb3a3af4ab541abfc')

prepare() {
  cd "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"

  # Release
  export LIBEXECDIR=/usr/lib
  cargo build --release --bin=stratisd
  cargo build --release --bin=stratis-min --bin=stratisd-min --bin=stratis-utils --no-default-features --features min,systemd_compat

  a2x -f manpage docs/stratisd.txt
}

check() {
  cd "${pkgname}-${pkgver}"

  export LIBEXECDIR=/usr/lib
  cargo test --no-run
}

package() {
  cd "${pkgname}-${pkgver}"

  export LIBEXECDIR=/usr/lib
  install -dm755 "${pkgdir}/usr/lib/systemd/system-generators"
  install -dm755 "${pkgdir}/usr/bin"
  make install DESTDIR="${pkgdir}" PREFIX="/usr" LIBEXECDIR="/usr/lib" DRACUTDIR="/usr/lib/dracut" PROFILEDIR=release
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
