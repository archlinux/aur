# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='rack-cache'
pkgname="ruby-${_gemname}"
pkgver=1.13.0
pkgrel=1
pkgdesc="Real HTTP Caching for Ruby Web Apps"
arch=('any')
url='https://github.com/rtomayko/rack-cache'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-rack')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('049302994663703ea593e01194e1c5c3b95afc889e628906e65302dd1fe64fc280bac9d26855db2fc7af1e287201a47c7f6a52329a3151b3efc775c0585d837c')

prepare() {
  cd "${_gemname}-${pkgver}"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files/find/' "${_gemname}.gemspec"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}"
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGES README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
