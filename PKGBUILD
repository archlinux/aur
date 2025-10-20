# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=ruby-memo_wise
_gemname="${pkgname#ruby-}"
pkgver=1.13.0
pkgrel=1
pkgdesc='The wise choice for Ruby memoization'
arch=('any')
url='https://github.com/panorama-ed/memo_wise'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('97926dffad2d135b5d980e87cdf5e7f4a95f98459538522e6cbe78625727d350bcb39ff28a9cdc7df4de0f1ff55dce1ea85d4c364549910e1eb93cc3499b6188')

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

  # remove unnecessary files and folders
  cd "gems/$_gemname-$pkgver"
  find . -type f -name ".*" -delete
  rm -rf .github logo benchmarks Rakefile Gemfile Gemfile.lock "$_gemname.gemspec"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" ./*.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt

  # generate reproducible documentation
  install -vd "$pkgdir/$_gemdir/doc/$_gemname-$pkgver"
  cd "$pkgdir/$_gemdir/gems/$_gemname-$pkgver"
  rdoc \
    --format ri \
    --output "$pkgdir$_gemdir/doc/$_gemname-$pkgver/ri" \
    ./lib
  # delete unnecessary rdoc metadata file
  rm -f "$pkgdir$_gemdir/doc/$_gemname-$pkgver/ri/created.rid"
}
