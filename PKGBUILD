# Maintainer: Rubin Simons <me@rubin55.org>

_branch=main # Don't forget to reset back to main after 49.x work merge
pkgname=gnome-shell-extension-tiling-shell-git
pkgdesc="Extend GNOME Shell with advanced tiling window management"
pkgver=r57.088ecf6
pkgrel=1
arch=('any')
url="https://github.com/domferr/tilingshell"
license=('GPL2')
depends=('gnome-shell>=42')
makedepends=('nodejs' 'npm' 'zip')
provides=('gnome-shell-extension-tiling-shell' 'gnome-shell-extension-tilingshell')
conflicts=('gnome-shell-extension-tiling-shell' 'gnome-shell-extension-tilingshell')
source=("${pkgname}::git+${url}.git#branch=${_branch}")
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  export npm_config_cache="$srcdir/npm_cache"
  npm install
  npm run build:package
}

package() {
  cd "${srcdir}/${pkgname}"

  _uuid="tilingshell@ferrarodomenico.com"
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d "${_install_dir}"
  bsdtar xvf "${_uuid}.zip" -C "${_install_dir}/" --no-same-owner

  mv "${_install_dir}/locale" "$pkgdir/usr/share/"

  install -Dvm644 dist/schemas/org.gnome.shell.extensions.tilingshell.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"

  install -Dvm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
