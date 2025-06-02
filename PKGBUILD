# Maintainer: kj_sh604 <406hs_jk@proton.me>

pkgname=grep-compat
_pkgname=grep
pkgver=3.12
pkgrel=3
pkgdesc='A string search utility (without egrep and fgrep warnings when used in scripts)'
arch=('x86_64')
license=('GPL3')
url='https://www.gnu.org/software/grep/'
depends=('glibc' 'pcre2')
makedepends=('texinfo')
provides=('grep')
conflicts=('grep')
source=("https://ftp.gnu.org/gnu/$_pkgname/$_pkgname-$pkgver.tar.xz")
sha256sums=('2649b27c0e90e632eadcd757be06c6e9a4f48d941de51e7c0f83ff76408a07b9')

prepare() {
  cd $_pkgname-$pkgver
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # add egrep wrapper script with no warnings
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/egrep" <<END
#!/bin/sh
cmd=\${0##*/}
exec grep -E "\$@"
END

  # add fgrep wrapper script with no warnings
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/fgrep" <<END
#!/bin/sh
cmd=\${0##*/}
exec grep -F "\$@"
END
}
