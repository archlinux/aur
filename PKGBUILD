# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contrubutor: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=pleaserun
pkgname=ruby-$_gemname
pkgver=0.0.32
pkgrel=2
pkgdesc="pleaserun"
arch=('any')
depends=('ruby' 'ruby-cabin' 'ruby-clamp' 'ruby-dotenv'
         'ruby-insist' 'ruby-mustache' 'ruby-stud')
makedepends=('ruby-bundler')
url="https://rubygems.org/gems/${_gemname}"
license=('Apache')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
sha256sums=('6c6cb726fdfee6eae62fa270268f75fc4180a0e56ea9a736c14753d79a652c33')

prepare() {
  cd "$srcdir"
  tar zxf data.tar.gz
  rm -f metadata.gz checksums.yaml.gz data.tar.gz
}

build() {
  cd "$srcdir"
  sed -i 's/"mustache", "0.99.8"/"mustache", ">= 1.0"/' $_gemname.gemspec
  gem build $_gemname.gemspec 2>/dev/null $1
}

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" ${srcdir}/${_gemname}-${pkgver}.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
