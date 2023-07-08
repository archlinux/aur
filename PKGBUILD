# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Ulrik Boll Djurtoft <ullebe1@gmail.com>
pkgname=appeditor-git
_app_id=com.github.donadigo.appeditor
pkgver=1.1.3.r8.gf170b6b
pkgrel=1
pkgdesc="Allows you to edit application entries in the application menu."
arch=('x86_64')
url="https://github.com/donadigo/appeditor"
license=('GPL3')
depends=('gtk3' 'granite')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
sha256sums=('SKIP')
source=('git+https://github.com/donadigo/appeditor.git')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {

#  No tests defined
#  meson test -C build --print-errorlogs

  desktop-file-validate build/data/${_app_id}.desktop
  appstreamcli validate build/data/${_app_id}.appdata.xml
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s /usr/bin/${_app_id} "$pkgdir/usr/bin/${pkgname%-git}"
}
