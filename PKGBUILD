# Maintainer: Stephan Brunner <s.brunner@stephan-brunner.net>

pkgname=cepces
pkgver=0.3.9
pkgrel=1
pkgdesc='certmonger plugin to enroll certificates through Active Directory Certificate Services CEP and CES.'
arch=(any)
url=https://github.com/openSUSE/cepces
license=(GPL-3.0)
depends=(
  certmonger
  python-cryptography
  python-requests
  python-requests-gssapi
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(
  "git+https://github.com/openSUSE/$pkgname.git#tag=v$pkgver"
  0001-Remove-insecure-enctypes.patch
)
sha256sums=(
  'a28e198c8c851ec2453cea9f52df120441785fda1bf4cffda9d0c2ac76157ecf'
  'a60a241a0da7ce380f5bd11cff18e8d0dacab5613a08107720f8889ae42734f2'
)
validpgpkeys=(968479A1AFF927E37D1A566BB5690EEEBB952194) # GitHub <noreply@github.com>
backup=(
  etc/cepces/{cepces,logging}.conf
)

prepare() {
  cd "$pkgname"
  patch -p1 -i ../0001-Remove-insecure-enctypes.patch
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -d $pkgdir/etc/cepces

  for cfg in cepces.conf logging.conf
  do
    install -Dm644 conf/$cfg.dist $pkgdir/etc/cepces/$cfg
  done

  install -dm750 $pkgdir/var/log/cepces
}

# vim: ts=2 sw=2 et:

