# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

pkgname=schleuder-cli
pkgver=0.1.0
pkgrel=1
pkgdesc='A command line tool to create and manage schleuder-lists.'
arch=(any)
url='https://schleuder.org'
license=(GPL3)
options=(!emptydirs)
depends=(ruby ruby-thor)
makedepends=(git ruby-rake)
checkdepends=(ruby-bundler ruby-rspec)
source=("${pkgname}-${pkgver}::git+https://0xacab.org/schleuder/${pkgname}.git#commit=70c8ac1d0de6a4b3d18f2c525b82a44aaf618f21")
sha512sums=('SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -r 's|~>|>=|g' -i ${pkgname}.gemspec
}

build() {
  cd "${pkgname}-${pkgver}"

  gem build "${pkgname}.gemspec"
}

check() {
  cd "${pkgname}-${pkgver}"

  rm Gemfile.lock

  bundle exec rspec
}

package() {
  cd "${pkgname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "${pkgname}-${pkgver}.gem"

  rm -r "${pkgdir}/${_gemdir}/cache"
}
