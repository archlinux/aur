# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

_gemname=inifile
pkgname=ruby-${_gemname}
pkgver=3.0.0
pkgrel=2
pkgdesc='Ruby package for reading and writing INI files'
arch=('x86_64')
url="https://rubygems.org/gems/${_gemname}"
license=('MIT')
depends=('ruby' 'rubygems')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TwP/${_gemname}/archive/refs/tags/${_gemname}-${pkgver}.tar.gz")
sha256sums=('8e9ff4bd503b2e9c4cf015f184a34e5d3f74f2d108f93125d968699f631143ab')

prepare() {
  cd "${_gemname}-${_gemname}-${pkgver}"

  sed -r 's|git ls-files -z|find|g' -i ${_gemname}.gemspec
  sed -r 's|"\\x0"|\$INPUT_RECORD_SEPARATOR|' -i ${_gemname}.gemspec
}

build() {
  cd "${_gemname}-${_gemname}-${pkgver}"

  gem build ${_gemname}.gemspec
}

package() {
  cd "${_gemname}-${_gemname}-${pkgver}"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  sed -n '/MIT License/,/ THE SOFTWARE./p' README.md > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
