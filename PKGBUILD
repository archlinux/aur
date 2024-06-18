# Maintainer: Tom Moore <middleagedman@users.noreply.github.com>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant-git
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2024.6.3
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
_tag=394dafd98094cbd93a4dd5b88779f14626d322d3
source=(
  "$pkgname::git+https://github.com/home-assistant/core.git#tag=${_tag}"
  home-assistant-git.service
)
b2sums=('2375ee617e24acb514cddaca4482182f06d5add479ecf6e6f2b4862d97044ef33f7ac14f5658e129c8edfd16b7c1972a7c0b5aef2f282a736f9c57ee7ed00894'
        '289b6d19fa36b8bcea5790da13b83211eb44fcda889a24bf07a2ef70e806b5bb138c8f6387057d153e109a3bdabd0f4009c171fc82e021cdfd43db376704d416')

prepare() {
  cd "${srcdir}"/home-assistant-git
  # allow any setuptools and wheel to be used
  sed 's/==69.2.0//; s/~=0.40.0//' -i pyproject.toml
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
