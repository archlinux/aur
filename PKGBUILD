# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-blur-my-shell-git
pkgver=58.r7.g90b10b2
_uuid=blur-my-shell@aunetx
pkgrel=1
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/aunetx/blur-my-shell.git')
sha256sums=('SKIP')

pkgver() {
  cd blur-my-shell
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd blur-my-shell
}

build() {
  cd blur-my-shell
  make
}

package() {
  cd blur-my-shell
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar xvf "build/${_uuid}.shell-extension.zip" \
    -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/locale" "$pkgdir/usr/share"

  install -Dm644 "schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}
