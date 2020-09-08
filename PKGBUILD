# Maintainer :                           Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor & [core]/less Maintainer : Sébastien "Seblu" Luttringer <seblu@archlinux.org>
# Contributor :                          Allan McRae <allan@archlinux.org>
# Contributor :                          judd <jvinet@zeroflux.org>


pkgname=less-osc8-git

pkgver() { git -C "${pkgname%-osc8-git}" describe --tags | sed 's/^v//;s/-/.r/;s/-g/./'; }
pkgver=564.r4.9ea92b9
pkgrel=2

pkgdesc='A terminal based program for viewing text files, patched with OSC 8 hyperlink support'
arch=('i686' 'x86_64')
url=http://www.greenwoodsoftware.com
license=('GPL3'
         'custom:Less License')

makedepends=('git')
depends=('ncurses' 'pcre')

provides=("${pkgname%-osc8-git}" "${pkgname%-git}")
conflicts=("${pkgname%-osc8-git}" "${pkgname%-git}")

changelog=NEWS
source=("git+https://github.com/gwsw/${pkgname/-osc8-/.}"
        'osc8.patch')
sha256sums=('SKIP'
            'acbc974f0e203e68413c21a4c55c76452d192e8e4626fc626c504735baef1fd6')


prepare() {
  cd "${pkgname%-osc8-git}"
  msg2 "$(gettext 'Applying patch %s...')" osc8.patch
  patch -Np1 -i ../osc8.patch
}

build() {
  cd "${pkgname%-osc8-git}"
  make -f Makefile.aut distfiles
  ./configure --prefix=/usr --sysconfdir=/etc --with-regex=pcre
  make
}

package() {
  cd "${pkgname%-osc8-git}"
  make DESTDIR="$pkgdir" install
  install -Dm644 {README,INSTALL,NEWS} -t"$pkgdir/usr/share/doc/${pkgname%-osc8-git}/"
  install -Dm644 {copyright,LICENSE}   -t"$pkgdir/usr/share/licenses/${pkgname%-osc8-git}/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
