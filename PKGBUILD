# Maintainer: veluca93 <veluca93@gmail.com>
# Contributor: trillian <trillian+aur@r9.pm>
# Contributor: iamawacko <iamawacko@protonmail.com>
# Contributor: German IOI Coaches <coaches@informatik-olympiade.de>
# Contributor: Alexandre Macabies <web+oss@zopieux.com>
# Contributor: Antoine Pietri <antoine.pietri@lrde.epita.fr>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=isolate-git
pkgver=r287.b5e87ec
pkgrel=1
pkgdesc="Sandbox for securely executing untrusted programs"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/ioi/isolate"
license=('GPL-2.0-or-later')
depends=('bash' 'systemd-libs' 'libcap' 'glibc')
makedepends=('git' 'gcc' 'asciidoc')
provides=('isolate')
conflicts=('isolate')
install=$pkgname.install

source=("git+https://github.com/ioi/isolate.git"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
sha512sums=('SKIP'
            '7d2f306a0dcba8b5adcb3bf4ca322c8f9d7cc10cb8ced7010ab22c78209769fa3feaa77ea26d5785f0bf4a9e102283ef34b58a8920d26c13e1e5b06a8a9253b5'
            '60166f126538ba4d6ddeb7256636db915e565c86d866a1f3fe5285cf8a52aaeb246696eb87f748a78d9adf0106d1d8db6ae9aafaf6e11ca6a310db00bcde50dd')

pkgver() {
  cd isolate
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd isolate
  make all PREFIX=/usr VARPREFIX=/var CONFIGDIR=/etc SBINDIR=/usr/bin CFLAGS_EXTRA="$CFLAGS" LDFLAGS="\$(LDFLAGS_HARDEN) $LDFLAGS"
}

package() {
  cd isolate
  make install install-doc PREFIX=/usr VARPREFIX=/var CONFIGDIR=/etc SBINDIR=/usr/bin DESTDIR="$pkgdir"

  # Use systemd-sysusers and systemd-tmpfiles to install the isolate group and
  # set the permissions and group on the isolate binary.
  install -Dm 644 ../$pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm 644 ../$pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
