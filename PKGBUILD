# Contributor: Armin Preiml <apreiml@strohwolke.at>
# Contributor: xiretza <aur@xiretza.xyz>

_name=enumerable-statistics
pkgname=ruby-$_name
pkgver=2.0.8
pkgrel=1
pkgdesc='Enumerable::Statistics provides some methods to calculate statistical summary in arrays and enumerables.'
arch=(x86_64)
url='https://github.com/mrkn/enumerable-statistics'
license=(MIT)
makedepends=(git)
checkdepends=(ruby-bundler ruby-rake ruby-rake-compiler ruby-rspec ruby-test-unit ruby-fuubar ruby-yard)
depends=(ruby)
source=("git+$url#tag=v$pkgver")
sha256sums=('f6d90f1e9ae836dc48ebf67e90c626c299d6d5a3c6cb514eef3e3192813a4167')

build() {
  cd "${_name}"

  local _gemdir="$(gem env gemdir)"

  gem build "${_name}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --build-root "tmp_install" \
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
  cd "${_name}"

  local _gemdir="$(gem env gemdir)"

  GEM_HOME="tmp_install/${_gemdir}" rake test
}

package() {
  cd "${_name}"

  cp --archive tmp_install/* "${pkgdir}"

  install -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
