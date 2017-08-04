# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

_gemname=hitimes
pkgname=ruby-${_gemname}
pkgver=1.2.5
pkgrel=1
pkgdesc='Fast, high resolution timer library for recording performance metrics'
url='https://github.com/copiousfreetime/hitimes'
arch=('i686' 'x86_64')
license=('ISC')
depends=('ruby')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/copiousfreetime/hitimes/archive/v${pkgver}.tar.gz)
sha256sums=('3683e1da14822b45ff31ed1e8f8ed3f8a7a41e2c2f47bc5e5ac0f6bf71eed13d')
sha512sums=('729498d9cb69ea1080871bdeee0540f81647b7266183ddae3d4dc4a579480c1defe87cb7788bdc56db862c128b0afe0505567319de41a41d4961c8fb3bf3933c')

prepare() {
  cd ${_gemname}-${pkgver}
  sed -r "s|(s.version =) \".+\"|\1 \"${pkgver}\"|g" -i ${_gemname}.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}/${_gemdir}" \( -name '*.log' -or -name 'gem_make.out' \) -delete
}

# vim: ts=2 sw=2 et:
