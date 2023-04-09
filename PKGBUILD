# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=gandi.cli
pkgver=1.6
pkgrel=3
pkgdesc="Gandi command line interface"
arch=(any)
url="https://cli.gandi.net"
license=(GPL3)
depends=(python-click python-ipy python-requests python-setuptools python-yaml)
makedepends=(python-docutils)
checkdepends=(docker openssh openssl python-pytest)
optdepends=('docker: docker integration'
            'openssh: ssh integration'
            'openssl: certificate creation')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('10dbe2fe6a91f62e19de8beb9648c913401e1b27508b19040a190b4182f7010ffce0d373e063c1fd9816c1113bb8cd28c766b76b5afae0b99531fb86d59333a9')
b2sums=('7e4f489a6e5c40193b0e8abb2dfb0228a9e785a338d360a19cdf3dcc7ea862d355bc56ecc5ba4b05fb03d3d80b32af551c01f3a92bab11ad3d998475ba22c456')

prepare() {
  cd "$pkgname-$pkgver"
  # we do not need to run coverage during tests
  sed -e '/addopts/d' -i setup.cfg
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
  rst2man --no-generator gandicli.man.rst > gandi.1
}

check() {
  cd "$pkgname-$pkgver"
  pytest -v -k "not test_list_attached_detached_ko and not test_update_kernel_unavailable and not test_create_no_value_and_no_filename_ko and not test_create_value_and_filename_ko"
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -vDm 644 {CHANGES.rst,{CONTRIBUTING,README}.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 gandi.1 -t "${pkgdir}/usr/share/man/man1/"
  install -vDm 644 gandi.completion "${pkgdir}/usr/share/bash-completion/completions/gandi"
}
