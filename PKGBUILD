# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

pkgname=open-riichi-git
pkgver=0.2.0.3.r44.g9a483f3
pkgrel=1
pkgdesc='An open source riichi (Japanese) mahjong client'
arch=('x86_64')
url='https://github.com/FluffyStuff/OpenRiichi'
license=('GPL')
depends=('libgee' 'gtk3' 'glew' 'pango' 'sdl2' 'sdl2_image' 'sdl2_mixer')
makedepends=('git' 'gcc' 'vala' 'meson')
source=('OpenRiichi::git+https://github.com/FluffyStuff/OpenRiichi.git'
        'Engine::git+https://github.com/FluffyStuff/Engine.git'
        'OpenRiichi.desktop')
sha256sums=('SKIP'
            'SKIP'
            '49f93bb7a1cb9b128a0a2137438ee7723cd3e9826b59dfafa5ccee83195961d0')

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

  arch-meson build
}

build() {
  cd OpenRiichi
  ninja -C build
}

package() {
  install -Dm 644 OpenRiichi.desktop -t "${pkgdir}"/usr/share/applications

  cd OpenRiichi
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/pixmaps/"
  ln -s /usr/share/OpenRiichi/Data/Icon.png "${pkgdir}/usr/share/pixmaps/OpenRiichi.png"
}
