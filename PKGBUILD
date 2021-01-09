# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=capistrano
pkgver=3.15.0
pkgrel=1
pkgdesc="A remote server automation and deployment tool written in Ruby"
arch=(any)
url="http://capistranorb.com"
license=(MIT)
depends=(ruby ruby-rake ruby-sshkit ruby-i18n ruby-airbrussh)
makedepends=(git ruby-rdoc rubygems)
options=(!emptydirs)
source=(git+https://github.com/capistrano/capistrano.git?tag=v${pkgver})
sha256sums=('SKIP')

prepare() {
  cd ${pkgname}
  sed -i 's|~>|>=|g' ${pkgname}.gemspec
}

build() {
  cd ${pkgname}
  gem build ${pkgname}.gemspec
}

package() {
  cd ${pkgname}
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $pkgname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
