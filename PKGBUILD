# Maintainer: James An <james@jamesan.ca>
# Contributor: fzerorubigd <fzerorubigd {AT} gmail>

_gemname=skinny
pkgname=ruby-$_gemname
pkgver=0.2.3
pkgrel=2
pkgdesc='Simple, upgradable Thin WebSockets.'
arch=('any')
url="http://github.com/sj26/$_gemname"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
provides=('$_gemname=$pkgver')
conflicts=('$_gemname')
source=(
  "http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem"
  dependency.patch
)
noextract=("$_gemname-$pkgver.gem")
md5sums=('bf45ec49e628b05c88eac37fb9e8e8f1'
         '0aac231bc310037862c31d422da3c651')

prepare() {
  gem unpack "$_gemname-$pkgver.gem"
  gem spec "$_gemname-$pkgver.gem" --ruby >| "$_gemname-$pkgver/$_gemname-$pkgver.gemspec"

  cd "$_gemname-$pkgver"
  patch -p1 < ../dependency.patch
  gem build "$_gemname-$pkgver.gemspec"
}

package() {
  cd "$_gemname-$pkgver"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

