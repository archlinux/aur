# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=fakechroot-git
pkgver=2.20.1.r7.gb42d1fb
pkgrel=3
pkgdesc="Gives a fake chroot environment"
arch=('i686' 'x86_64')
url="https://github.com/dex4er/fakechroot"
license=('LGPL')
depends=('glibc' 'perl' 'sh')
makedepends=('git')
provides=("fakechroot=$pkgver")
conflicts=('fakechroot')
options=('staticlibs')
source=("git+https://github.com/dex4er/fakechroot.git"
        "fix_glibc_2.33_compatibility.patch::https://patch-diff.githubusercontent.com/raw/dex4er/fakechroot/pull/85.patch"
        "fix_AC_PATH_PROG_typo.patch::https://patch-diff.githubusercontent.com/raw/dex4er/fakechroot/pull/80.patch"
        "call_getcwd_real_for_relative_paths.patch::https://patch-diff.githubusercontent.com/raw/dex4er/fakechroot/pull/100.patch")
sha256sums=('SKIP'
            '2b2dc512e059df80c37341c4c35d591279a16e7bae23670646c211492fdc9de1'
            'e52bd008b80d91c420a39bdf9512311aed957ed0694dcf0e91a9dfb45dc9ad3a'
            '1df4ac7967fcaeacf0e5036d4c04272ca8a291e998fa1ee6953b250e072ffc3e')


prepare() {
  cd "fakechroot"

  patch -Np1 -i "$srcdir/fix_glibc_2.33_compatibility.patch"
  patch -Np1 -i "$srcdir/fix_AC_PATH_PROG_typo.patch"
  patch -Np1 -i "$srcdir/call_getcwd_real_for_relative_paths.patch"
}

pkgver() {
  cd "fakechroot"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
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
