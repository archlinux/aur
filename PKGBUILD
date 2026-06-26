# Maintainer: Uladzislau Bolbas <cmrtumilovic@gmail.com>

pkgname=gisp
pkgver=1.1
pkgrel=3
pkgdesc="File encryption utility using XChaCha20-Poly1305 and Argon2id"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://savannah.nongnu.org/projects/gisp"
license=('GPL-3.0-or-later')
depends=('libsodium')
makedepends=('git' 'gcc' 'make' 'autoconf' 'automake' 'gettext' 'texinfo' 'pkgconf')
install="$pkgname.install"
# Savannah disables cgit snapshot tarballs, so fetch the tagged tree over git.
source=("$pkgname::git+https://https.git.savannah.gnu.org/git/gisp.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  # The release archive is a plain git export, so generate the build system.
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname"
  make check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  # The info "dir" index is owned by the system, not by this package; the
  # gisp.install scriptlet registers gisp.info instead.
  rm -f "$pkgdir/usr/share/info/dir"
}
