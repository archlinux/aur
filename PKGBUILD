# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

pkgname='schleuder-cli'
pkgver=0.1.0
pkgrel=2
pkgdesc='A command line tool to create and manage schleuder-lists.'
arch=(any)
url='https://schleuder.org'
license=('GPL3')
options=(!emptydirs)
depends=('ruby' 'ruby-thor')
checkdepends=('ruby-bundler' 'ruby-rspec')
source=("${pkgname}-${pkgver}.tar.gz::https://0xacab.org/schleuder/schleuder-cli/-/archive/schleuder-cli-${pkgver}/schleuder-cli-schleuder-cli-${pkgver}.tar.gz")
sha512sums=('6c2854bc5d46dea6936c1bfc5d502c5df3c170e92bbde663332426ed978de8fcb72f110ecd691a372530f917a75ed182f337d855d4f19bc7ab9b465a9c9c4766')

prepare() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  # we built based on a tar acrhive, not a git repo
  sed --in-place 's/git ls-files bin/find bin -type f/' "${pkgname}.gemspec"
  sed --in-place 's/git ls-files/find/' "${pkgname}.gemspec"

  # update gemspec/Gemfile to allow newever version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${pkgname}.gemspec"
}

build() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  gem build "${pkgname}.gemspec"
}

check() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  rm Gemfile.lock

  bundle exec rspec
}

package() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}${_gemdir}" --bindir "${pkgdir}/usr/bin" "${pkgname}-${pkgver}.gem"

  install -Dm 644 CHANGELOG.md CONTRIBUTING.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 man/*.8 --target-directory "${pkgdir}/usr/share/man/man8"

  rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
}
