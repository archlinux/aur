# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
pkgname='schleuder-cli'
pkgver=0.2.0
pkgrel=3
pkgdesc='A command line tool to create and manage schleuder-lists.'
arch=(any)
url='https://schleuder.org'
license=('GPL3')
options=(!emptydirs)
depends=('ruby' 'ruby-thor')
checkdepends=('ruby-bundler' 'ruby-rspec')
source=("https://0xacab.org/schleuder/schleuder-cli/-/archive/schleuder-cli-${pkgver}/schleuder-cli-schleuder-cli-${pkgver}.tar.gz")
sha512sums=('05927c903ddd8b26d74d813c6783c2304eb62caa7c4c50bcb83d0c9b68b41faf3f9b7323d85e86a3b6b76f1b186d43d5ae24ece571fc4d5567e4a20a91f8072e')

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
