# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rpm-tools-git
pkgver=4.18.1.r492.g021a7d3aa
pkgrel=1
pkgdesc="RPM Package Manager"
arch=('i686' 'x86_64')
url="https://rpm.org/"
license=('GPL')
depends=('glibc' 'elfutils' 'file' 'libarchive' 'libcap' 'lmdb' 'lua' 'nss' 'popt' 'zstd')
makedepends=('git' 'python')
provides=("rpm-tools=$pkgver" 'rpmextract')
conflicts=('rpm-tools' 'rpmextract')
source=("git+https://github.com/rpm-software-management/rpm.git"
        "rpmextract.sh::https://gitlab.archlinux.org/archlinux/packaging/packages/rpm-tools/-/raw/main/rpmextract.sh")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "rpm"

  _tag=$(git tag -l --sort -v:refname | grep -E '^rpm-[0-9\.]+-release' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^rpm-//;s/-release//'
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
