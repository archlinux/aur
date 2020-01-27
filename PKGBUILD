# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Lucky <archlinux@builds.lucky.li>

_gemname='cri'
pkgname="ruby-${_gemname}"
pkgver=2.15.10
pkgrel=1
pkgdesc='Library for building easy-to-use command-line tools with support for nested commands'
arch=('any')
url='https://github.com/ddfreyne/cri'
license=('MIT')
makedepends=('ruby-rdoc' 'ruby-yard' 'ruby-rake')
checkdepends=('ruby-minitest')
depends=('ruby')
options=(!emptydirs)
source=("${url}/archive/${pkgver}/${_gemname}-${pkgver}.tar.gz" 'Rakefile.patch' 'disable-coveralls.patch')

sha512sums=('b18971cb2f7db6dff3e0f6074d770a062f021d35640e9f010a1e31e1bf2286ff60aafe145589fb16b3805a586eecee00fa14239967b9630efee23966c2f4e023'
            '44d3db7dfda851d432ff293e178c31e513dfd902cbbf3c7862857b479562f091cd8afcac7c68a4fb4c825286fd6d62c5956be54eeb4e1640cf04bb7d1f71d764'
            'a6ff67046e306b199973754f5526367df5d4b1420ed1cb387a35756d1558eda92e0de481ebb83051cb0126f0c1565bcd4192c9808344a2cb8c212a66bbacb680')

prepare() {
  cd "${srcdir}/${_gemname}-${pkgver}"

  # The Rakefile and a helper file try to load a bunch of gems to report the CI status to a cloud provider
  # Also it tries to execute a ruby linter for a legacy Ruby version
  # all those tools aren't required to build and test the software, also we don't have them in the repos.
  patch --forward --verbose --strip=1 --input='../Rakefile.patch'
  patch --forward --verbose --strip=1 --input='../disable-coveralls.patch'
}

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  rake test_unit
  rake doc
}

package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm 644 README.md CODE_OF_CONDUCT.md NEWS.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  mv doc/yardoc "${pkgdir}/usr/share/doc/${pkgname}/"
  rm -rf "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/"{README.md,CODE_OF_CONDUCT.md,NEWS.md,.gitignore,.rubocop.yml,.travis.yml,test,LICENSE}

  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
