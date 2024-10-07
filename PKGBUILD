# Maintainer: Richard Lees <git zero at bitservices dot io>
# Contributor: mnussbaum <michaelnussbaum08@gmail.com>
################################################################################

_gemname=reverse_markdown

################################################################################

pkgname="ruby-${_gemname}"
pkgver=2.1.1
pkgrel=3
pkgdesc="Ruby gem to convert html into markdown"
arch=("any")
url="https://github.com/xijo/${_gemname}"
license=(WTFPL)
depends=("ruby" "ruby-nokogiri")
makedepends=("rubygems")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "0001-gemspec.patch")
options=(!emptydirs)
sha256sums=('7e5befcf8f2d155302a08ed45a11341e7c3930a6596a40e99ecec77cce855a20'
            'a46d37974685ab4296ab285e7f3e0926f3a7ba123083f3a43f65d8cbd1d3b69c')

################################################################################

prepare() {
  cd "${_gemname}-${pkgver}"
  patch --strip=1 --input "../0001-gemspec.patch"
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
