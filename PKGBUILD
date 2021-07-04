# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-redcarpet
_gemname="${pkgname#ruby-}"
pkgver=3.5.1
pkgrel=1
pkgdesc='Markdown that smells nice'
arch=('any')
url='https://github.com/vmg/redcarpet'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("$_gemname-$pkgver.gem::https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('e3937c47c583e8e286e424856e0ef42c5e231628afd492decb8476b80b909ab1ffbe58704adccf5e4c9f4202db9d2f5e5437969a0e10ece27e5ec310ed5bf038')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -rf cache

  # delete unnecessary files & folders
  cd "gems/$_gemname-$pkgver"
  rm -rf test ext

  # documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -v README.markdown "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -v COPYING "$pkgdir/usr/share/licenses/$pkgname"
}
