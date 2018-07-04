# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Tom Wizetek <tom@wizetek.com>

pkgname=jxplorer
pkgver=3.3.1.2
pkgrel=3
pkgdesc='Java LDAP browser and editor'
url='http://jxplorer.org/'
license=('custom')
arch=('any')
depends=('java-runtime')
makedepends=('apache-ant' 'java-environment=8' 'gendesk')
source=("https://github.com/pegacat/jxplorer/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('a70cd8675de1be82282f975459066b2ac93429a206d7c7c801f1aa861d66684f'
            '52bf7ce677d0e1cc9fc82f99ed1bb9934eb6141783e11e4265cfea256ed52b64')

prepare() {
  cd "${pkgname}-${pkgver}"

  cat > "${pkgname}" << EOF
#!/bin/sh
cd "/opt/${pkgname}"
sh jxplorer.sh "\$@"
EOF

  chmod +x ${pkgname}
  gendesk --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --exec "/usr/bin/jxplorer" -n

  patch -p1 -i ../${pkgname}.patch

  install -d plugins
  install -d jasper/{lib,lib_extras}
}

build() {
  cd "${pkgname}-${pkgver}"
  
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk ant dist
}

package() {
  install -d "${pkgdir}/opt"

  cd "${pkgname}-${pkgver}"

  cp -r "dist/${pkgname}" "${pkgdir}/opt"

  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/JXplorer.desktop"
  install -Dm644 images/JX128.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
