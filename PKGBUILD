## Maintainer: fauno <fauno@parabola.nu>

pkgname=pam_abl-git
pkgver=r88.19eaf6d
pkgrel=1
pkgdesc="Automated blacklisting on repeated failed authentication attempts"
arch=('i686' 'x86_64')
url="https://github.com/deksai/pam_abl"
license=('GPL2+')
depends=(db pam)
makedepends=(git asciidoc cmake kyotocabinet cunit)
optdepends=("kyotocabinet: faster database")
source=(git+https://github.com/fauno/pam_abl)
sha512sums=('SKIP')
install="pam_abl.install"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_BDB=TRUE \
    -DUSE_KC=TRUE \
    -DKyotoCabinet_FOUND=TRUE \
    -DKyotoCabinet_INCLUDE_DIR=/usr/include \
    -DKyotoCabinet_LIBRARY=/usr/lib/libkyotocabinet.so

  make

  cd doc
  sh generate.sh
}

check() {
  cd "${srcdir}/${pkgname%-git}"
  ./pam_abl_test pam_abl_bdb.so
  ./pam_abl_test pam_abl_kc.so
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  # install binaries
  make install DESTDIR="$pkgdir/"

  # install example configuration
  install --mode=0644 -D -- conf/pam_abl.conf \
          "$pkgdir/etc/security/pam_abl.conf.example"

  #install documentation
  install --mode=0644 -D -- doc/pam_abl.1 \
          "$pkgdir/usr/share/man/man1/pam_abl.1"
  install --mode=0644 -D -- doc/pam_abl.8 \
          "$pkgdir/usr/share/man/man8/pam_abl.8"
  install --mode=0644 -D -- doc/pam_abl.conf.5 \
          "$pkgdir/usr/share/man/man5/pam_abl.conf.5"
}
