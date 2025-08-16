# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-rounded-window-corners-git
pkgver=11.r48.ga7a10ae
pkgrel=1
pkgdesc="A GNOME Shell extension that adds rounded corners for all windows"
arch=('any')
url="https://github.com/yilozt/rounded-window-corners"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=(
  'git'
  'gobject-introspection'
  'jq'
  'yarn'
  'zip'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/yilozt/rounded-window-corners.git'
        'https://github.com/yilozt/rounded-window-corners/pull/159.patch')
sha256sums=('SKIP'
            'd12c3ec0684d275fcd35afd916837682f078e1dd13e929ac84cb1ab4a02783e6')

pkgver() {
  cd rounded-window-corners
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd rounded-window-corners

  # GNOME 46
  patch -Np1 -i ../159.patch
}

build() {
  cd rounded-window-corners
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn install
  yarn build
  yarn ext:pack
}

package() {
  cd rounded-window-corners
  _uuid=$(jq -r .uuid _build/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dvm644 _build/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
