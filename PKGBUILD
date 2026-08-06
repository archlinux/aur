# Maintainer: Rubin Simons <me@rubin55.org>

_gemname=solargraph
pkgname=ruby-$_gemname
pkgver=0.60.3
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
sha256sums=('80206f323090ab339843d608d0f5519f9b0164e4d2ac40e03646a170d7cc797c'
            '71eb4eccd719d0d752b279793ba528cdadfa7bd3c04bfadc2eba6f4236e4b0a7')
b2sums=('862dce5fbc09030bac47aab6169a36981f086bcd1221554f4a4345ba7d7288b393b07b1207ed33523cd1b5c9f6cfedf8a586a37228fcd7ab6b904a333d57be7a'
        '940de82bb6e39225a31f0ca80329a1890f9a82b0b63689218ac02d1fdb9e71583f8c674eb41f1aa648261fbeabd9ecb3ce6c8304ae13cd51c82f230091b9032a')

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
