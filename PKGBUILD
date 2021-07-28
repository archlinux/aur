# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Marcin Wieczorek <marcin@marcin.co>

_gemname=slow_enumerator_tools
pkgname=ruby-$_gemname
pkgver=1.1.0
pkgrel=2
pkgdesc="Tools for transforming Ruby enumerators that produce data slowly and unpredictably"
arch=('any')
url="https://github.com/ddfreyne/slow_enumerator_tools"
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('f8566bd15b37496be4fb7613e97367e62329f53a9da1c5f6c9247cd6fee220063bb91dd77e137bf6e3b419e4e9d2878bbb85747e2f0a939b1fe6740acf87d81f')

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

  # delete unnecessary files & folders
  cd "gems/$_gemname-$pkgver"
  find . -type f -name ".*" -delete
  rm -vrf spec scripts Gemfile Rakefile "$_gemname.gemspec"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
