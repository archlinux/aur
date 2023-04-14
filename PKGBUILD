# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=airbrussh
pkgname=ruby-$_gemname
pkgver=1.4.1
pkgrel=1
pkgdesc='Airbrussh pretties up your SSHKit and Capistrano output'
arch=(any)
url=https://github.com/mattbrictson/airbrussh
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-sshkit)
checkdepends=(ruby-bundler ruby-minitest ruby-minitest-reporters ruby-mocha
              ruby-rake)
makedepends=(ruby-rdoc rubygems)
source=(${url}/archive/v${pkgver}/$_gemname-$pkgver.tar.gz)
sha256sums=('79252fadaf408d1fb55abf23a6fa2b9f8a3874c95aa2c785952367b01b2ff952')

prepare() {
  cd ${_gemname}-$pkgver
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
  sed -i 's|git ls-files -z|find -print0|' ${_gemname}.gemspec
}

build() {
  cd ${_gemname}-$pkgver
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
  cd ${_gemname}-$pkgver
  local _gemdir="$(gem env gemdir)"
  GEM_HOME="tmp_install/${_gemdir}" rake test
}

package() {
  cd ${_gemname}-$pkgver

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -v -Dm0644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -v -Dm0644 CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -v -Dm0644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: set ts=2 sw=2 et:
