# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2023.6.2
pkgrel=1
epoch=1
arch=(any)
url=https://home-assistant.io/
license=(APACHE)
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
_tag=e5c5790768dabd5ce257ad949a6801f4f94a5f73
source=(
  git+https://github.com/home-assistant/home-assistant.git#tag=${_tag}
  home-assistant.service
)
b2sums=('SKIP'
        '3249da47392c3100f556b7037bc3a9abdd168960a67eedb8ff68c49729c502ed8cdead16a78c5d2a1d2184dfa51e4ddc89bc09302e189a22a7482bc7b0c05352')

prepare() {
  cd home-assistant
  # allow any setuptools and wheel to be used
  sed 's/~=62.3//; s/~=0.37.1//' -i pyproject.toml
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
