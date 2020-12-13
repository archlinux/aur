# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=capistrano
pkgver=3.14.1
pkgrel=1
pkgdesc="A remote server automation and deployment tool written in Ruby"
arch=(any)
url="http://capistranorb.com"
license=(MIT)
depends=(ruby ruby-rake ruby-sshkit ruby-i18n ruby-airbrussh)
makedepends=(ruby-rdoc rubygems)
options=(!emptydirs)
source=(https://github.com/capistrano/capistrano/archive/v${pkgver}.tar.gz)
sha256sums=('501b8d5a227e8decfebcfbd4ff219cb30b3d04cba97d8177b707fd9e310be4ed')

prepare() {
  cd ${pkgname}-${pkgver}

  sed -i 's|~>|>=|g' ${pkgname}.gemspec
  sed -i 's|gem.files .*|gem.files         = `find`.split("\\n")|' \
    ${pkgname}.gemspec
}

build() {
  cd ${pkgname}-${pkgver}
  gem build ${pkgname}.gemspec
}

package() {
  cd ${pkgname}-${pkgver}
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
