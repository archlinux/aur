# Former Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Current Maintainer: Ning Sun <sunng@about.me>
pkgname=eclipse-mat
_pgname=MemoryAnalyzer
_pkgver=1.10.0
pkgver=1.10.0
_releasedate=20200225
pkgrel=1
pkgdesc="Eclipse Memory Analyzer Tool (MAT), a toolkit for analyzing Java heap dumps."
arch=(i686 x86_64)
url="http://www.eclipse.org/mat"
license=(EPL)
depends=('java-runtime>=8' 'gtk2')
install=${pkgname}.install
sha512sums_i686=('e64ce6dd39cef1759a9320211627593fa385d04db04427e5f1bd6b8600cbc7dd8764c4ddddeaf822b0714b1c1f1b417fde56cd8ac8026ce133beae7361f67739')
sha512sums_x86_64=('60b2a91812e31c4982e992a48706098931a2f5a8d9eb72a7794d4d8fb601d97d87733f11e24dab114b0b633e40e0393534ec44def10e585b5b42993287bcb5b7')
source_i686=("${pkgname}-${pkgver}-x86.zip::http://download.eclipse.org/mat/${_pkgver}/rcp/${_pgname}-${pkgver}.${_releasedate}-linux.gtk.x86.zip")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::http://download.eclipse.org/mat/${_pkgver}/rcp/${_pgname}-${pkgver}.${_releasedate}-linux.gtk.x86_64.zip")


build() {
  msg2 "Generate desktop application entry..."
  cat > "${srcdir}"/${pkgname}.desktop << EOF
[Desktop Entry]
Version=${pkgver}
Encoding=UTF-8
Name=Eclipse MAT
Comment=${pkgdesc}
Exec=/usr/bin/${pkgname}
Terminal=false
Type=Application
Categories=Development;
EOF
}

package() {
  msg2 "Install the assembly at /opt/${pkgname}..."
  install -dm755          "${pkgdir}"/opt/${pkgname}
  cp -a "${srcdir}"/mat/* "${pkgdir}"/opt/${pkgname}

  msg2 "Install link to the executable in /usr/bin..."
  install -dm755                   "${pkgdir}"/usr/bin
  ln -s /opt/${pkgname}/${_pgname} "${pkgdir}"/usr/bin/${pkgname}

  msg2 "Install link to the config file in /etc..."
  install -dm755                       "${pkgdir}"/etc
  ln -s /opt/${pkgname}/${_pgname}.ini "${pkgdir}"/etc/${pkgname}.ini

  msg2 "Install links to copyright resources at /usr/share/licenses/${pkgname}..."
  install -dm755                     "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/${pkgname}/epl-v10.html "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s /opt/${pkgname}/notice.html  "${pkgdir}/usr/share/licenses/${pkgname}/"

  msg2 "Install desktop application entry in /usr/share/applications..."
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
