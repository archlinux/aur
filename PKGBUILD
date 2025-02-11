# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2025.2.2
pkgrel=1
epoch=1
arch=('any')
url='https://home-assistant.io/'
license=('Apache-2.0')
depends=(
  'bluez-libs'
  'ffmpeg'
  'gcc'
  'lapack'
  'libffi'
  'libjpeg-turbo'
  'libtiff'
  'openjpeg2'
  'openssl'
  'python'
  'tzdata'
  'zlib'
)
makedepends=(
  'git'
  'python-build'
  'python-setuptools'
  'python-wheel'
)
source=(
  "$pkgname::git+https://github.com/home-assistant/core.git#tag=$pkgver"
  'home-assistant.service'
  'remove-setuptools-constraint.patch'
)
sha512sums=('ca5e607792dc8473bec9324b3f9f61f0bd1d603c462a5c38f71010bbf358d930dc39e0851745f1b7267c9d84bf2ebf9950f5599a25d996d3371c7b483f76194e'
            '2525f511795fb11934ec2cc351f44d0cc7dffbf9ca258755d2110f6fa08a6930eaef00f1d302dec932b48bef58ddbea891a24837622f9e66da225cded3072134'
            'f32cbdc8a94088493e06adf57de9407341ec1c16d641ad6a3bfcafa1983946a32d207af8af63590e99d915be4df6ab2a7405a096cfa127a10df16692eb2afe00')
b2sums=('e5de8e79ede12f2c1678e168eeeae6db5f3611ba98b1a7bb4c2d19aff2f1f63494dcaddf551a20a5426e50e6aaa0133819f6007a3c9aab646760fde99b527a1f'
        'a4e05c63d26c815edcfea2a16c794f1bcfb047b96554fcb408582ecf64e87b0c5ac9673a3a580b3e50db023a7e98d327a314aee776be8810ce08bda1e5b3058a'
        'b64675219c7b8d909275dd2dfce16a5f5049fef91ba3cf0a4c02f6f4b9dbc360e68b7025a9d3a21aac8457d5378508b4d7bfa5eae86ed7ab98bace77ea10a6c3')

prepare() {
  # update version in service file
  sed "s/@VERSION@/${pkgver}/" -i home-assistant.service

  # allow any setuptools version to be used
  cd "$pkgname"
  patch -p1 -i "$srcdir/remove-setuptools-constraint.patch"
}

build() {
  cd home-assistant
  python -m script.translations develop --all
  python -m build --wheel --no-isolation
}

package() {
  install -Dm 644 home-assistant/dist/*.whl -t "${pkgdir}"/usr/share/home-assistant/
  install -Dm 644 home-assistant.service -t "${pkgdir}"/usr/lib/systemd/system/
}

# vim: ts=2 sw=2 et:
