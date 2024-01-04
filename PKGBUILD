# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant-git
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2024.1.0_r215_g890615bb92e
pkgrel=1
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
conflicts=('home-assistant')
provides=('home-assistant')
source=(
  git+https://github.com/home-assistant/home-assistant.git
  home-assistant.service
)
b2sums=('SKIP'
        'd7a6cd85b89c74997cd7794e5205504033c37684d798bd12e40786f33fce846980d10373261444077cc527ef382246b8235573e1bb6ade8bb8e6d9e34f9961ad')

pkgver() {
  cd home-assistant
  local dv=$(git describe --tags $(git rev-list --tags --max-count=1))
  printf "%s_r%s_g%s" \
    ${dv}\
	$(git rev-list --count ${dv}..HEAD) \
	$(git rev-parse --short HEAD)
}

prepare() {
  cd home-assistant
  # allow any setuptools and wheel to be used
  sed 's/==68.0.0//; s/~=0.40.0//' -i pyproject.toml
}

build() {
  cd home-assistant
  python -m script.translations develop --all
  python -m build --wheel --no-isolation
  mv dist/*.whl dist/homeassistant-$pkgver-py3-none-any.whl
}

package() {
  install -Dm 644 home-assistant/dist/*.whl -t "${pkgdir}"/usr/share/home-assistant/
  sed "s/@VERSION@/${pkgver}/" -i home-assistant.service
  install -Dm 644 home-assistant.service -t "${pkgdir}"/usr/lib/systemd/system/
}

# vim: ts=2 sw=2 et:
