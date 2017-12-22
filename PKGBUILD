# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-parental-controls-git
pkgver=r334.db7f66c
pkgrel=1
pkgdesc='Switchboard Parental Controls Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-parental-controls'
license=('GPL3')
groups=('pantheon-unstable')
depends=('accountsservice' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee'
         'polkit'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-parental-controls')
conflicts=('switchboard-plug-parental-controls')
source=('git+https://github.com/elementary/switchboard-plug-parental-controls.git'
        'systemd-service-install-dir.patch')
sha256sums=('SKIP'
            '73d98773379872f7fe8ac570faf8d3ce01ab2495784fac4569ac596f77706591')

pkgver() {
  cd switchboard-plug-parental-controls

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-parental-controls

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  patch -Np1 -i ../systemd-service-install-dir.patch
}

build() {
  cd switchboard-plug-parental-controls/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-parental-controls/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
