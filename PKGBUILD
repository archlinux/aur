# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='mysql2'
pkgname="ruby-${_gemname}"
pkgver=0.5.4
pkgrel=1
pkgdesc='A simple, fast Mysql library for Ruby, binding to libmysql'
arch=('x86_64')
url='http://github.com/brianmario/mysql2'
license=('MIT')
options=(!emptydirs)
depends=('ruby')
makedepends=('mariadb-clients' 'ruby-rake' 'ruby-rake-compiler')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('89958220d2f5454351f4e4b93099e12355cb0a8c36824125650f2366b15cdb3e1aa208f60beb348834cd2ee6fa36aac4102581c16fe1b6bd4f2136cc1a8b5c99')

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
