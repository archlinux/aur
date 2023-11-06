# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=faker
pkgname=ruby-$_gemname
pkgver=3.2.2
pkgrel=1
pkgdesc="Easily generate fake data: names, addresses, phone numbers, etc"
arch=(any)
url=https://github.com/faker-ruby/faker
license=(MIT)
depends=(ruby ruby-i18n)
makedepends=(ruby-rdoc rubygems)
checkdepends=(rubocop ruby-bundler ruby-minitest ruby-pry ruby-rake
              ruby-simplecov ruby-test-unit ruby-timecop ruby-yard)
options=(!emptydirs)
source=(${url}/archive/v$pkgver/$_gemname-$pkgver.tar.gz
        ${url}/commit/cf7110313a308a3e2cd346f62ce8c1997558e121.patch)
sha256sums=('fc3a89ff91e60d9a6e96c0b24741346224485ee66975ec81d3e478e11b7f1960'
            'd3354267f65e8f193e67665577e7a7d8e37ccfca278dfba2b8e20d41f6c03642')

prepare() {
  cd $_gemname-$pkgver
  patch -p1 -N -i "${srcdir}/cf7110313a308a3e2cd346f62ce8c1997558e121.patch"
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
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
  GEM_HOME="tmp_install/${_gemdir}" rake test
}

package() {
  cd $_gemname-$pkgver

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -v -Dm0644 License* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -v -Dm0644 CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -v -Dm0644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: set ts=2 sw=2 et:
