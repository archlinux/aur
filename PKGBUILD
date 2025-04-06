# Contributor: Armin Preiml <apreiml@strohwolke.at>
# Contributor: xiretza <aur@xiretza.xyz>

_name=unicode_plot
_reponame=unicode_plot.rb
pkgname=ruby-$_name
pkgver=0.0.5
pkgrel=2
pkgdesc='UnicodePlot provides the feature to make charts with Unicode characters.'
arch=(any)
url='https://github.com/red-data-tools/unicode_plot.rb'
license=(MIT)
makedepends=(git)
checkdepends=(ruby-rake ruby-bundler ruby-yard ruby-test-unit)
depends=(ruby ruby-enumerable-statistics)
options=(!emptydirs)
source=("git+$url#tag=v$pkgver")
sha256sums=('56a24858a091cc32ba2cd23f4b2f8307530736574a41a148935ea64c9faa4424')

build() {
  cd "${_reponame}"

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
  cd "${_reponame}"

  local _gemdir="$(gem env gemdir)"

  GEM_HOME="tmp_install/${_gemdir}" rake test
}

package() {
  cd "${_reponame}"

  cp --archive tmp_install/* "${pkgdir}"

  install -D --mode=0644 LICENSE.txt --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
