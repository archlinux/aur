# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=ruby-lint
pkgname=$_gemname
pkgver=2.3.1
pkgrel=2
pkgdesc="A linter and static code analysis tool for Ruby"
arch=('any')
url="https://gitlab.com/yorickpeterse/ruby-lint"
license=('MPL')
depends=('ruby' 'ruby-parser' 'ruby-slop')
makedepends=('rubygems' 'ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('71f3e221c84a74ba072d427829dc50caf32baa5980385d1b6389d24efaa6d5cfc4c753f58bf19c671f24d33be4eb43fcead49bff14e86bedac324dcaa6078bce')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -vrf cache

  # delete unnecessary files & folders
  cd "gems/$_gemname-$pkgver"
  rm -vrf checksum "$_gemname.gemspec"
  find . -type f -name ".*" -delete

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" doc *.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
