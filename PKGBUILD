# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2024.9.2
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
sha512sums=('bda77daa18c0e45b59ab01ea03ec2534c017be1ca0d7834776819fab3be95dfd2005a59cabc730b12d55c70195e82a34ff2b34eade3b135b82bd350220271b59'
            '487b0140564f1495bf4587abda7b82d0bf0d72adbdbdf7a368a375c85a874c14e9c0cf34e0d5e298d2634d6bbcee580bce3bc40a07c901474004908eb7890a18')
b2sums=('1fe130cfe7b25c3d9650f5346c3211bf9924bfd9cc2b5b53b9ed78ee6d554351bff943eee8ddeeab042a195e140d4f0e64a7723ca29ef6fa08b40eb0a868bed7'
        'd7a6cd85b89c74997cd7794e5205504033c37684d798bd12e40786f33fce846980d10373261444077cc527ef382246b8235573e1bb6ade8bb8e6d9e34f9961ad')

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
