# Maintainer: Rubin Simons <me@rubin55.org>

_gemname=rubocop-yard
pkgname=ruby-$_gemname
pkgver=1.4.0
pkgrel=1
pkgdesc="A RuboCop plugin to check YARDoc format"
arch=(any)
url="https://github.com/ksss/rubocop-yard"
license=(MIT)
depends=(
  ruby
  ruby-lint_roller
  ruby-rubocop
  ruby-yard
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-rake
  ruby-rspec
  ruby-rubocop-rspec
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c8f5c6f196edf70f23a6bd84fe166d6f38b50d94ab6e68a27c5e5f3e5ff15d42')
b2sums=('580b84233a6004f1dd96712932bdaa8585fc49a7c1698471c8e949704a241b794af124a51fed4a4bd7ab39918592c00108eb7ed1c53eb3dd22f2cfbf89aeb13a')

prepare() {
  cd "${_gemname}-${pkgver}"

  # Load plugin default config in tests so SupportedStyles is available.
  sed --in-place "/require_relative '..\/lib\/rubocop-yard'/a \\
require 'yaml'\n\
plugin_config = YAML.safe_load_file(File.expand_path('../config/default.yml', __dir__))\n\
plugin_config.each do |cop_name, config|\n\
  existing = RuboCop::ConfigLoader.default_configuration[cop_name] || {}\n\
  RuboCop::ConfigLoader.default_configuration[cop_name] = existing.merge(config)\n\
end" spec/spec_helper.rb
}

build() {
  local _gemdir
  _gemdir="$(gem env gemdir)"
  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_gemname}-${pkgver}.gem"

  # Remove unreproducible files.
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${_gemname}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext/"

  find "tmp_install/${_gemdir}/gems/" \
    -type f \
    \( \
      -iname "*.o" -o \
      -iname "*.c" -o \
      -iname "*.so" -o \
      -iname "*.time" -o \
      -iname "gem.build_complete" -o \
      -iname "Makefile" \
    \) \
    -delete

  find "tmp_install/${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

check() {
  local _gemdir="$(gem env gemdir)"
  cd "${_gemname}-${pkgver}"

  GEM_HOME="tmp_install/${_gemdir}" GEM_PATH="tmp_install/${_gemdir}:${_gemdir}" rspec
}

package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE.txt --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 README.md CHANGELOG.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
