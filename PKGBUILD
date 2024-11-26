# Mainteiner: Richard Lees <git zero at bitservices dot io>
################################################################################

_gemname=docker-api

################################################################################

pkgname="ruby-${_gemname}"
pkgver=2.4.0
pkgrel=1
pkgdesc='A simple REST client for the Docker Remote API.'
arch=(any)
url="https://github.com/upserve/${_gemname}"
license=(MIT)
depends=("ruby" "ruby-excon" "ruby-multi_json")
makedepends=("rubygems")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
options=(!emptydirs)
sha256sums=('242172a69b44a0b76cc080f1fbf16368c5bbbf5850009edac704128ab20970b4')

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
