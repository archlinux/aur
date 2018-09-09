# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: grimi <grimi at poczta dot fm>

pkgname=spacefm-ng-git
pkgver=1.0.6.18.g49f49f0
pkgrel=2
pkgdesc='A fork of spacefm multi-panel tabbed file manager pulled from git repo'
arch=('i686' 'x86_64')
url='https://github.com/Teklad/spacefm-ng'
license=('GPL3')
depends=('gtk3' 'desktop-file-utils' 'startup-notification' 'ffmpegthumbnailer')
makedepends=('intltool' 'gettext' 'git')
optdepends=('lsof: device processes'
            'wget: plugin download'
            'gksu: perform as root functionality'
            'udevil: mount as non-root user and mount networks'
            'udisks2: mount as non-root user')
source=("git+https://github.com/Teklad/${pkgname%-git}" suppress_warnings.patch)
md5sums=('SKIP'
         '02027f4d447ff2318afbce87490df382')
provides=('spacefm')
conflicts=('spacefm')

pkgver() {
  cd ${pkgname%-git}
  printf "%s" $(git describe --tags|tr - .)
}

prepare() {
  cd ${pkgname%-git}
  git apply "$srcdir"/suppress_warnings.patch
}

build() {
  cd ${pkgname%-git}
  CPPFLAGS="" ./autogen.sh --with-gtk3 --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/bin/spacefm-installer
}
