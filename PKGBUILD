# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Daniel Gerbaudo <info@danielgerbaudo.com>

pkgname=procexp
pkgver=20200715
_commit=ebd5d47d4e457d3776754eda9068ced7e31fc3e8
pkgrel=1
pkgdesc="Graphical process explorer for Linux"
arch=('any')
url="https://github.com/wolfc01/${pkgname}"
license=('GPL3')
depends=('ethtool'
	 'polkit'
	 'python-configobj'
	 'python-pyqt-qwt'
	 'python-pyqt5'
	 'tcpdump')
source=("${pkgname}-${_commit}.tar.gz::https://github.com/wolfc01/${pkgname}/archive/${_commit}.tar.gz"
	"${pkgname}.patch")
sha256sums=('ac5541e5bdd6ba82e9fda11f78c98cbfbf6d0dc887c276cc5a10c80ce4972799'
            '19d93a5cd060a58f69df92e948cc67850c92d0f974594ff255c59216d03bd543')

prepare() {
  mv ${pkgname}-{$_commit,$pkgver}

  # Patch (upstream is not maintained)
  cd "${pkgname}-${pkgver}"
  patch --strip=1 --input="${srcdir}/${pkgname}.patch"
  
  # Remove RPM tools
  rm make_rpm.py process_explorer.spec

  # Fix .desktop file
  sed -i -e "s/${pkgname}.sh/${pkgname}/" -e "s/.*icon.png$/Icon=${pkgname}/" \
	-e "s/StartupNotify=True/StartupNotify=true/" "${pkgname}.desktop"

  # Fix wrapper
  sed -i '1i #!/bin/bash\n' "${pkgname}.sh"
}

package() {
  cd "${pkgname}-${pkgver}"
  
  # Install Python components
  install -d "${pkgdir}/usr/lib/${pkgname}"
  find ./ -type f -name '*.py' -perm 0644 -exec install -Dm0644 "{}" "${pkgdir}/usr/lib/${pkgname}/""{}" \;
  find ./ -type f -name '*.py' -perm 0755 -exec install -D "{}" "${pkgdir}/usr/lib/${pkgname}/""{}" \;
  find ./ -type f -name '*.ui' -exec install -Dm0644 "{}" "${pkgdir}/usr/lib/${pkgname}/""{}" \;
  install -Dm0644 ./ui/icon.png "${pkgdir}/usr/lib/${pkgname}/ui/icon.png"
  install -Dm0644 ./rootproxy/log.txt "${pkgdir}/usr/lib/${pkgname}/rootproxy/log.txt"
  
  # Install wrapper
  install -D "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  
  # Install freedesktop components
  install -Dm0644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm0644 icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install polkit component
  install -Dm0644 "com.${pkgname}.pkexec.policy" "${pkgdir}/usr/share/polkit-1/actions/com.${pkgname}.pkexec.policy"
}
