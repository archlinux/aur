# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Lucky <archlinux@builds.lucky.li>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=nanoc
pkgver=4.9.6
pkgrel=1
pkgdesc='A simple, flexible static site generator written in Ruby.'
arch=(any)
url='http://nanoc.ws'
license=(MIT)
depends=(ruby-addressable ruby-cri ruby-ddmemoize ruby-ddmetrics ruby-ddplugin ruby-hamster ruby-parallel ruby-ref ruby-slow_enumerator_tools ruby-tomlrb)
makedepends=(rubygems)
optdepends=(
  "adsf: Provides 'nanoc view' command."
  "ruby-builder: Provides 'Blogging' helper."
  "ruby-kramdown: Provides filter for Markdown input files."
  "ruby-nokogiri: Provides 'nanoc check' command."
  "ruby-pry: Provides 'nanoc shell' command."
  "ruby-w3c_validators: Provides 'nanoc check' command."
)
provides=(ruby-nanoc3 ruby-nanoc)
conflicts=(ruby-nanoc3 ruby-nanoc)
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nanoc/nanoc/archive/${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.gem")
sha256sums=('8612ad187f49d83daa91170d2fa67f9e1368dfcebfbfe66b2c0165641410d643')

build() {
  # create gem
  cd "${srcdir}/${pkgname}-${pkgver}/nanoc"
  gem build nanoc.gemspec
  cp "${pkgname}-${pkgver}.gem" "${srcdir}/"
  cd -
}

package() {

  mkdir -p "${pkgdir}/usr/bin/"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  # install gem
  HOME=/tmp gem install \
    --no-user-install --no-ri \
    --ignore-dependencies \
    --install-dir "${pkgdir}${_gemdir}" \
    --bindir "${pkgdir}/usr/bin" \
    "${srcdir}/${pkgname}-${pkgver}.gem"

  # install license
  install -Dm 644 \
    "${pkgdir}"/usr/lib/ruby/gems/*/gems/"${pkgname}-${pkgver}"/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
}

# vim:set ts=2 sw=2 et:
