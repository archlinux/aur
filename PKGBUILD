# Maintainer: Mario Finelli <mario at fineli dot li>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Hugo Osvaldo Barrera <hugo at barrera dot io>

_gemname=rotp
pkgname=ruby-$_gemname
pkgver=6.3.0
pkgrel=1
pkgdesc="Ruby One Time Password library"
arch=(any)
url=https://github.com/mdp/rotp
license=(MIT)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-rake ruby-rspec ruby-simplecov ruby-timecop)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('03e8a733af98d5c25c34a4043f22925bc9ab1734ffe9bc3bf44c4577ad0e2a71')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's/git ls-files --/find/' ${_gemname}.gemspec
  sed -i 's/git ls-files/find/' ${_gemname}.gemspec

  # 1) ROTP::HOTP#provisioning_uri with non-standard provisioning_params includes the issuer as parameter
  #    Failure/Error: let(:params) { CGI.parse URI.parse(uri).query }
  #
  #    NameError:
  #      uninitialized constant URI
  #    # ./spec/lib/rotp/hotp_spec.rb:112:in `block (3 levels) in <top (required)>'
  #    # ./spec/lib/rotp/hotp_spec.rb:134:in `block (4 levels) in <top (required)>'
  echo 'require "uri"' >> spec/spec_helper.rb
}

build() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem build "${_gemname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_gemname}-${pkgver}.gem"

  # remove unrepreducible files
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
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"
  GEM_HOME="tmp_install/${_gemdir}" rspec
}

package() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
