# Maintainer zml <zml@aoeu.xyz>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=yourkit
_version=2018.04
_build=86
pkgver=${_version}b${_build}
pkgrel=1
pkgdesc="Java CPU and memory profiler."
arch=(i686 x86_64)
url="http://www.yourkit.com"
license=(custom)
depends=(desktop-file-utils bash)
optdepends=('intellij-idea-community-edition: A Java IDE that integrates with Yourkit'
            'eclipse: A Java IDE that integrates with Yourkit'
            'netbeans: A Java IDE that integrates with Yourkit')
options=(!strip)
source=(https://www.yourkit.com/download/YourKit-JavaProfiler-${_version}-b${_build}.zip)
sha256sums=('dc78ce4362871ba2757c73aba176b18d0ecc654b1b6cb83c08819a784c6e39c0')

build() {
  msg2 "Generate scripts for /usr/bin..."
  cat <<EOF > "${srcdir}"/${pkgname}.sh
#!/bin/sh
cd /opt/${pkgname}/bin && sh profiler.sh $@
EOF

  msg2 "Generate desktop application entry for recorder..."
  cat > "${srcdir}"/${pkgname}.desktop << EOF
[Desktop Entry]
Name=Yourkit
Comment=${pkgdesc}
Exec=/usr/bin/${pkgname} %u
Icon=/opt/${pkgname}/bin/profiler.ico
Terminal=false
Type=Application
Categories=Application;Development;
EOF
}

package() {
  msg2 "Install the assembly at /opt/${pkgname}..."
  install -dm755                                      "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}"/YourKit-JavaProfiler-${_version}/* "${pkgdir}/opt/${pkgname}"

  msg2 "Install an executable at /usr/bin/${pkgname}..."
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  msg2 "Install links to the documentation resources at /usr/share/doc/${pkgname}..."
  install -dm755                "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s /opt/${pkgname}/probes  "${pkgdir}/usr/share/doc/${pkgname}/probes"
  ln -s /opt/${pkgname}/samples "${pkgdir}/usr/share/doc/${pkgname}/samples"

  msg2 "Install links to copyright resources at /usr/share/licenses/${pkgname}..."
  install -dm755                            "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/${pkgname}/license.html        "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s /opt/${pkgname}/license-redist.txt  "${pkgdir}/usr/share/licenses/${pkgname}/"

  msg2 "Install desktop application entry in /usr/share/applications..."
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}

# vim:set ts=2 sw=2 et:
