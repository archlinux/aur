# Maintainer: Andrew Munkres <amunkres@nyx.net>

pkgname=isextract-git
pkgver=r12.d9350da
pkgrel=1
pkgdesc='Command line tool to extract from *.z InstallShield v3 packages'
arch=('x86_64')
url="https://github.com/OmniBlade/isextract"
license=('GPL2' 'custom:zlib')
depends=()
makedepends=('git')
provides=('isextract')
conflicts=('isextract')
source=('git+https://github.com/OmniBlade/isextract.git'
        'isextract-git-r12.d9350da-Makefile-changes.patch')
sha256sums=('SKIP'
            'b389df7d40951ce532aab59db343e35de8c3f91a1d23eeca81a35fa283712bd1')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  # Apply patch to change installation directory:
  patch -Np1 -i ../isextract-git-r12.d9350da-Makefile-changes.patch
}

build() {
  cd "${pkgname%-git}"
  make PREFIX=/usr DESTDIR="$pkgdir"
}

package() {
  cd "${pkgname%-git}"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  install -D -m644 src/blast.h "$pkgdir"/usr/share/licenses/isextract/LICENSE
}
