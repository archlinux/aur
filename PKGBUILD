# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=gnome-shell-extension-datetime-format-git
pkgver=r3.9773e76
pkgrel=1
pkgdesc="Gnome extension which allows users to customise the datetime format on the status bar and date menu."
arch=(any)
url="https://github.com/Daniel-Khodabakhsh/datetime-format"
license=(GPL3)
depends=('gnome-shell>=3.20')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'nodejs')
install='gnome-shell-extension.install'
source=("${pkgname%-git}"::"git+https://github.com/Daniel-Khodabakhsh/datetime-format.git"
	"build.patch")
sha256sums=('SKIP'
            'ca11b183e163eb143ea3a7ae937df07bd9759ff141764ac09117364cff8fc10d')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch -p1 -i "${srcdir}/build.patch" 
}

build() {
  cd "$srcdir/${pkgname%-git}"
  node build.js system
}

package() {
  cd "$srcdir/${pkgname%-git}"
  cp -a pkg/* $pkgdir/
}
