# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='mysql2'
pkgname="ruby-${_gemname}"
pkgver=0.5.3
pkgrel=1
pkgdesc='A simple, fast Mysql library for Ruby, binding to libmysql'
arch=('x86_64')
url='http://github.com/brianmario/mysql2'
license=('MIT')
options=(!emptydirs)
depends=('ruby')
makedepends=('mariadb-clients' 'ruby-rake' 'ruby-rake-compiler')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('d704f192b233b78c8ccdc3978dab796ef667ad92f651255daa99ab0f886e8f816094583ff7c091681d42caf9cd3e14b17cc37f8b574ee5a6851adfd65d5bbf87')

prepare() {
  cd "${_gemname}-${pkgver}"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files/find/' "${_gemname}.gemspec"

  # update gemspec/Gemfile to allow newever version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec" Gemfile
}

build() {
  cd "${_gemname}-${pkgver}"

  rake compile
  gem build "${_gemname}.gemspec"
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGELOG.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
