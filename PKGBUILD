# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-forge-git
pkgver=89.r14.g1bf4b21
pkgrel=2
_gnome_ver=49
pkgdesc="Tiling and Window Manager for Gnome-Shell"
arch=('any')
url="https://github.com/forge-ext/forge"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
  'less'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/forge-ext/forge.git'
        'https://github.com/forge-ext/forge/pull/588.patch')
sha256sums=('SKIP'
            'affff0a15c7f39d1eaeaa39ebbf1742a314504da7be40a0e78652dd915b09e27')

pkgver() {
  cd forge
  git describe --long --tags --abbrev=7 | sed "s/^v${_gnome_ver}-//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
  cd forge

  # fix: gnome 51 unready window crash
  patch -Np1 -i ../588.patch
}

build() {
  cd forge
  make build
}

package() {
  cd forge
  _uuid=$(jq -r .uuid metadata.json)

  make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" install

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
