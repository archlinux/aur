# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rchardet
pkgname=ruby-$_gemname
pkgver=1.8.0
pkgrel=2
pkgdesc="Character encoding auto-detection in Ruby"
arch=(any)
url=https://github.com/jmhodges/rchardet
license=(LGPL)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-minitest)
makedepends=(ruby-rdoc rubygems)
options=(!emptydirs)
source=(https://github.com/jmhodges/rchardet/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('663ebadfca8ac4b93f0cd6ddb9c24139fc0cc5e75fd64aabcb75b059e066f0ae')

prepare() {
  cd "$_gemname-$pkgver"
  # "LGPL" is invalid and so gem build complains
  # the license file in the readme is LGPL 2.1
  sed -i 's/"LGPL"/"LGPL-2.1-or-later"/' $_gemname.gemspec

  # remove stuff that we don't need to run minitest
  for pkg in bundler/setup bundler/gem_tasks wwtd/tasks bump/tasks; do
    sed -i "s|require '$pkg'||" Rakefile
  done

  sed -i '/wwtd/d' Gemfile
  sed -i '/bump/d' Gemfile
  sed -i '/minitest-rg/d' Gemfile
  sed -i '/minitest\/rg/d' test/test_helper.rb

  rm Gemfile.lock

  # keeping the gemfile requires building in a chroot
  rm Gemfile
}

build() {
  cd "$_gemname-$pkgver"
  gem build ${_gemname}.gemspec
}

check() {
  cd "$_gemname-$pkgver"
  rake
}

package() {
  cd "$_gemname-$pkgver"
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 Readme.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
