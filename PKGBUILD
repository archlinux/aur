# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farwayer <farwayer@gmail.com>

_gemname=digest-crc
pkgname=ruby-${_gemname}
pkgver=0.6.4
pkgrel=1
pkgdesc="A Cyclic Redundancy Check (CRC) library for Ruby"
arch=(x86_64)
url=https://github.com/postmodern/digest-crc
license=(MIT)
depends=(ruby)
checkdepends=(ruby-rspec)
makedepends=(git rubygems ruby-rdoc ruby-bundler ruby-rake ruby-rubygems-tasks)
options=(!emptydirs)
source=(git+https://github.com/postmodern/digest-crc.git?tag=v$pkgver)
sha256sums=('SKIP')

prepare() {
  cd ${_gemname}
  sed -i '/kramdown/d' Gemfile
  sed -i '/yard/d' Gemfile
  sed -i '/github-markup/d' Gemfile
  sed -i '/yard/Id' Rakefile
}

build() {
  cd ${_gemname}
  # rake build:c_exts
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

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 ChangeLog.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
