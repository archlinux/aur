# Maintainer: Snehit Sah <snehitsah at protonmail dot com>
pkgname=gamma-text-editor
pkgver=0.0.2b
pkgrel=1
epoch=1
pkgdesc="A lightweight text editor, alternative to Gedit or Notepad++"
arch=(x86_64 i686)
url="https://gitlab.com/snehitsah/gamma-text-editor"
license=("GPL3")
depends=("python3" "gtk3" "gtksourceview4" "gobject-introspection")
install="${pkgname}.install"
source=(${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
sha256sums=("SKIP")

prepare() {
  cp "$PWD/${pkgname}-v${pkgver}/bin/io.gitlab.hamadmarri.gamma.desktop.bak" "$PWD/${pkgname}-v${pkgver}/bin/io.gitlab.hamadmarri.gamma.desktop"
  sed -i -e "s,\[gamma path placeholder\],/opt/${pkgname}/bin/gamma," "$PWD/${pkgname}-v${pkgver}/bin/io.gitlab.hamadmarri.gamma.desktop"
  sed -i "0,/packaged = False/s//packaged = True/" "$PWD/${pkgname}-v${pkgver}/gamma.py"
}

package() {
  mkdir -p "$PWD/${pkgname}-v${pkgver}/home_dir_data/"
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/opt/${pkgname}/"
  mkdir -p "${pkgdir}/usr/share/gtksourceview-4/styles/"
  mv $PWD/${pkgname}-v${pkgver}/{config.py,ui,style,plugins,signal_handler.py} "$PWD/${pkgname}-v${pkgver}/home_dir_data/"
  install -D "$PWD/${pkgname}-v${pkgver}/bin/icon.svg" "${pkgdir}/usr/share/icons/io.gitlab.hamadmarri.gamma.svg"
  install -D "$PWD/${pkgname}-v${pkgver}/bin/io.gitlab.hamadmarri.gamma.desktop" "${pkgdir}/usr/share/applications/io.gitlab.hamadmarri.gamma.desktop"
  install -D $PWD/${pkgname}-v${pkgver}/gtksourceview_styles/* "${pkgdir}/usr/share/gtksourceview-4/styles/"
  cp $PWD/${pkgname}-v${pkgver}/* "${pkgdir}/opt/${pkgname}/" -r
  ln -s "/opt/${pkgname}/bin/gamma" ${pkgdir}/usr/bin/gamma-editor
}
