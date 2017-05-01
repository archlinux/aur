# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: sh4nks <sh4nks7@gmail.com

pkgname=lightdm-pantheon-greeter-git
pkgver=r770.8f93282
pkgrel=1
pkgdesc='Pantheon greeter for LightDM'
arch=('i686' 'x86_64')
url='https://github.com/elementary/greeter'
license=('GPL')
groups=('pantheon-unstable')
depends=('cairo' 'clutter' 'clutter-gtk' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'libgee' 'libgl' 'libx11' 'lightdm'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'libxfixes' 'vala' 'wingpanel-git')
provides=('lightdm-pantheon-greeter')
conflicts=('lightdm-pantheon-greeter')
replaces=('lightdm-pantheon-greeter-bzr')
install='lightdm-pantheon-greeter.install'
source=('lightdm-pantheon-greeter::git+https://github.com/elementary/greeter.git'
        'lightdm-pantheon-greeter-paths.patch')
sha256sums=('SKIP'
            '2277e4a11c8945b72cca0ab116aaae86099ccd90833c18b7f74b400f6f674b7f')

pkgver() {
  cd lightdm-pantheon-greeter

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd lightdm-pantheon-greeter

  patch -Np1 -i ../lightdm-pantheon-greeter-paths.patch

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd lightdm-pantheon-greeter/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd lightdm-pantheon-greeter/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
