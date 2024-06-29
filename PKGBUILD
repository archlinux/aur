# Maintainer: kj_sh604 <406hs_jk@proton.me>

pkgname=grep-compat
pkgname_=grep
pkgver=3.11
pkgrel=1
pkgdesc='A string search utility (without egrep and fgrep warnings when used in scripts)'
arch=('x86_64')
license=('GPL3')
url='https://www.gnu.org/software/grep/'
depends=('glibc' 'pcre2')
makedepends=('texinfo')
provides=('grep')
conflicts=('grep')
source=("https://ftp.gnu.org/gnu/$pkgname_/$pkgname_-$pkgver.tar.xz")
sha512sums=('f254a1905a08c8173e12fbdd4fd8baed9a200217fba9d7641f0d78e4e002c1f2a621152d67027d9b25f0bb2430898f5233dc70909d8464fd13d7dd9298e65c42')

prepare() {
  cd $pkgname_-$pkgver
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
  cd $pkgname_-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname_-$pkgver
  make check
}

package() {
  cd $pkgname_-$pkgver
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
