# Maintainer: Rubin Simons <me@rubin55.org>
# Contributor: mnussbaum <michaelnussbaum08@gmail.com>

_gemname=parlour
pkgname=ruby-$_gemname
pkgver=9.1.2
pkgrel=2
pkgdesc='A type information generator, merger and parser for Sorbet and Ruby 3/Steep'
arch=(any)
url='https://github.com/AaronC81/parlour'
license=(MIT)
depends=(
  ruby
  ruby-commander
  ruby-parser
  ruby-rainbow
  ruby-sorbet-runtime
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "parlour-test-setup.patch")
sha256sums=('2f69383bf52243ab502dcac7553582d5487eae877390b5716118e385cf82c09d'
            '0eb683b69981518410b5db456b670c6f8ff3f325222616dfa3a88a8fdea30944')
b2sums=('302dd5fa054613187d21db501f6f2ea3f8e338fe91214247f657de2c79bbc4ff779ae7477e3678ae093ec289677706409f7128521a65f43d50e7390a82ae36b1'
        '6da24a8c0fb57b5a830337f48fb2358c433ebc3ae103be6f9ec759b946ab657390e3031f992c5812fa86081e3472823487ecdbe2c84c0d89e92283980bba3b35')

prepare() {
  cd "${_gemname}-${pkgver}"

  # We don't build from a git checkout, so replace git ls-files call.
  sed --in-place 's#`git ls-files -z`\.split("\\x0")#Dir["lib/**/*", "exe/*", "LICENSE.*", "README.*", "CHANGELOG.*"]#g' \
    "${_gemname}.gemspec"

  # Use bundler instead of bundler/setup, mark sorbet-dependent tests as pending.
  patch --strip=1 --input="../parlour-test-setup.patch"
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

  # Run tests, but exclude cli_spec, as it runs parlour in a subprocess with BUNDLE_GEMFILE and that needs a full bundle.
  GEM_HOME="tmp_install/${_gemdir}" rspec --exclude-pattern "spec/cli_spec.rb"
}

package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE.txt --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 README.md CHANGELOG.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
