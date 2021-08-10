# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Husam Bilal <husam212@gmail.com>

_gemname=rubygems-tasks
pkgname=ruby-$_gemname
pkgver=0.2.5
pkgrel=1
pkgdesc="Simple Rake tasks for managing and releasing Ruby projects"
arch=(any)
url=https://github.com/postmodern/rubygems-tasks
license=(MIT)
depends=(ruby ruby-rake ruby-irb)
checkdepends=(ruby-bundler ruby-rspec)
makedepends=(git rubygems ruby-rdoc)
options=(!emptydirs)
source=(git+https://github.com/postmodern/rubygems-tasks.git?tag=v$pkgver)
sha256sums=('SKIP')

prepare() {
  cd ${_gemname}
  sed -i '/yard/Id' Rakefile
  sed -i '/yard/d' Gemfile
  sed -i '/kramdown/d' Gemfile
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

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 ChangeLog.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
