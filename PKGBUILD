# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Haochen Tong <i at hexchain dot org>

_gemname=binman
pkgname=ruby-$_gemname
pkgver=5.1.0
pkgrel=2
pkgdesc="Produces UNIX manual pages for executable scripts"
arch=('any')
url="https://github.com/sunaku/binman"
license=('ISC')
depends=('ruby' 'ruby-opener')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('1ee74ba77c6f92f815d876dfded6fa236b79d56599cfb201b63f0ecb2e4a9254a38a69c656f8328c5902db0b29d66ef1e17b23d60ff651a6e62f96fb32519b81')

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
  rm -vrf cache

  # remove unnecessary files
  cd "gems/$_gemname-$pkgver"
  rm -f .gitignore

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" \
    README.markdown VERSION.markdown

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
