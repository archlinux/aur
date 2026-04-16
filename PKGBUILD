# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-gradia-capture-git
pkgver=r35.f545fde
pkgrel=1
pkgdesc="Enhances the GNOME built-in screenshot tool with the annotation features you would expect."
arch=('any')
url="https://github.com/AlexanderVanhee/gradia-capture"
license=('GPL-3.0-or-later')
depends=(
  'gnome-shell'
  'gradia'
)
makedepends=(
  'git'
  'jq'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/AlexanderVanhee/gradia-capture.git')
sha256sums=('SKIP')

pkgver() {
  cd gradia-capture
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd gradia-capture
  gnome-extensions pack src \
    $(find src -maxdepth 1 -name '*.js' -printf '--extra-source=%f ') \
    --extra-source=../icons/ \
    --force
}

package() {
  cd gradia-capture
  _uuid=$(jq -r .uuid src/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
}
