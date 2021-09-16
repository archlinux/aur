# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=fakechroot-git
pkgver=2.20.1.r7.gb42d1fb
pkgrel=1
pkgdesc="Gives a fake chroot environment"
arch=('i686' 'x86_64')
url="https://github.com/dex4er/fakechroot"
license=('LGPL')
depends=('glibc' 'perl' 'sh')
makedepends=('git')
provides=('fakechroot')
conflicts=('fakechroot')
options=('staticlibs')
source=("git+https://github.com/dex4er/fakechroot.git"
        "fix_glibc_2.33_compatibility.patch::https://github.com/lipnitsk/fakechroot/commit/693a3597ea7fccfb62f357503ff177bd3e3d5a89.patch"
        "remove_ver_from_lstat.patch::https://github.com/lipnitsk/fakechroot/commit/75d7e6fa191c11a791faff06a0de86eaa7801d05.patch")
sha256sums=('SKIP'
            '959f931e86964058e3ceeae029078140db9070180807ba9118419cede7a19843'
            '6ad03fcf98a619f550d6145d8b3855a606367de0bcb5f20113ba36f17d182bc9')


prepare() {
  cd "fakechroot"

  patch -Np1 -i "$srcdir/fix_glibc_2.33_compatibility.patch"
  patch -Np1 -i "$srcdir/remove_ver_from_lstat.patch"
}

pkgver() {
  cd "fakechroot"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's|^master/||'
}

build() {
  cd "fakechroot"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --libdir="/usr/lib/libfakeroot" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc"
  make
}

check() {
  cd "fakechroot"

  #make check
}

package() {
  cd "fakechroot"

  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir/etc/ld.so.conf.d"
  echo "/usr/lib/libfakeroot/fakechroot" > "$pkgdir/etc/ld.so.conf.d/fakechroot.conf"
}
