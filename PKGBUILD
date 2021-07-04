# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=song_pro
pkgname=ruby-$_gemname
pkgver=0.1.10
pkgrel=1
pkgdesc="Provides classes for creating, parsing and rendering SongPro files"
arch=('any')
url="https://songpro.org"
license=('MIT')
depends=('ruby')
makedepends=('ruby-markaby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('52cec1ad6809e55891117ccf68d783c98bfa8a5308b6c5f2950712b208731bcaaff83f02f00e5b776fb421f903eea73ae3191e52da040660cf82476c67cb7131')

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

  cd "gems/$_gemname-$pkgver"
  find . -type f -name ".*" -delete
  rm -rf .github

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" README.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
