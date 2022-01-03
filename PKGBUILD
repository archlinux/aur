# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rubocop-performance
pkgname=ruby-${_gemname}
pkgver=1.13.1
pkgrel=1
pkgdesc="An extension of RuboCop focused on code performance checks"
arch=(any)
depends=(ruby ruby-rubocop ruby-rubocop-ast)
checkdepends=(ruby-rspec)
makedepends=(rubygems ruby-rdoc)
url=https://docs.rubocop.org/rubocop-performance
license=(MIT)
options=(!emptydirs)
source=(https://github.com/rubocop/${_gemname}/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('fd51b67a7f740c4c108417fe22e05a2ebae035a4cdd5ff3cf334adda14f28998')

prepare() {
  cd $_gemname-$pkgver
  local _files="$(grep s.files rubocop-performance.gemspec | \
    sed -r 's/^.*git ls-files -z (.*)`.*$/\1/')"
  sed -i "s|git ls-files -z ${_files}|find ${_files} -print0|" \
    ${_gemname}.gemspec
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rspec
}

package() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
