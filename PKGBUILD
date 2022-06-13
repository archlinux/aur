# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: farwayer <farwayer@gmail.com>

pkgname=ruby-excon
_gemname="${pkgname#ruby-}"
pkgver=0.92.3
pkgrel=1
pkgdesc='EXtended http(s) CONnections'
arch=('any')
url='https://github.com/excon/excon'
license=('MIT')
depends=('ruby')
makedepends=('rubygems' 'ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('8f739431a44dcdd991e45dad3a220814047831b3dc1debbaba0ee63ec34f66c33299016c63211403f8720eaa582063ebd38c11dd76015eae3c56dfab036b4a38')
b2sums=('3736fe39b07c5398f253644b26eb15161454c2fe3acba21738c548184b6afe7cab2f0fbe34111c74c2fe656a68a3c2035ec64ae836c006603943d45f698e040e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete unnecessary files & folders
  cd "$pkgdir/$_gemdir"
  rm -vrf cache
  cd "gems/$_gemname-$pkgver"
  rm -vrf "$_gemname.gemspec"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" \
    CONTRIBUTING.md CONTRIBUTORS.md README.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md

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
