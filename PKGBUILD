# Maintainer: Rubin Simons <me@rubin55.org>
# Contributor: Mark Stenglein <aur@markstenglein.com>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>

_gemname=commander
pkgname=ruby-$_gemname
pkgver=5.0.0
pkgrel=2
pkgdesc='The complete solution for Ruby command-line executables'
arch=(any)
url='https://github.com/commander-rb/commander'
license=(MIT)
depends=(
  ruby
  ruby-highline
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('43ca5701a29ecaf9cc7c3b436da8cb31f6c3547806588979062fa394f501abf7')
b2sums=('3561023e55bcdc9915523213e14654ccfc84375fcbba4aba5cff529c6a33a5be868787a48d5808ac4498def18104256aa26330a04a294a15e19ffe4c8e858bd9')

prepare() {
  cd "${_gemname}-${pkgver}"

  # We don't build from a git checkout, so replace git ls-files call.
  sed --in-place 's|`git ls-files`\.split("\\n")|Dir["lib/**\/*", "bin\/*", "LICENSE", "README.*", "History.*", "Manifest"]|g' \
    "${_gemname}.gemspec"

  # Loosen highline dependency to allow 3.1.x.
  sed --in-place "s/'highline', '~> 3.0.0'/'highline', '>= 3.0.0'/" \
    "${_gemname}.gemspec"
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

  GEM_HOME="tmp_install/${_gemdir}" rspec
}

package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 README.md History.rdoc --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
