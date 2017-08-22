# $Id: PKGBUILD 207393 2017-01-14 18:17:11Z seblu $
# Maintainer: Sébastien Luttringer <seblu@archlinux.org>

pkgname=rblcheck
pkgver=1.5
pkgrel=3
pkgdesc='Tool to query RBL servers'
arch=('i686' 'x86_64')
url='https://github.com/logic/rblcheck'
license=('GPL2')
depends=('glibc' 'bash')
makedepends=('git')
backup=('etc/rblcheckrc')
source=("git+https://github.com/logic/rblcheck.git#tag=rblcheck-$pkgver"
        '01-change-filename-tags-for-directories.patch'
        '02-fix-configure.patch'
        '03-custom-rbl.patch'
        '04-fix-missing-include.patch')
md5sums=('SKIP'
         '9e8ed44f4bc6abf235a14065b6aa373c'
         'ef71fccbf229eafc7ff6df57de2511ea'
         'a9bc3e8a9b13adc20dfc40052a3ab367'
         'ccc95fb87a4192d4a0ddb36cd5df0a36')

prepare() {
  cd $pkgname
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build() {
  cd $pkgname
  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm 644 /dev/null "$pkgdir/etc/rblcheckrc"
}

# vim:set ts=2 sw=2 et:
