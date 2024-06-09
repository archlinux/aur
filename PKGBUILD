# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Husam Bilal <me@husam.dev>
# Contributor: henning mueller <henning@orgizm.net>

pkgname=ruby-libvirt
_gemname=$pkgname
pkgver=0.8.3
pkgrel=2
pkgdesc='Ruby bindings for libvirt.'
arch=(i686 x86_64)
license=(LGPL-2.1-or-later)
url=https://gitlab.com/libvirt/libvirt-ruby
depends=(ruby libvirt)
makedepends=(rubygems ruby-rake ruby-rdoc)
source=("${url}/-/archive/${pkgname}-${pkgver}/libvirt-ruby-${pkgname}-${pkgver}.tar.gz")
sha256sums=('a218fea762585e890fce10bbdb11aa5a91646c29611f85c93a46c24b74a6983e')

build() {
  cd libvirt-ruby-${_gemname}-${pkgver}
  rake build
  rake gem
}

check() {
  cd libvirt-ruby-${_gemname}-${pkgver}
  rake test
}

package() {
  cd libvirt-ruby-${_gemname}-${pkgver}/pkg
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 ${pkgname}-${pkgver}/README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}/${_gemdir}/cache"
}
