# Maintainer: Rubin Simons <me@rubin55.org>

_gemname=solargraph
pkgname=ruby-$_gemname
pkgver=0.61.0
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
  "no-git-lsfiles-and-lower-rbs-and-rdoc-requirements.patch"
)
sha256sums=('5b5585d5047c6623ee150b8deb6b7d68593ed804fa96797f934fb32bb8e510d3'
            'e1d0054dd02c42efbd598d49c49d3f6a190ef234ca1b1b222c109d416f0461b6')
b2sums=('58adcae81f6828c254a9deb3dd6fe7ed4081d4dbdc17278f8ba1e8d04e497aa2b6111e41f5d803c95bf360837dd1a3ddbbbbeea80f6b7cfb0d6ea3b80afb7d17'
        'eca592100065db2dae1028f8762ceec4ed56e42609cddf901b7b0d858445e5f3034595ee65ede9d8a56d79944f4aa568579afb7fddf775ec17e0c6579c230998')

prepare() {
  cd "${_gemname}-${pkgver}"

  # Don't use git ls-files, and lower RBS and rdoc version requirements.
  patch --strip=0 --input="../no-git-lsfiles-and-lower-rbs-and-rdoc-requirements.patch"

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
