# Maintainer: Tom Moore <middleagedman@users.noreply.github.com>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant-git
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2024.8.2
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
  python-setuptools-git
  python-wheel
)
_tag=94516de7244ac73549695177a465064ad147884c
source=(
  "$pkgname::git+https://github.com/home-assistant/core.git#tag=${_tag}"
  home-assistant-git.service
)
b2sums=('32c4b58de1ba10c12addd100d873d973b623c76112d3c4ef3cee878a20b848586c989b313ff3d350a45e96b7cd1b47059daad1a258920949ab3cf4bd7c9a6513'
        '289b6d19fa36b8bcea5790da13b83211eb44fcda889a24bf07a2ef70e806b5bb138c8f6387057d153e109a3bdabd0f4009c171fc82e021cdfd43db376704d416')

prepare() {
  cd "${srcdir}"/home-assistant-git
  # allow any setuptools and wheel to be used
  sed 's/==69.2.0//; s/~=0.43.0//' -i pyproject.toml
}

pkgver() {
  cd home-assistant-git
  git describe --tags
}

build() {
  cd home-assistant-git
  python -m script.translations develop --all
  python -m build --wheel --no-isolation
}

package() {
  install -Dm 644 home-assistant-git/dist/*.whl -t "${pkgdir}"/usr/share/home-assistant-git/
  sed "s/@VERSION@/${pkgver}/" -i home-assistant-git.service
  install -Dm 644 home-assistant-git.service -t "${pkgdir}"/usr/lib/systemd/system/
}

# vim: ts=2 sw=2 et:
