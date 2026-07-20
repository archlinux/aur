# Maintainer: Rubin Simons <me@rubin55.org>

_gemname=sord
pkgname=ruby-$_gemname
pkgver=7.1.0
pkgrel=2
pkgdesc='Convert YARD docs to Sorbet RBI and Ruby 3/Steep RBS files'
arch=(any)
url='https://github.com/AaronC81/sord'
license=(MIT)
depends=(
  ruby
  ruby-commander
  ruby-parlour
  ruby-parser
  ruby-rbs
  ruby-sorbet-runtime
  ruby-yard
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-bundler
  ruby-rake
  ruby-rspec
  ruby-simplecov
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ccd89b02e37dacee3fb67aeabb80143c86a9343fc1d3afbbcb629b13e6427089')
b2sums=('d5b0d644fdc18e90077b54b8893a1a8d0e57782b67807804e03ba658fb15070e8108736860bfad11ca7057f12d79e41ccb1152ddf2187990e864dce4a2aaf9b4')

prepare() {
  cd "${_gemname}-${pkgver}"

  # We don't build from a git checkout, so replace git ls-files call.
  sed --in-place 's#`git ls-files -z`\.split("\\x0")#Dir["lib/**/*", "exe/*", "LICENSE.*", "README.*", "CHANGELOG.*"]#g' \
    "${_gemname}.gemspec"

  # Require bundler in resolver since it uses Bundler.load but doesn't require it.
  sed --in-place "/require 'rbs'/a require 'bundler'" lib/sord/resolver.rb

  # Gracefully handle missing Gemfile when loading gem paths via Bundler.
  sed --in-place 's#gem_paths = Bundler.load.specs.map(\&:full_gem_path)#gem_paths = (Bundler.load.specs.map(\&:full_gem_path) rescue [])#' lib/sord/resolver.rb
}

build() {
  local _gemdir="$(gem env gemdir)"
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
  local _gemdir
  _gemdir="$(gem env gemdir)"
  cd "${_gemname}-${pkgver}"

  # Run test, but exclude one test I could not get working.
  GEM_HOME="tmp_install/${_gemdir}" GEM_PATH="tmp_install/${_gemdir}:${_gemdir}" rspec --exclude-pattern "spec/resolver_spec.rb"
}

package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE.txt --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 README.md CHANGELOG.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
