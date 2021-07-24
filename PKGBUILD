# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Haochen Tong <i at hexchain dot org>

_gemname=opener
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=2
pkgdesc="A library for opening things in a cross-platform way"
arch=('any')
url="https://github.com/sunaku/opener"
license=('custom:Ruby')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
# last known Ruby version
# used to pin licenses if they change in the future
_rubyver=3.0.2
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  "https://raw.githubusercontent.com/ruby/ruby/v${_rubyver/./_}/COPYING"
  "https://raw.githubusercontent.com/ruby/ruby/v${_rubyver/./_}/BSDL"
)
noextract=("$_gemname-$pkgver.gem")
b2sums=('cd6c5436d209b26b7cb4dbcfbce7f653b1025d0396fe4c2910ebcad0b494bf9b1f92e2e0f71c34a33a607511c07f3775e636f0509736c3317b50b55f1821de9f'
        'edbb6ed3aa403e67a5b4b9550cc7f88d766face1d7bfc03bd23942b73f705eab0f160fecaaceaa56867639dd56c96cc74721776b53ff58370f30f5b93ba77f70'
        '89aa51a8f6610bb3102196a22398a897b7e05841f809c302eb38e90ee6b302339fb57f449ed4d5081933d4f0c0e06fec36656d4f497c5ed4489524b5ed3238fc')

package() {
  # licenses
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING BSDL

  # get system-wide Gem dir
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

  # move documentation
  cd "gems/$_gemname-$pkgver"
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" README.markdown
}
