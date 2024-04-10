# Maintainer: Tom Moore <middleagedman@users.noreply.github.com>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant-git
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2024.4.2
pkgrel=2
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
  python312
  tzdata
  zlib
)
makedepends=(
  git
  python-build
  python-setuptools
  python-wheel
)
_tag=04072cb3c1a2447200b322043a89c89e7e39d8ac
source=(
  "$pkgname::git+https://github.com/home-assistant/core.git#tag=${_tag}"
  home-assistant-git.service
)
b2sums=('cd740d71d62aceea54c87894b8e69c2818df28b5e449485dfa8bdef728159dd2a3b7fd212a9babdb541f8e944c5f53261cb3e39c07d2d999df3aa95ec650f942'
        '50602803c05d7f2b1c7214915b4745d092aef796c4f1cc4339f6359ea6d2558f59404fd55223eade1c237a3b9cc8c9babdb95a2f71c85dd90fd5e572e97bd518')

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
