# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Artem Vorotnikov <artem at vorotnikov dot me>

_gemname=pry
pkgname=ruby-$_gemname
pkgver=0.13.0
pkgrel=1
pkgdesc='An IRB alternative and runtime developer console.'
arch=(any)
url='http://pryrepl.org'
license=(MIT)
depends=(ruby ruby-coderay ruby-method_source)
checkdepends=(ruby-rspec ruby-rake ruby-bundler)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/pry/$_gemname/archive/v$pkgver.tar.gz)
sha256sums=('aa347b8fb9cbe8b14ce5e9bb9229556a5bbce054e959f90abb939424b26d14c3')

prepare() {
  cd "${_gemname}-${pkgver}"
  sed -i 's|~>|>=|g' "${_gemname}.gemspec"
}

# there's currently a bug in newer rspec-expectations
# check() {
#   cd "${_gemname}-${pkgver}"
#   bundle exec rake
# }

build() {
  cd "${_gemname}-${pkgver}"
  gem build $_gemname.gemspec
}

package() {
  cd "${_gemname}-${pkgver}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$srcdir/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
