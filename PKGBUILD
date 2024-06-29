# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2024.6.4
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
)
sha512sums=('c18ad0c5ff93c3ee8abf0176b6b7dfb2f11760223c2c761c73d50422dfe4d40992c185b4cfb578d74705cc40b73ef94c556be226d4840ec571ab119f6f6f50a1'
            '487b0140564f1495bf4587abda7b82d0bf0d72adbdbdf7a368a375c85a874c14e9c0cf34e0d5e298d2634d6bbcee580bce3bc40a07c901474004908eb7890a18')
b2sums=('b99d557e7a6e210bda62c7c726322a258f3c54b94abefe4bd72b7fa5ead9cf00845712b3b6896f6029b1bdcf355ac2d87c6d060f6e03d057eee6919d1a5b4a9b'
        'd7a6cd85b89c74997cd7794e5205504033c37684d798bd12e40786f33fce846980d10373261444077cc527ef382246b8235573e1bb6ade8bb8e6d9e34f9961ad')

prepare() {
  # update version in service file
  sed "s/@VERSION@/${pkgver}/" -i home-assistant.service

  # allow any setuptools and wheel to be used
  cd home-assistant
  sed \
    -e 's/==69.2.0//; s/~=0.40.0//' \
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
