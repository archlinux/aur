# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rpm-tools-git
pkgver=4.20.0.r536.gf9f124a67
pkgrel=1
pkgdesc="RPM Package Manager"
arch=('i686' 'x86_64')
url="https://rpm.org/"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'elfutils' 'file' 'libarchive' 'libcap' 'lua' 'nss' 'popt' 'rpm-sequoia' 'zstd')
makedepends=('git' 'cmake' 'python')
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

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DWITH_DBUS=OFF \
    -DWITH_SELINUX=OFF \
    ./
  cmake --build "_build"
}

check() {
  cd "rpm"

  #cmake --build "_build" --target test
}

package() {
  cd "rpm"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm755 "$srcdir/rpmextract.sh" -t "$pkgdir/usr/bin"
}
