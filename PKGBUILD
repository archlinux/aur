# Maintainer: p0358
# Contributor: Daniel Gerbaudo <info@danielgerbaudo.com>
# Contributor: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=procexp
pkgver=2.0.0
pkgrel=1
pkgdesc="Graphical process explorer for Linux"
arch=('any')
url="https://github.com/wolfc01/$pkgname"
license=('GPL3')
depends=('ethtool'
	 'polkit'
	 'python-pyqt6'
	 'python-configobj'
	 'python-pyqtgraph'
	 'tcpdump')
_commitish=refs/tags/v$pkgver
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commitish}.tar.gz"
        "${pkgname}.sh")
sha256sums=('123e8e8eb1c0b03a3c70effec9bd1be64d7404d998c8a57eab339580c40fde06'
            '488c90df45a24f507ff467b52e0f7e0b2a44dd21c7047812e6ba818d0d84a75d')

prepare() {
  cd "${pkgname}-${pkgver}"
  
  # Remove RPM tools
  rm make_rpm.py process_explorer.spec

  # Fix .desktop file
  sed -i \
    -e "s/^Exec=.*/Exec=$pkgname/" \
    -e "s/^Icon=.*$/Icon=$pkgname/" \
	  -e "s/StartupNotify=True/StartupNotify=true/" \
    "${pkgname}.desktop"
  if ! grep -q "Keywords=" "${pkgname}.desktop"; then
    echo "Keywords=procexp;system monitor;task manager;htop;" >> "${pkgname}.desktop"
  fi
}

package() {
  install -Dm755 "${pkgname}.sh" "$pkgdir"/usr/bin/$pkgname

  cd "${pkgname}-${pkgver}"
  
  # Install Python components
  install -d "$pkgdir"/usr/lib/$pkgname
  find ./ -type f -name '*.py' -perm 0644 -exec install -Dm0644 "{}" "$pkgdir"/usr/lib/$pkgname/"{}" \;
  find ./ -type f -name '*.py' -perm 0755 -exec install -D "{}" "$pkgdir"/usr/lib/$pkgname/"{}" \;
  find ./ -type f -name '*.ui' -exec install -Dm0644 "{}" "$pkgdir"/usr/lib/$pkgname/"{}" \;
  install -Dm0644 ./ui/icon.png "$pkgdir"/usr/lib/$pkgname/ui/icon.png
  install -Dm0644 ./rootproxy/log.txt "$pkgdir"/usr/lib/$pkgname/rootproxy/log.txt
  rm -rf "$pkgdir"/usr/lib/$pkgname/.vscode
  
  # Install freedesktop components
  install -Dm644 "${pkgname}.desktop" -t "$pkgdir"/usr/share/applications/
  install -Dm644 icon.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/${pkgname}.png

  # Install documentation
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname/

  # Install polkit component
  install -Dm644 "com.${pkgname}.pkexec.policy" -t "$pkgdir"/usr/share/polkit-1/actions/
}
