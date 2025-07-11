# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_name='uri-ssh_git'
pkgname="ruby-uri-ssh_git"
pkgver=2.0.0
pkgrel=2
pkgdesc='Parse and build git repository url via ssh protocol.'
arch=('any')
url="https://github.com/packsaddle/${pkgname}"
license=('MIT')
depends=(ruby)
makedepends=('git')
checkdepends=('ruby-bundler' 'ruby-rake' 'ruby-test-unit' 'ruby-yard')
options=('!emptydirs')
source=("$pkgname::git+$url#tag=v$pkgver")
b2sums=('d7b59114e0f721302ec410902d0c95a8f96236475c53f5d3a3f571253c70f32a68d5bb59d7c4fdfedb4520a4ab3b8b942faae669d3dca2cd3033b340d3dc2830')

prepare() {
  cd "${pkgname}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_name}.gemspec"
}

build() {
  cd "${pkgname}"

  local _gemdir="$(gem env gemdir)"

  gem build "${_name}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_name}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${_name}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${_name}-${pkgver}/ri/ext/"

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
  cd "${pkgname}"

  local _gemdir="$(gem env gemdir)"

  GEM_HOME="tmp_install/${_gemdir}" rake test
}

package() {
  cd "${pkgname}"

  cp --archive --verbose tmp_install/* "${pkgdir}"
}
