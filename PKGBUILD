# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgname=gnome-shell-extension-arch-update-git
pkgver=33+1+ge9de0e4
pkgrel=1
pkgdesc='Convenient indicator for Arch Linux updates in GNOME Shell'
url='https://github.com/RaphaelRochet/arch-update'
license=('GPL')
arch=('any')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
depends=(gnome-shell)
makedepends=('git' 'jq')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//; s/-/+/g'
}

package() {
  cd "$pkgname"
  uuid=$(jq -r '.uuid' metadata.json)
  destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"
  install -dm755 "$destdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE.txt
  install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas" schemas/org.gnome.shell.extensions.arch-update.gschema.xml
  rm -r LICENCE.txt README.md locale/*/*.po schemas
  cp -a * "$destdir"
}
