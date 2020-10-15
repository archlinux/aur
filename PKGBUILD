# Maintainer: Snehit Sah <snehitsah at protonmail dot com>
pkgname=gamma-text-editor
pkgver=0.0.2
pkgrel=1
pkgdesc="A lightweight text editor, alternative to Gedit or Notepad++"
arch=('any')
url="https://gitlab.com/hamadmarri/gamma-text-editor"
license=("GPL3")
depends=("python3" "gtk3" "gtksourceview4" "gobject-introspection")
install="${pkgname}.install"
source=(${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
sha256sums=("SKIP")

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  rm "${pkgdir}/usr/bin/gamma-editor-init.sh" -f
  echo "mkdir -p /home/\$USER/.config/gamma-text-editor/" >> "${pkgdir}/usr/bin/gamma-editor-init.sh"
  echo "cp /opt/gamma-text-editor/config/* /home/\$USER/.config/gamma-text-editor/ -r" >> "${pkgdir}/usr/bin/gamma-editor-init.sh"
  echo "chmod 755 -R /home/\$USER/.config/gamma-text-editor/" >> "${pkgdir}/usr/bin/gamma-editor-init.sh"
  chmod +x "${pkgdir}/usr/bin/gamma-editor-init.sh"
  sed -i "32i import os" $PWD/${pkgname}-v${pkgver}/gamma.py
  sed -i "38i sys.path.append(os.path.expanduser('~/.config/gamma-text-editor'))" $PWD/${pkgname}-v${pkgver}/gamma.py
  install -D "$PWD/${pkgname}-v${pkgver}/bin/icon.svg" "${pkgdir}/usr/share/icons/io.gitlab.hamadmarri.gamma.svg"
  cp "$PWD/${pkgname}-v${pkgver}/bin/io.gitlab.hamadmarri.gamma.desktop.bak" "$PWD/${pkgname}-v${pkgver}/bin/io.gitlab.hamadmarri.gamma.desktop"
  sed -i -e "s,\[gamma path placeholder\],/opt/${pkgname}/bin/gamma," "$PWD/${pkgname}-v${pkgver}/bin/io.gitlab.hamadmarri.gamma.desktop"
  install -D "$PWD/${pkgname}-v${pkgver}/bin/io.gitlab.hamadmarri.gamma.desktop" "${pkgdir}/usr/share/applications/io.gitlab.hamadmarri.gamma.desktop"
  mkdir -p "${pkgdir}/usr/share/gtksourceview-4/styles/"
  install -D $PWD/${pkgname}-v${pkgver}/gtksourceview_styles/* "${pkgdir}/usr/share/gtksourceview-4/styles/"
  install -Dm644 "$PWD/${pkgname}-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/opt/${pkgname}/"
  mkdir -p "$PWD/${pkgname}-v${pkgver}/config/"
  mv $PWD/${pkgname}-v${pkgver}/{config.py,ui,style,plugins,signal_handler.py} "$PWD/${pkgname}-v${pkgver}/config/"
  cp $PWD/${pkgname}-v${pkgver}/* "${pkgdir}/opt/${pkgname}/" -r
  ln -s "/opt/${pkgname}/bin/gamma" ${pkgdir}/usr/bin/gamma-editor
}
