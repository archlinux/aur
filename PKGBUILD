# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=ruby-memo_wise
_gemname="${pkgname#ruby-}"
pkgver=1.7.0
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
sha512sums=('2e41323e89e220e48693dd0ef8d40d7e0de4863935bc1b705941db35420305191251b7d72b6542c59bcf73e4b5646136fdcdefded500d50178bc52759d761ad7')
b2sums=('b3fd72a97d8eff2d73c3eb5fb623c0b5c027185028f8e5acb641b544fb632b7be452906f8284e8eb7d0f353de249ea1f808a503a9d0a2d0b0d1640a003134ccc')

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
