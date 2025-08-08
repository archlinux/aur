# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Alad Wenter <nynq@nepuyvahk.vasb> (rot13)
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

_pkgname=thunar
pkgname=${_pkgname}-git
pkgver=4.21.2+110+gf7f404cc0
pkgrel=1
pkgdesc='File manager for Xfce (git checkout)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL-2.0-or-later')
groups=('xfce4-git')
url='https://thunar.xfce.org'
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libgudev'
         'libgexiv2' 'libnotify' 'libpng' 'libxfce4ui>=4.21.0' 'libxfce4util')
makedepends=('meson' 'xfce4-dev-tools' 'xfce4-panel' 'gtk-doc' 'gobject-introspection')
optdepends=('gvfs: trash support, mounting with udisks, and remote filesystems'
            'xfce4-panel: trash applet'
            'tumbler: for thumbnail previews'
            'thunar-volman: manages removable devices'
            'thunar-archive-plugin: create and deflate archives'
            'thunar-media-tags-plugin: view/edit id3/ogg tags'
            'catfish: file search')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  local meson_options=(
    -D gtk-doc=true
    -D gudev=enabled
    -D gexiv2=enabled
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
