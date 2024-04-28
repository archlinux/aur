# Maintainer: Tom Moore <middleagedman@users.noreply.github.com>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant-git
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2024.4.4
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
_tag=60be2af8ac15a98fb01b5f297b30898c21dea61c
source=(
  "$pkgname::git+https://github.com/home-assistant/core.git#tag=${_tag}"
  home-assistant-git.service
)
b2sums=('26e0b5ac9f04d535d9f47df9908484d9cc034bc9c856b72b02340e8350368a883800a327fb7840c95fd2fd60a26fea91616ef2b6d301324b3dde0eefa98981e5'
        '289b6d19fa36b8bcea5790da13b83211eb44fcda889a24bf07a2ef70e806b5bb138c8f6387057d153e109a3bdabd0f4009c171fc82e021cdfd43db376704d416')

prepare() {
  cd home-assistant-git
  # allow any setuptools and wheel to be used
  sed 's/==68.0.0//; s/~=0.40.0//' -i pyproject.toml
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
