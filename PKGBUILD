# Maintainer: Otto Sabart <aur@seberm.com>

# Ref.: https://github.com/QubesOS/qubes-core-qubesdb/tree/master/archlinux

pkgname=qubes-db-vm
_gitname=${pkgname%-git*}
pkgver=4.0.17
pkgrel=1
pkgdesc="QubesDB libs and daemon service."
arch=("x86_64")
url="https://github.com/QubesOS/qubes-core-qubesdb"
license=('GPL')
depends=(
    'qubes-libvchan'

    # Block updating if there is a major python update as the python API will be in the wrong PYTHONPATH
    'python<3.11'
)
makedepends=(qubes-libvchan python)
install=PKGBUILD.install
validpgpkeys=('0AF64C3B1F1214B38C8C57861FA2DBE674387CC3'  # Otto Sabart
              '0064428F455451B3EBE78A7F063938BA42CFA724'  # Marek Marczykowski-Górecki
              '427F11FD0FAA4B080123F01CDDFA1A3E36879494'  # Qubes Master Signing Key
)

source=("$_gitname::git+https://github.com/QubesOS/qubes-core-qubesdb.git?signed#tag=v${pkgver}")
sha512sums=('SKIP'
)


build() {
  cd "${srcdir}/${_gitname}/"

  # Build all with python bindings
  make all BACKEND_VMM=xen
}


package() {
  cd "${srcdir}/${_gitname}/"

  # Install all with python bindings
  make install DESTDIR=$pkgdir LIBDIR=/usr/lib BINDIR=/usr/bin SBINDIR=/usr/bin

  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  install -p -m 644 daemon/qubes-db.service "${pkgdir}/usr/lib/systemd/system/qubes-db.service"
}
