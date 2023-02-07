# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=git
pkgname=ruby-$_gemname
pkgver=1.13.2
pkgrel=1
pkgdesc="Ruby library to manipulate git repositories by wrapping system calls to the git binary"
arch=(any)
url=https://github.com/ruby-git/ruby-git
license=(MIT)
depends=(ruby git ruby-addressable ruby-rchardet)
checkdepends=(ruby-bundler ruby-rake ruby-minitar ruby-test-unit ruby-yard)
makedepends=(rubygems ruby-rdoc)
source=(git+https://github.com/ruby-git/ruby-git.git#tag=v$pkgver)
sha256sums=('SKIP')

prepare() {
  cd ${pkgname}
  sed -i 's|~>|>=|g' ${_gemname}.gemspec

  # we don't care about docs coverage
  sed -i -e "/require 'yardstick\/rake\/verify'/,+5d" Rakefile
}

build() {
  cd ${pkgname}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${pkgname}
  rake test
}

package() {
  cd ${pkgname}
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
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
