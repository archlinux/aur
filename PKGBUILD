# Maintainer: Network Jack <Network_Jack@null.net>

pkgname=bloodhound
_pkgname=BloodHound
pkgver=4.3.1
pkgrel=1
pkgdesc="Use graph theory to reveal the hidden and often unintended relationships within an Active Directory"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/BloodHoundAD/BloodHound"
license=('GPL3')
depends=('neo4j-community' 'java-runtime>=11')
makedepends=('electron' 'npm' 'python-sphinx' 'python-sphinx_rtd_theme')
optdepends=('python-bloodhound: Python injest tool that runs on natively on Linux')
source=("https://github.com/BloodHoundAD/BloodHound/archive/refs/tags/v${pkgver}.tar.gz"
	"bloodhound.desktop")
sha256sums=('a0c98140059b25dc1cb1e31f7a809d62b855b5947ee39bbc77c0867819d2d993'
            '8a64de7e9fc4857fadd890cc8966a641a896077eb2c869a7eb0987074dcd02c2')
build() {
  cd "${_pkgname}-${pkgver}"
  export NODE_OPTIONS=--openssl-legacy-provider
  HOME="$srcdir/.electron-gyp" npm install
  #HOME="$srcdir/.electron-gyp" npm run linuxbuild
  HOME="$srcdir/.electron-gyp" npm run build:linux
  # Documentation
  cd docs
  make man html
  cd ..
}

package() {
  # Desktop file
  install -Dm644 bloodhound.desktop "${pkgdir}/usr/share/applications/bloodhound.desktop"
  
  cd "${_pkgname}-${pkgver}"
 
  # The App 
  install -d "${pkgdir}/opt/${pkgname}/"
  if [ "${CARCH}" == "x86_64" ];then
    cp -ra BloodHound-linux-x64/* "${pkgdir}/opt/${pkgname}/"
   elif [ "${CARCH}" == "aarch64" ];then
    cp -ra BloodHound-linux-arm64/* "${pkgdir}/opt/${pkgname}/"
   elif [ "${CARCH}" == "armv7h" ];then
    cp -ra BloodHound-linux-armv7l/* "${pkgdir}/opt/${pkgname}/"
  fi
  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/BloodHound" "${pkgdir}/usr/bin/${pkgname}"
  
  # install manpage
  install -Dm644 docs/_build/man/bloodhound.1 "${pkgdir}/usr/share/man/man1/bloodhound.1"
  
  # install html docs
  mkdir -p "${pkgdir}/opt/${pkgname}/docs/"
  cp -ra docs/_build/html/* "${pkgdir}/opt/${pkgname}/docs/"
  
  # Install windows collectors
  mkdir -p "${pkgdir}/opt/${pkgname}/collectors/"
  cp -ra Collectors/* "${pkgdir}/opt/${pkgname}/collectors/"
  mkdir -p "${pkgdir}/usr/share/windows-binaries/"
  ln -s "/opt/${pkgname}/collectors" "${pkgdir}/usr/share/windows-binaries/bloodhound-collectors"
 
  # Install icons
  install -Dm644 "src/img/logo-white-on-transparent.png" "${pkgdir}/usr/share/pixmaps/bloodhound-white.png"
  install -Dm644 "src/img/logo-white-transparent.png" "${pkgdir}/usr/share/pixmaps/bloodhound-rbw.png"
  install -Dm644 "src/img/logo-white-transparent-full.png" "${pkgdir}/usr/share/pixmaps/bloodhound-redandblack.png"
}
