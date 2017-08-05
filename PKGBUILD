# Maintainer: bitwave <aur [at] oomlu [d0t] de>
# Ex-Maintainer: Serge Victor <arch@random.re>
# Ex-Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Christos Nouskas <nous at archlinux dot us>

pkgname=vanitygen-git
pkgver=20121024
pkgrel=3
pkgdesc="Bitcoin vanity address generator written in C"
arch=('i686' 'x86_64')
depends=('openssl-1.0' 'pcre')
makedepends=('git')
url="https://github.com/samr7/vanitygen"
license=('AGPL3')
source=("openssl.patch"
    git+https://github.com/samr7/vanitygen)
sha256sums=('9f15f4858f6de2d7b93705b599bbcc69ab36a38c7116c1d449e9cef1ff11ac43'
            'SKIP')
provides=('vanitygen')
conflicts=('vanitygen')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  patch -Np0 -i $srcdir/openssl.patch
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  make most
}

package() {
  cd ${pkgname%-git}
  msg 'Installing executables...'
  install -D -m755 vanitygen $pkgdir/usr/bin/vanitygen
  install -D -m755 keyconv $pkgdir/usr/bin/keyconv

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
