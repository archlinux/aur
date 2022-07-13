# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=ruby-dry-system
_gemname="${pkgname#ruby-}"
pkgver=0.25.0
pkgrel=1
pkgdesc='Organize your code into reusable components'
arch=('any')
url='https://github.com/dry-rb/dry-system'
license=('MIT')
depends=(
  'ruby'
  'ruby-concurrent'
  'ruby-dry-auto_inject'
  'ruby-dry-configurable'
  'ruby-dry-container'
  'ruby-dry-core'
  'ruby-dry-inflector'
  'ruby-dry-struct'
)
makedepends=('git' 'ruby-rdoc')
options=('!emptydirs')
_commit='c65aa38d6f97e6c5b3f9c0101d0453d15e91377e'
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
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --verbose \
    --local \
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
