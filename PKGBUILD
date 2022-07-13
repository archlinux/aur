# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-files
pkgname=ruby-$_gemname
pkgver=0.2.0
pkgrel=1
pkgdesc='A library that provides a great abstraction for file manipulations'
arch=('any')
url='https://github.com/dry-rb/dry-files'
license=('MIT')
depends=('ruby')
makedepends=('git' 'ruby-rdoc')
options=('!emptydirs')
_commit='82d44ca50f910ba3dfdd4b926b019fd599b63614'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  gem build
}

package() {
  local _gemdir="$(gem env gemdir)"

  gem install \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$pkgname/$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -vrf cache

  # delete unnecessary files & folders
  cd "gems/$_gemname-$pkgver"
  rm -vrf "$_gemname.gemspec"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
