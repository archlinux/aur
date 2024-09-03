# Mainteiner: Richard Lees <git zero at bitservices dot io>
################################################################################

_gemname=docker-api

################################################################################

pkgname="ruby-${_gemname}"
pkgver=2.3.0
pkgrel=3
pkgdesc='A simple REST client for the Docker Remote API.'
arch=(any)
url="https://github.com/upserve/${_gemname}"
license=(MIT)
depends=("ruby" "ruby-excon" "ruby-multi_json")
makedepends=("rubygems")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
options=(!emptydirs)
sha256sums=('639e2253edb405f9a94b40b4aa10d4c80b6780d02502ec92196c689e36118a41')

################################################################################

prepare() {
  cd "${_gemname}-${pkgver}"

  sed -r 's|`git ls-files (.+)`|`find \1 -type f`|' -i "${_gemname}.gemspec"
}

################################################################################
build() {
  local _gemdir="$(gem env gemdir)"
  local _tmpdir="tmpinstall"

  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}.gemspec"
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "${_tmpdir}/${_gemdir}" \
    --bindir "${_tmpdir}/usr/bin" \
    "${_gemname}-${pkgver}.gem"

  find "${_tmpdir}/${_gemdir}/gems/" \
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

  rm -r "${_tmpdir}/${_gemdir}/cache"
}

################################################################################

package() {
  local _tmpdir="tmpinstall"

  cd "${_gemname}-${pkgver}"

  cp -a "${_tmpdir}"/* "${pkgdir}"/

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"/
}

################################################################################
