# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname=hoe
pkgname=ruby27-${_gemname}
_gitcommit=c50be1641440a5fd821c5438219a9a88e189461c
pkgver=3.22.3
pkgrel=3
pkgdesc='Hoe is a rake/rubygems helper for project Rakefiles'
url='https://www.zenspider.com/projects/hoe.html'
arch=('any')
license=('MIT')
depends=('ruby2.7')
makedepends=('git' 'ruby27-rdoc' 'ruby27-rake')
checkdepends=('ruby27-minitest')
options=('!emptydirs')
source=("git+https://github.com/seattlerb/hoe#commit=${_gitcommit}")
sha512sums=('SKIP')

pkgver() {
  cd ${_gemname}
  grep 'VERSION = "' lib/hoe.rb|sed -E 's|.*"(.+)"|\1|'
}

build() {
  cd ${_gemname}
  ruby27-rake gem
}

check() {
  cd ${_gemname}
  ruby27-rake test
}

package() {
  cd ${_gemname}
  local _gemdir="$(gem-2.7 env gemdir)"
  gem-2.7 install --ignore-dependencies --no-user-install --install-dir "${pkgdir}${_gemdir}" --bindir "${pkgdir}/usr/bin" pkg/${_gemname}-${pkgver}.gem
  install -Dm 644 README.rdoc -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 README.rdoc -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -rf cache gems/${_gemname}-${pkgver}/{ext,lib/*/*.so} extensions/*/*/${_gemname}-${pkgver}/{mkmf.log,gem_make.out}
  mv "${pkgdir}/usr/bin/sow" "${pkgdir}/usr/bin/ruby27-sow"
}

# vim: ts=2 sw=2 et:
