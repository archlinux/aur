#Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('clashy-git')
pkgver=0.1.21
pkgrel=1
pkgdesc="A GUI proxy client for Windows / Mac / Ubuntu Desktop based on Clash and Electron. Windows / Mac / Ubuntu 适用的Clash客户端."
provides=("clashy")
url='https://github.com/SpongeNobody/Clashy'
arch=('x86_64')
makedepends=('yarn' 'git' 'nodejs')
depends=('libnotify' 'nss' 'libxss' 'xdg-utils' 'libappindicator-gtk3' 'libsecret' 'gobject-introspection-runtime' 'ffmpeg')
source=("git+https://github.com/SpongeNobody/Clashy")
md5sums=('SKIP')
license=()


prepare(){
      cd "${srcdir}"/Clashy
      git checkout -b development origin/development
      
      cd "${srcdir}"
      echo -e "[Desktop Entry]\nName=Clashy\nExec=/opt/Clashy/clashy %U\nTerminal=false\nType=Application\nIcon=clashy\nStartupWMClass=Clashy\nComment=Electron based Clash client. For Windows, macOS & Ubuntu\nCategories=Utility;"  >  clashy.desktop
}

pkgver(){
     cd "${srcdir}"/Clashy
     node -p -e "require('./package.json').version"
}

build(){
     cd "${srcdir}"/Clashy
     yarn install
     node pre-build.js
     yarn run pack
}

package(){
	 cd ${srcdir}/Clashy/dist/linux-unpacked
	 
	 install -dm755 "${pkgdir}"/opt/Clashy
	 install -dm755 "${pkgdir}"/usr/bin
	 cp -r * "${pkgdir}"/opt/Clashy
	 ln -s /opt/Clashy/clashy "${pkgdir}"/usr/bin/clashy
	 
	 install -Dm644 "${srcdir}"/Clashy/build-resources/icon.png "${pkgdir}"/usr/share/icons/clashy.png
	 
	 install -Dm644 "${srcdir}"/clashy.desktop "${pkgdir}"/usr/share/applications/clashy.desktop
	 
	 rm -rf "${pkgdir}"/opt/Clashy/libEGL.so
	 rm -rf "${pkgdir}"/opt/Clashy/libGLESv2.so
	 
}
