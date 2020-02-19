# Maintainer: Timothy Gu <timothygu99@gmail.com>

pkgname=(pam_wrapper python-pypamtest python2-pypamtest)
pkgbase=pam_wrapper
pkgver=1.0.7
pkgrel=6
pkgdesc='A helper library for PAM testing'
arch=(x86_64)
url='https://cwrap.org/pam_wrapper.html'
license=('GPL3')
groups=(cwrap)
depends=(pam)
makedepends=(cmake python python2)
checkdepends=(cmocka)
# pam-wrapper is the name of another AUR package that we are trying to merge
# into this one.
provides=(pam-wrapper)
conflicts=(pam-wrapper)
replaces=(pam-wrapper)
source=("https://ftp.samba.org/pub/cwrap/$pkgname-$pkgver.tar.gz"
        # https://bugzilla.samba.org/show_bug.cgi?id=14245
        # https://gitlab.com/cwrap/pam_wrapper/-/merge_requests/2
        'fix-pam-module-output-crash.patch')
sha256sums=('0537302eb6ceb07bcf5233c859b19264375beaa294bb3a9b7f58973981c8b219'
            'ad36643dc64951a7d99580fb02de3a7de841547f8ae01cc2fba5e7989e61b2e5')

prepare() {
  mkdir -p build

  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/fix-pam-module-output-crash.patch"
}

build() {
  cd build
  # For reproducible builds, add -ffile-prefix-map to remove $srcdir from
  # __FILE__ macro.
  CFLAGS="$CFLAGS -ffile-prefix-map=$srcdir=." cmake "../$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DUNIT_TESTING=TRUE
  make
}

check() {
  cd build
  make -k test
}

package_pam_wrapper() {
  cd build
  make DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir"/usr/lib/python*
}

package_python-pypamtest() {
  pkgdesc='A helper library for PAM testing (Python bindings)'
  depends=(pam_wrapper python)
  unset provides
  unset conflicts
  unset replaces

  cd build
  make DESTDIR="$pkgdir/" install

  cd "$pkgdir"
  find . -mindepth 1 '!' -type d '!' -path '*python3*' -delete
  find . -mindepth 1 -type d -empty -delete
}

package_python2-pypamtest() {
  pkgdesc='A helper library for PAM testing (Python 2 bindings)'
  depends=(pam_wrapper python2)
  unset provides
  unset conflicts
  unset replaces

  cd build
  make DESTDIR="$pkgdir/" install

  cd "$pkgdir"
  find . -mindepth 1 '!' -type d '!' -path '*python2*' -delete
  find . -mindepth 1 -type d -empty -delete
}
