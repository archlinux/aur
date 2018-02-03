# Maintainer: Louis Bettens louis at bettens dot info

__github='https://github.com/paddor/czmq-ffi-gen'
_gemname=czmq-ffi-gen
pkgname=ruby-${_gemname}
pkgver=0.14.1
pkgrel=1
pkgdesc='low-level Ruby binding for CZMQ'
url=${__github}
arch=('any')
license=('ISC')
depends=('czmq' 'ruby' 'ruby-ffi')
makedepends=('ruby-rdoc')
options=('!emptydirs')

prepare() {
  # we clone because of submodules
  git clone ${__github}
  cd ${_gemname}
  git checkout v0.14.1
  git submodule update --init
  sed 's|~>|>=|g' -i ${_gemname}.gemspec # don't give a fuck about rubys bla bla
}

build() {
  cd ${_gemname}
  gem build ${_gemname}.gemspec
}


package() {
  cd ${_gemname}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md CHANGES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
