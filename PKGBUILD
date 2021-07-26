# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=airbrussh
pkgname=ruby-$_gemname
pkgver=1.4.0
pkgrel=4
pkgdesc='Airbrussh pretties up your SSHKit and Capistrano output'
arch=(any)
url=https://github.com/mattbrictson/airbrussh
license=(MIT)
depends=(ruby ruby-sshkit)
checkdepends=(ruby-bundler ruby-rake ruby-minitest ruby-minitest-reporters ruby-mocha)
makedepends=(git rubygems ruby-rdoc)
options=(!emptydirs)
source=(git+https://github.com/mattbrictson/airbrussh.git?tag=v$pkgver)
noextract=($_gemname-$pkgver.gem)
sha256sums=('SKIP')

prepare() {
  cd ${_gemname}
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
}

build() {
  cd ${_gemname}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname}
  rake test
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

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
