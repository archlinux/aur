# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

pkgname=open-riichi-git
pkgver=0.2.0.3.r19.g9d28fb1
pkgrel=1
pkgdesc='An open source riichi (Japanese) mahjong client'
arch=('x86_64')
url='https://github.com/FluffyStuff/OpenRiichi'
license=('GPL')
depends=('libgee' 'gtk3' 'glew' 'pango' 'sdl2' 'sdl2_image' 'csfml' 'sfml')
makedepends=('git' 'gcc' 'vala' 'meson')
source=('OpenRiichi::git+https://github.com/FluffyStuff/OpenRiichi.git'
        'Engine::git+https://github.com/FluffyStuff/Engine.git'
        'OpenRiichi.desktop')
sha256sums=('SKIP'
            'SKIP'
            'fa43b7e9477b3cba48e9a0f50699a480d0b1c12320c950f9b4465eb1d9b4a742')

pkgver() {
  cd OpenRiichi

  git describe --tags --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd OpenRiichi
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git_Submodules
  git submodule init
  git config submodule.Engine.url "${srcdir}/Engine"
  git submodule update

  meson bin -Dbuildtype=release
}

build() {
  cd OpenRiichi
  ninja -C bin
}

package() {
  install -Dm 644 OpenRiichi.desktop -t "${pkgdir}"/usr/share/applications

  cd OpenRiichi
  mkdir -p "${pkgdir}/opt/OpenRiichi"
  cp -r bin/* "${pkgdir}/opt/OpenRiichi"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm 644 bin/Data/Icon.png "${pkgdir}/usr/share/pixmaps/OpenRiichi.png"
}
