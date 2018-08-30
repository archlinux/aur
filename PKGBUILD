# Maintainer: Edward Pacman <micro(dot)fedora(at)gmail(dot)com>

_pkgbase=netfilter-full-cone-nat
pkgname=netfilter-full-cone-nat-dkms
pkgver=git+ec14efe
pkgrel=3
pkgdesc="A kernel module that turns MASQUERADE into full cone SNAT"
arch=('x86_64')
url="https://github.com/Chion82/netfilter-full-cone-nat"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=('dkms.conf'
    'Makefile.patch'
	'xt_FULLCONENAT.c.patch'
	'git+https://github.com/Chion82/netfilter-full-cone-nat')
md5sums=('426b17a1544478bcbe5ecc56fd392db0'
         'ca672d85174ea52d57758bd53c0a0ed9'
         'ceda7d1fc776845741cc0acf12f3fb2e'
         'SKIP')

build() {
  cd ${srcdir}/${_pkgbase}
  patch -p1 -i "${srcdir}"/xt_FULLCONENAT.c.patch
  patch -p1 -i "${srcdir}"/Makefile.patch
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}

