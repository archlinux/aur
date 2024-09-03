# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Maintainer: Richard Lees <git zero at bitservices dot io>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: farwayer <farwayer@gmail.com>

pkgname=ruby-excon
_gemname="${pkgname#ruby-}"
pkgver=0.111.0
pkgrel=3
pkgdesc='EXtended http(s) CONnections'
arch=('any')
url='https://github.com/excon/excon'
license=('MIT')
depends=('ruby')
makedepends=('git' 'rubygems' 'ruby-rdoc')
options=('!emptydirs')
source=("$pkgname::git+$url#tag=v$pkgver")
b2sums=('1e1af72b5f9560890a8c788cb795d4d96d42fafbb06bd73cf3fddef0fb9e4b762309dc768804b32c9691007ea103b18d8a99a05babd8651c109448524ad6c880')

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
