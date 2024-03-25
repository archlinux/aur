# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur
# Contributor: malacology <guoyizhang at malacology dot net>
pkgname=gnome-shell-extension-blur-my-shell
_uuid=blur-my-shell@aunetx
pkgver=58
pkgrel=2
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
_commit=3539a81b34694a69863d596d20c6dbdc382e25c3  # tags/v58^0
source=("git+https://github.com/aunetx/blur-my-shell.git#commit=${_commit}"
        'https://github.com/aunetx/blur-my-shell/pull/548.patch')
sha256sums=('341e4b65230df9ee33cf493bf3ec5467b2982d449aeba3593310d9d4d14db40d'
            'd125d1e009e0ee2c2bae5dc314633730f2d302322e44acfab2b315990ff3c563')

pkgver() {
  cd blur-my-shell
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd blur-my-shell

  # GNOME 46
  patch -Np1 -i ../548.patch
}

build() {
  cd blur-my-shell
  make
}

package() {
  cd blur-my-shell
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "build/${_uuid}.shell-extension.zip" \
    -C "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dm644 schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
