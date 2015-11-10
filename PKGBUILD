# Maintainer: Christoph J. Thompson <thompsonc@protonmail.ch>

pkgname=nitrokey-app
pkgver=r477.g694e6a5
pkgrel=1
pkgdesc="Nitrokey management application"
arch=('i686' 'x86_64')
url="https://www.nitrokey.com"
license=('GPL3')
depends=('qt5-base' 'libusb>=1.0.0')
makedepends=('git' 'cmake')
source=("${pkgname}::git+https://github.com/Nitrokey/nitrokey-app")
install=nitrokey-app.install
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  sed -i 's|/etc/udev/rules.d|/usr/lib/udev/rules.d|g' CMakeLists.txt
  sed -i 's|/etc/bash_completion.d|/usr/share/bash-completion/completions|g' \
         CMakeLists.txt
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DHAVE_LIBAPPINDICATOR=NO
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
