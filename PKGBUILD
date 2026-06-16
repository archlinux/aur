# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=shoulda-matchers
pkgname=ruby-$_gemname
pkgver=8.0.1
pkgrel=1
pkgdesc="Shoulda Matchers provides RSpec- and Minitest-compatible one-liners"
arch=(any)
url=https://github.com/thoughtbot/shoulda-matchers
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-activesupport)
makedepends=(rubygems ruby-rdoc)
# checkdepends=(ruby-bundler ruby-rake ruby-rspec ruby-mutex_m)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('aa0d531715882e605f9d26d8a1ffa5fbfc73cb0b02d49958dd6af8ade6bbd97e')

prepare() {
  cd $_gemname-$pkgver
  # sed -i "/require 'appraisal'/d" Rakefile
  # sed -i '/appraisal/d' Gemfile
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

# check() {
#   cd $_gemname-$pkgver
#   local _gemdir="$(gem env gemdir)"
#   GEM_HOME="tmp_install/${_gemdir}" rake spec:unit
#   GEM_HOME="tmp_install/${_gemdir}" rake spec:acceptance
# }

package() {
  cd $_gemname-$pkgver

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
