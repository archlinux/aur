# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rpm-tools-git
pkgver=r17189.gf9b90179b
pkgrel=2
pkgdesc="RPM Package Manager"
arch=('i686' 'x86_64')
url="https://rpm.org/"
license=('GPL')
depends=('glibc' 'elfutils' 'file' 'libarchive' 'libcap' 'lmdb' 'lua' 'nss' 'popt' 'zstd')
makedepends=('git' 'python')
provides=('rpm-tools' 'rpmextract')
conflicts=('rpm-tools' 'rpmextract')
source=("git+https://github.com/rpm-software-management/rpm.git"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/packages/rpm-tools/trunk/rpmextract.sh")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "rpm"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "rpm"

  ./autogen.sh --noconfigure
  ./configure \
    --prefix="/usr" \
		--enable-python \
		--with-cap
  make
}

check() {
  cd "rpm"

  make check
}

package() {
  cd "rpm"

  make DESTDIR="$pkgdir" install
  install -Dm755 "$srcdir/rpmextract.sh" -t "$pkgdir/usr/bin"

  rm -rf "$pkgdir/usr/var"
}
