# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur
# Contributor: malacology <guoyizhang at malacology dot net>
pkgname=gnome-shell-extension-blur-my-shell
_uuid=blur-my-shell@aunetx
pkgver=59
pkgrel=1
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
_commit=ecf9990983091915defc67a71fcfe297f38a085c  # tags/v59^0
source=("git+https://github.com/aunetx/blur-my-shell.git#commit=${_commit}")
sha256sums=('73f97e2bb042bdaf266b3ede0d9e5edd16232f065ef483b508540daa943d7606')

pkgver() {
  cd blur-my-shell
  git describe --tags | sed 's/^v//;s/-/+/g'
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
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "build/${_uuid}.shell-extension.zip" \
    -C "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dm644 schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
