# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='bigdecimal'
pkgname="ruby-${_gemname}"
pkgver=3.1.2
pkgrel=1
pkgdesc='This library provides arbitrary-precision decimal floating-point number class'
arch=('x86_64')
url="https://github.com/ruby/bigdecimal"
license=('RUBY')
options=(!emptydirs)
depends=('ruby')
makedepends=('ruby-bundler' 'ruby-rake' 'ruby-rake-compiler')
checkdepends=('ruby-minitest')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('43aa08551bec0855223a0ffe787e62f67fc92824b766efc85fffc32f7b81e0850b199f0668fb0d23ed23e07e27030e25f885162bbe08489ea5df2978b69d4716')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

check() {
  cd "${_gemname}-${pkgver}"

  rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "${pkgdir}/${_gemdir}/cache/" \
    "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/vendor/" \
    "${pkgdir}/${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext/"

  find "${pkgdir}/${_gemdir}/gems/" \
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

  find "${pkgdir}/${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete

  install -Dm 644 CHANGES.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
