pkgname=mastercard-pkcs11-tools
pkgver=2.5.1
pkgrel=1
pkgdesc="Tools to manage objects on PKCS#11 cryptographic tokens"
url="https://github.com/Mastercard/pkcs11-tools"
arch=(x86_64)
depends=(openssl)
makedepends=(
  autoconf-archive
  bison
  flex
)
_commit=v2.5.1
source=("git+https://github.com/Mastercard/pkcs11-tools#commit=$_commit"
        "git+https://git.savannah.gnu.org/git/gnulib.git"
        "oasis-pkcs11::git+https://github.com/oasis-tcs/pkcs11")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd pkcs11-tools
  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
}

prepare() {
  cd pkcs11-tools

  git submodule init .gnulib
  git submodule init include/oasis-pkcs11

  git submodule set-url .gnulib "$srcdir/gnulib"
  git submodule set-url include/oasis-pkcs11 "$srcdir/oasis-pkcs11"

  git -c protocol.file.allow=always submodule update
}

build() {
  cd pkcs11-tools
  sh -ex ./bootstrap.sh
  ./configure --prefix=/usr --sysconfdir=/etc

  # Hack to fix what the compiler insists is a syntax error
  echo '#include_next <string.h>' > gl/string.h

  make
}

package() {
  cd pkcs11-tools
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
