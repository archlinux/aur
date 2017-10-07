# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Kevin MacMartin <prurigro@gmail.com>

pkgname=yrd-git
pkgver=0.5.0
pkgrel=1
pkgdesc='cjdns swiss army knife'
url='https://github.com/kpcyrd/yrd'
license=('GPL3')
arch=('any')
depends=('python-setuptools' 'python-argh' 'python-requests' 'cjdns')
makedepends=('git')
provides=('yrd')
conflicts=('yrd')
source=(${pkgname}::git+https://github.com/kpcyrd/yrd
        yrd.tmpfiles.conf)
sha512sums=('SKIP'
            '191fdf5687886357c01b72b2b9037045ca24d0ee888dc2bf6b2748a769eeb9a481eb01a9807f8f32b783d0970229f18d1264e937c2dd44b282ac764c49450cca')

pkgver() {
  cd ${pkgname}
  git describe --always --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd ${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build

  install -Dm 644 doc/yrd.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm 644 "${srcdir}/yrd.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/yrd.conf"
  install -Dm 644 init/yrd.service -t "${pkgdir}/usr/lib/systemd/system"
}

# vim: ts=2 sw=2 et:
