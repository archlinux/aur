# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Leonard König <leonard.r.koenig at googlemail dot com>
# Contributor: Adrien DUDOUIT-EXPOSITO <adrien@dudouit.me>

pkgname='endless-sky-git'
_gitname='endless-sky'
pkgver=0.10.7.alpha.a5d616acc0
pkgrel=1
arch=('i686' 'x86_64')
url="https://endless-sky.github.io/"
provides=('endless-sky')
depends=('openal' 'hicolor-icon-theme' 'libjpeg-turbo' 'libmad' 'glew' 'libpng' 'sdl2')
makedepends=('git' 'scons')
optdepends=(
  'endless-sky-high-dpi: high resolution graphics assets'
  'endless-sky-editor: map editor'
)
conflicts=('endless-sky')
license=('GPL3' 'CCPL' 'custom:public domain')
pkgdesc="A sandbox-style space exploration and combat game"
source=("${_gitname}::git+https://github.com/endless-sky/endless-sky.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  # The next version is present in the .cpp and the credits.txt file
  # `git describe` provide the last release.
  _version=$(cat credits.txt | sed 2!d |
    sed -r 's/^version (.*)$/\1/' |
    sed -r 's/-/./')

  # Hash is not included in the credits, might prevent continuous update
  _hash=$(git rev-parse --short HEAD)
  echo "${_version}.${_hash}"
}

build() {
  cd "$_gitname"
  scons -j "$(nproc)"
}

package() {
  cd "$_gitname"

  # binary
  install -Dm755 -t "${pkgdir}/usr/bin" endless-sky

  # resources
  install -Dm644 -t "${pkgdir}/usr/share/games/${_gitname}" credits.txt keys.txt
  cp -rf data images sounds "${pkgdir}/usr/share/games/${_gitname}/"

  # .desktop
  install -Dm644 -t "${pkgdir}/usr/share/applications" io.github.endless_sky.endless_sky.desktop

  # icons
  for res in 16 22 24 32 48 128 256 512; do
    install -Dm644 \
      "icons/icon_${res}x${res}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_gitname}.png"
  done

  # manpage
  install -Dm644 -t "${pkgdir}/usr/share/man/man6" endless-sky.6

  # copyright
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" copyright
}
