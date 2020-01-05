# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Lucky <archlinux@builds.lucky.li>

_gemname='cri'
pkgname="ruby-${_gemname}"
pkgver=2.15.9
pkgrel=1
pkgdesc='Library for building easy-to-use command-line tools with support for nested commands'
arch=('any')
url='https://github.com/ddfreyne/cri'
license=('MIT')
makedepends=('ruby-rdoc' 'ruby-rake' 'ruby-bundler' 'ruby-yard' 'ruby-minitest')
depends=('ruby')
options=(!emptydirs)
source=("https://github.com/ddfreyne/${_gemname}/archive/${pkgver}/${_gemname}-${pkgver}.tar.gz" 'Rakefile' 'disable-coveralls.patch')

sha512sums=('6c9c57863eac89078145a037d6ee4ba34529f5a61a992f70c7a832dc5cee0e0677dc3d61f71e01b02754d79573730a9b6752d6365e6a71b67b0867d76d2b63e5'
            '34e13fa1d9dfd85bf3d9ded8d7bffd2f8416e10a88de12889b077f9148293e04a9eb89d7523885af2378397aba3f3d500312886ce76d2b464260e7d4ecd60288'
            'a6ff67046e306b199973754f5526367df5d4b1420ed1cb387a35756d1558eda92e0de481ebb83051cb0126f0c1565bcd4192c9808344a2cb8c212a66bbacb680')

# The Rakefile and a helper file try to load a bunch of gems to report the CI status to a cloud provider
# Also it tries to execute a ruby linter for a legacy Ruby version
# all those tools aren't required to build and test the software, also we don't have them in the repos.
prepare() {
  cd "${_gemname}-${pkgver}"
  cp "${srcdir}/Rakefile" .
  patch -p1 -N -i "${srcdir}/disable-coveralls.patch"
}

build() {
  cd "${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${_gemname}-${pkgver}"
  rake test_unit
}

package() {
  cd "${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
