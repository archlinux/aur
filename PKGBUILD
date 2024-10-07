# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2024.10.1
pkgrel=2
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
)
sha512sums=('99b1cf657e7b6a932a9025291c755ddbb3580f523033e1cb68d16689832dcaff3f35101e8fbfd7eec9db8fdce4bd61b84778f63397eae437f1d75da9cf5b8dbe'
            '2525f511795fb11934ec2cc351f44d0cc7dffbf9ca258755d2110f6fa08a6930eaef00f1d302dec932b48bef58ddbea891a24837622f9e66da225cded3072134')
b2sums=('a9d703b08bd7dd5f8994934e48c301a5b708c2f90a9f16daaa348fcd9bb333935fb6afb7194d5c751a546e5cb02e6e4db992594656bbf78dc703f3b5fb0942f3'
        'a4e05c63d26c815edcfea2a16c794f1bcfb047b96554fcb408582ecf64e87b0c5ac9673a3a580b3e50db023a7e98d327a314aee776be8810ce08bda1e5b3058a')

prepare() {
  # update version in service file
  sed "s/@VERSION@/${pkgver}/" -i home-assistant.service

  # allow any setuptools and wheel to be used
  cd home-assistant
  sed \
    -e 's/==69.2.0//; s/~=0.43.0//' \
    -i pyproject.toml
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
