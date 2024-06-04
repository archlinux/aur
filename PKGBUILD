# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2024.5.5
pkgrel=1
epoch=1
arch=(any)
url=https://home-assistant.io/
license=(Apache-2.0)
depends=(
  bluez-libs
  ffmpeg
  gcc
  lapack
  libffi
  libjpeg-turbo
  libtiff
  openjpeg2
  openssl
  python
  tzdata
  zlib
)
makedepends=(
  git
  python-build
  python-setuptools
  python-wheel
)
_tag=c34731185164aaf44419977c4086e9a7dd6c0a7f
source=(
  home-assistant::git+https://github.com/home-assistant/core.git#tag=${_tag}
  home-assistant.service
)
b2sums=('c3fe0952fab5fab87fa3719ee7fea7c94c65f34635deea1f524fc9c9a772f2c5c66685fdf5390bdbb75f6af38093d1a9762ae7ab3fe46ff8abc826f62ed965a3'
        'd7a6cd85b89c74997cd7794e5205504033c37684d798bd12e40786f33fce846980d10373261444077cc527ef382246b8235573e1bb6ade8bb8e6d9e34f9961ad')

prepare() {
  cd home-assistant
  # allow any setuptools and wheel to be used
  sed 's/==69.2.0//; s/~=0.40.0//' -i pyproject.toml
}

pkgver() {
  cd home-assistant
  git describe --tags
}

build() {
  cd home-assistant
  python -m script.translations develop --all
  python -m build --wheel --no-isolation
}

package() {
  install -Dm 644 home-assistant/dist/*.whl -t "${pkgdir}"/usr/share/home-assistant/
  sed "s/@VERSION@/${pkgver}/" -i home-assistant.service
  install -Dm 644 home-assistant.service -t "${pkgdir}"/usr/lib/systemd/system/
}

# vim: ts=2 sw=2 et:
