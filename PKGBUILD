# Maintainer: envolution
# Contributor:  Anton Kudelin <kudelin at protonmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
# Contrubutor: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=pleaserun
pkgname=ruby-$_gemname
pkgver=0.0.32
pkgrel=4
pkgdesc="pleaserun"
arch=('any')
depends=('ruby' 'ruby-cabin' 'ruby-clamp' 'ruby-dotenv'
         'ruby-insist' 'ruby-mustache' 'ruby-stud')
makedepends=('ruby-bundler')
url="https://rubygems.org/gems/${_gemname}"
license=('Apache-2.0')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
sha256sums=('4dd8db18b81b48e2a875ec0c7fff3869454d1f93a9f5e2e6c4eb88812870d3ab')

prepare() {
  rm -rf rebuild; mkdir -p "rebuild"
  tar zxf data.tar.gz -C rebuild/
  rm -f rebuild/{metadata.gz,checksums.yaml.gz,data.tar.gz}
  sed -i 's/"mustache", "0.99.8"/"mustache", ">= 1.0"/' rebuild/$_gemname.gemspec
}

build() {
  cd rebuild
  gem build $_gemname.gemspec 2>/dev/null $1
}

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" ${srcdir}/rebuild/${_gemname}-${pkgver}.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -Dm644 rebuild/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}
# vim:set ts=2 sw=2 et:
