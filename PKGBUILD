# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=slim
pkgname=ruby-$_gemname
pkgver=4.1.0
pkgrel=1
pkgdesc="a template language whose goal is reduce the syntax to the essential parts"
arch=(any)
url=http://slim-lang.com
license=(MIT)
depends=(ruby ruby-temple ruby-tilt)
checkdepends=(ruby-rake ruby-rack-test ruby-benchmark-ips ruby-erubis ruby-haml ruby-sassc ruby-kramdown ruby-minitest)
makedepends=(git rubygems ruby-rdoc)
options=(!emptydirs)
source=(git+https://github.com/slim-template/slim.git?tag=v$pkgver)
sha256sums=('SKIP')

prepare() {
  cd ${_gemname}

  # TODO: open PR upstream
  sed -i "/require 'helper'/a require 'ostruct'" test/core/test_code_evaluation.rb
  sed -i 's/OpenStruct/::OpenStruct/' test/core/test_code_evaluation.rb
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

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGES "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
}

# vim: set ts=2 sw=2 et:
