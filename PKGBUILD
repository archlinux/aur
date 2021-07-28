# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>

_gemname=ddmemoize
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=2
pkgdesc="Adds support for memoizing functions"
arch=('any')
url="https://github.com/ddfreyne/ddmemoize"
license=('MIT')
depends=('ruby' 'ruby-ddmetrics' 'ruby-ref')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('3acf18cc70aed6c35ee98f42e6004ae13c623299abb0e8a3c0dbe7e7908775b9b6e2f81cc2977e4ca04ad584e7b5c43219979187448e3c87e6abc2d78a1c8f15')

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
