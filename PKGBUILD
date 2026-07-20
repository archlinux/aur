# Maintainer: Rubin Simons <me@rubin55.org>

_gemname=solargraph
pkgname=ruby-$_gemname
pkgver=0.60.2
pkgrel=2
pkgdesc="A Ruby language server"
arch=(any)
url="https://solargraph.org/"
license=(MIT)
depends=(
  ruby
  ruby-ast
  ruby-backport
  ruby-benchmark
  ruby-bundler
  ruby-diff-lcs
  ruby-e2mmap
  ruby-jaro_winkler
  ruby-kramdown
  ruby-kramdown-parser-gfm
  ruby-logger
  ruby-observer
  ruby-open3
  ruby-ostruct
  ruby-parser
  ruby-prism
  ruby-rbs
  ruby-reverse_markdown
  ruby-rdoc
  ruby-rubocop
  ruby-sord
  ruby-thor
  ruby-tilt
  ruby-yard
  ruby-yard-activesupport-concern
  ruby-yard-solargraph
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-pry
  ruby-rake
  ruby-rspec
  ruby-rubocop-rake
  ruby-rubocop-rspec
  ruby-rubocop-yard
  ruby-webmock
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/castwide/${_gemname}/archive/v${pkgver}.tar.gz"
  "no-git-lsfiles-and-lower-rbs-and-rdoc-requirements.patch"
)
sha256sums=(
  '00eec5f04a2c394c832780000c341674dd6db13279497274974d91466fdfeb51'
  '9cd5e6efb07d798b59729ee3b0a4412cee82eddc5fb8e2d84321b54c4e984c1b'
)
b2sums=(
  '3cf59bbd14b17690e2a3d3c52d2afc891c69b307e69ed3c778ac24fe857f2a2cb9f8cfb9bea74ce73a79181e48fb6adcd42197017ec90a59e12777f1ee707fd6'
  'ddd773a98fddd3e173abed141722650e5a2f1f71c27794abfcc10a1a73d2fa7284246e77cea268a24451e100d20a383ebf896ba341708d105ea18978427aafbf'
)

prepare() {
  cd "${_gemname}-${pkgver}"

  # Don't use git ls-files, and lower RBS and rdoc version requirements.
  patch --strip=0 --input="../no-git-lsfiles-and-lower-rbs-and-rdoc-requirements.patch"

  # Skip bundler/setup in tests; we use GEM_HOME/GEM_PATH instead.
  sed --in-place "/require 'bundler\/setup'/d" spec/spec_helper.rb

  # Remove pending from stdlib_map test since the fix is already in place.
  sed --in-place "/pending 'Pathname not in stdlib?'/d" spec/rbs_map/stdlib_map_spec.rb
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
  local _gemdir
  _gemdir="$(gem env gemdir)"
  cd "${_gemname}-${pkgver}"

  # Run tests, but exclude specs that require a Bundler Gemfile.lock, bundle exec, or path-based fixture gem.
  SIMPLECOV_DISABLED=1 GEM_HOME="tmp_install/${_gemdir}" GEM_PATH="tmp_install/${_gemdir}:${_gemdir}" \
    rspec --exclude-pattern "spec/{shell,doc_map,workspace/gemspecs_find_gem,workspace/gemspecs_resolve_require,workspace/gemspecs_fetch_dependencies,workspace/require_paths,yardoc,yard_map/mapper}_spec.rb"
}

package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 README.md CHANGELOG.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
