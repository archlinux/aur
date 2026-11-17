# Maintainer: Rubin Simons <me@rubin55.org>

_gemname=solargraph
pkgname=ruby-$_gemname
pkgver=0.62.2
pkgrel=1
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
  "gemspec-compatibility.patch"
)
sha256sums=('b9b1230439353c0b2b00d5922f907daa79d503662e93f59232e5e18bb3d2f3a1'
            'a7b453c20228bcab72939e611cb7abc6598adfafdae664a5930dbb5d7afc203c')
b2sums=('fa47e53ce279284f3397d885c3030025cbba67413b522db094348988df7aa60770a232ad383f92287711dda1c31c391b8572efbc82ee9033b28587013d0b1fbb'
        'abaa9f5ef3b0924596b9665389e930bbcf35f0253e8e48496f36cf7f1156da8ff8f64db93655f173b237706a4a70c912dc1024a903f5f79e1997384a5464b50b')

prepare() {
  cd "${_gemname}-${pkgver}"

  # Use packaged files and relax gem version requirements.
  patch --strip=0 --input="../gemspec-compatibility.patch"

  # Skip bundler/setup in tests; we use GEM_HOME/GEM_PATH instead.
  sed --in-place "/require 'bundler\/setup'/d" spec/spec_helper.rb

  # Skip; bundler ignores Arch's nokogiri as its gemspec deps differ.
  sed --in-place "s/it 'loads gems from transitive dependencies'/xit 'loads gems from transitive dependencies'/" spec/external_spec.rb
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
    rspec --exclude-pattern "spec/{shell,workspace/require_paths,yard_map/mapper}_spec.rb"
}

package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 README.md CHANGELOG.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
