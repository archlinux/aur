# Maintainer: Rubin Simons <me@rubin55.org>

_gemname=yard-solargraph

pkgname="ruby-${_gemname}"
pkgver=0.1.0
pkgrel=4
pkgdesc="A YARD extension for documenting Solargraph tags"
arch=("any")
url="https://github.com/castwide/${_gemname}"
license=("MIT")
depends=("ruby" "ruby-yard")
makedepends=("rubygems" "ruby-rake" "ruby-simplecov" "ruby-rspec")
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
options=(!emptydirs)
sha256sums=("SKIP")

prepare() {
  cd "${pkgname}"
}

build() {
  local _gemdir="$(gem env gemdir)"
  local _tmpdir="tmpinstall"

  cd "${pkgname}"

  rake install
  gem install --local --verbose --ignore-dependencies --no-user-install --install-dir "${_tmpdir}/${_gemdir}" --bindir "${_tmpdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"
  rm -r "${_tmpdir}/${_gemdir}/cache"
}

check() {
  cd "${pkgname}"
  rake spec
}

package() {
  local _tmpdir="tmpinstall"
  cd "${pkgname}"
  cp -a "${_tmpdir}"/* "${pkgdir}"/
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
