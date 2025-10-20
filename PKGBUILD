# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Maintainer: Richard Lees <git zero at bitservices dot io>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: farwayer <farwayer@gmail.com>

pkgname=ruby-excon
_gemname="${pkgname#ruby-}"
pkgver=1.3.0
pkgrel=1
pkgdesc='Usable, fast, simple HTTP 1.1 for Ruby'
arch=('any')
url='https://github.com/excon/excon'
license=('MIT')
depends=('ruby-logger')
makedepends=('git' 'rubygems' 'ruby-rdoc')
options=('!emptydirs')
source=("$pkgname::git+$url#tag=v$pkgver")
b2sums=('fc07239a85d0a9f6c4b2925683321a5b3eaf907ab9683e4a171c376244a76d3944511fe1b1346d16d7251d435c4d857db636a62c401f8a352963adb8a6ff981e')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  gem build
}

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --local \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$pkgname/$_gemname-$pkgver.gem"

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
