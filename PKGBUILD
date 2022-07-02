# Maintainer : Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=bzr
pkgver=2.7.0
pkgrel=3
pkgdesc='A decentralized revision control system (bazaar)'
arch=('x86_64')
url='https://bazaar.canonical.com/'
license=('GPL')
depends=('python2')
optdepends=('python2-paramiko: SFTP support')
source=("https://launchpad.net/bzr/${pkgver%.*}/${pkgver}/+download/bzr-${pkgver}.tar.gz"{,.sig}
        'bzr-lazy-regex.patch')
sha256sums=('0d451227b705a0dd21d8408353fe7e44d3a5069e6c4c26e5f146f1314b8fdab3'
            'SKIP'
            'b53c3dc8cba6f2c9758b61f0e9f40fc8452304e1fec15345e282dcd9d5657542')
validpgpkeys=('84736900600FF95EF23513F52975A150DEF6218F') # Vincent Ladeuil

prepare() {
  cd bzr-${pkgver}

  sed 's|man/man1|share/man/man1|' -i setup.py
  sed 's|/usr/bin/env python|/usr/bin/env python2|' -i bzrlib/{plugins/bash_completion/bashcomp.py,tests/ssl_certs/create_ssls.py,patiencediff.py,_patiencediff_py.py}

  patch -Np0 -i ../bzr-lazy-regex.patch
}

build() {
  cd bzr-${pkgver}

  python2 setup.py build
}

package() {
  cd bzr-${pkgver}

  python2 setup.py install --prefix='/usr' --root="${pkgdir}" --optimize='1'

  install -dm 755 "${pkgdir}"/usr/share/bash-completion/completions
  install -m 644 contrib/bash/bzr "${pkgdir}"/usr/share/bash-completion/completions/
}

# vim: ts=2 sw=2 et:
