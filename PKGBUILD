# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=memo_wise
pkgname=ruby-$_gemname
pkgver=1.5.0
pkgrel=2
pkgdesc="The wise choice for Ruby memoization"
arch=('any')
url="https://github.com/panorama-ed/memo_wise"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('1576ccf2f4d6a4f665239c524d820ccb2bec5ce9cfea4c3e397d722e9b800b5864393b91dc9e423a75f75ab7586db276c7cab43839eb4f257c9e7cfb25617bb7')
b2sums=('4e5053f96089021106c60e386463d0e3ba7d5f0bb5c39e5f18d3bea3fad87087fc126dcab29b96ae228383b687f50b7d667c2a4ea5f660a08a532caf5665eb8f')

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
