# Maintainer: kj_sh604 <406hs_jk@proton.me>

pkgname=grep-compat
pkgname_=grep
pkgver=3.12
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
sha512sums=('c54b4db5a8b9afe098c088decd94977746305284d716666a60bac82b4edc0fae4acf828970b5b6fc7d58ecd549f638e17e6958f33a71fedcc7d7415b9228b161')

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
