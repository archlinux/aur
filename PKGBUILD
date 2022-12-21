# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname="ruby-cool.io"
_gemname=${pkgname#ruby-}
pkgver=1.7.1
pkgrel=1
pkgdesc='Simple evented I/O for Ruby'
arch=(x86_64)
url='https://github.com/tarcieri/cool.io'
license=(MIT)
depends=(ruby)
makedepends=(
  ruby-rdoc
  ruby-bundler
  ruby-rake-compiler
)
checkdepends=(
  ruby-rake
  ruby-rspec
)
options=("!emptydirs")

source=("${url}/archive/v${pkgver}/${_gemname}-v${pkgver}.tar.gz")
sha256sums=('64d6921b052f9e5894eef42b5b2d053ce62a933fe57c79b6c51a928bd1d77c89')
provides=(
  "cool.io_ext.so=${pkgver}"
  "iobuffer_ext.so=${pkgver}"
)

_archive="${_gemname}-${pkgver}"

build() {
  cd "$_archive"

  # update the gemspec to allow newer versions of rake
  sed --in-place 's|~>|>=|g' "${_gemname}.gemspec"
  sed --in-place 's|git ls-files|find|g' "${_gemname}.gemspec"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "$_archive"

  # Two tests fail if /etc/resolv.conf contains an IPv6 address
  # https://github.com/tarcieri/cool.io/issues/68
  rake
}

package() {
  cd "$_archive"

  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm 644 CHANGES.md README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  rm -rf "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ext"
  rm -rf "${pkgdir}/${_gemdir}/cache"
  rm -r ${pkgdir}/${_gemdir}/extensions/*/*/${_gemname}-${pkgver}/{mkmf.log,gem_make.out}
}
