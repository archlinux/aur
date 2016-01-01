# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=pgraph
_pkgname=pGraph
pkgver=2.4
pkgrel=1
pkgdesc="Read multiple performance data formats and produce graphs either interactively or in batch mode."
arch=(any)
url="http://www.ibm.com/developerworks/wikis/display/WikiPtype/pGraph"
license=(unknown) # FIXME
depends=('java-runtime>=5' 'bash')
install=${pkgname}.install
changelog=Changelog
source=("${_pkgname}.jar::https://www.ibm.com/developerworks/community/wikis/form/anonymous/api/wiki/61ad9cf2-c6a3-4d2c-b779-61ff0266d32a/page/d5563cad-faed-48f0-81ae-c38fc474eb0c/attachment/77291d2b-8a2b-4e82-954d-d495944cd29b/media/${pkgname}.jar"
        "${_pkgname}.properties::https://www.ibm.com/developerworks/community/wikis/form/anonymous/api/wiki/61ad9cf2-c6a3-4d2c-b779-61ff0266d32a/page/d5563cad-faed-48f0-81ae-c38fc474eb0c/attachment/8645f1e7-65f2-42b5-85ac-014b9b10b47a/media/${pkgname}.properties")
noextract=(${pkgname}.jar)
md5sums=('bd8f8e1088a5d4c0c615065d157b35b8'
         'f5f85be5ad803b61e1f3936557521896')

build() {
  msg2 "Generate executable script..."
  cat > "${srcdir}/${pkgname}.sh" << EOF
#!/bin/sh
cd '/usr/share/java/${pkgname}'
"\$JAVA_HOME/bin/java" -jar '${_pkgname}.jar' "\$@"
EOF

  msg2 "Generate desktop application entry..."
  cat > "${srcdir}/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=${_pkgname}
Comment=${pkgdesc}
TryExec=${pkgname}
Exec=${pkgname} %u
Icon=java
Terminal=false
Type=Application
Categories=Application;Utility;
EOF
}

package() {
  msg2 "Install the contents at /usr/share/java/${pkgname}..."
  install -Dm755 "${srcdir}/${_pkgname}.jar"        "${pkgdir}/usr/share/java/${pkgname}/${_pkgname}.jar"
  install -Dm644 "${srcdir}/${_pkgname}.properties" "${pkgdir}/usr/share/java/${pkgname}/${_pkgname}.properties"

  msg2 "Install the default settings file at /etc/${pkgname}..."
  install -dm755 "${pkgdir}/etc"
  ln -s "/usr/share/java/${pkgname}/${_pkgname}.properties" "${pkgdir}/etc/${pkgname}.properties"

  msg2 "Install an executable at /usr/bin/${pkgname}..."
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  msg2 "Install a desktop application entry at /usr/share/applications..."
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
