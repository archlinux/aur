# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=markaby
pkgname=ruby-$_gemname
pkgver=0.9.0
pkgrel=1
pkgdesc="_why's markaby templating language"
arch=('any')
url="https://rubygems.org/gems/markaby"
license=('MIT')
depends=('ruby')
makedepends=('ruby-builder')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('72cc3665c0397a5ed931d884e01537755460cb89deba17ed87362f08742d23715ece8e957cb41ed6d0599e3a7b684f96c0f58a9f7a9cd89aca1277e8615eab2b')

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

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" \
    CHANGELOG.rdoc README.rdoc

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
