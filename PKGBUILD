# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=http-accept
pkgname=ruby-${_gemname}
pkgver=2.1.1
pkgrel=1
pkgdesc="Parse Accept and Accept-Language HTTP headers in Ruby"
arch=(any)
url=https://github.com/socketry/http-accept
license=(MIT)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-rspec)
makedepends=(git rubygems ruby-rdoc)
source=(git+https://github.com/socketry/http-accept.git?tag=v$pkgver)
sha256sums=('SKIP')

prepare() {
  cd ${_gemname}
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
  sed -i '/covered/d' ${_gemname}.gemspec
  sed -i '/covered/d' spec/spec_helper.rb

  # there is no license file in the repo, but we can extract one from the readme
  # https://stackoverflow.com/a/35966027
  sed '/## License/,$!d' README.md > LICENSE
}

build() {
  cd ${_gemname}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname}
  rake spec
}

package() {
  cd ${_gemname}
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
