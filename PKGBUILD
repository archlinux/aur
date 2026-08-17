# Maintainer: Jonas Verhofsté <jonas@verhofste.tech>

_gemname=hiera-eyaml-gpg
pkgname=ruby-$_gemname
pkgver=0.7.4
pkgrel=2
pkgdesc='GPG Encryption backend for Hiera'
arch=(any)
url='https://github.com/voxpupuli/hiera-eyaml-gpg'
license=(MIT)
depends=(
  ruby
  ruby-gpgme
  ruby-hiera-eyaml
)
makedepends=(
  ruby-rdoc
)
options=(!emptydirs)
source=("${_gemname}-${pkgver}.tar.gz::https://github.com/voxpupuli/hiera-eyaml-gpg/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ecea32b79e2b9872d54aa9a81a8bbfec096168fc5ba2a9f11c014a78644a523f12918ff2aa4f7884e3d775a669794a2ff64b8d7e9f62e0d0947d44b4165287bf')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"

  # we don't build from a git checkout
  sed --in-place --regexp-extended 's|git ls-files|find . -type f -not -path "*/\.git/*"|' "${_gemname}.gemspec"
}


build() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem build "${_gemname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --build-root "tmp_install" \
    --no-user-install \
    -i "${_gemdir}" \
    "${_gemname}-${pkgver}.gem"

  rm -rf "tmp_install/${_gemdir}/build_info" "tmp_install/${_gemdir}/cache"
}


package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
}

