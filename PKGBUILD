# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Marcin Wieczorek <marcin@marcin.co>

_gemname=ddmetrics
pkgname=ruby-$_gemname
pkgver=1.0.1
pkgrel=2
pkgdesc="Non-timeseries measurements for Ruby programs"
arch=('any')
url='https://github.com/ddfreyne/ddmetrics'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('de0fbb540c45b84c36c37b652f1a987c49d416e63aff644950091f4a84a76338590e1ce62e20df092488bd43af566dfcdb4a056d57ae306f7f3855bba43326f7')

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
  mv -vt "$pkgdir/usr/share/doc/$pkgname" \
    *.md samples

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
