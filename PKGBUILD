# Maintainer: weearc <q19981121@163.com>
pkgname=motrix
_pkgname=Motrix
pkgver=git20190211
_pkgver=1.1.1
pkgrel=5
epoch=
pkgdesc="elegent downloading tool frontend for aria2c,using vue(release version)"
arch=("x86_64")
url="https://github.com/agalwood/Motrix"
license=('MIT')
groups=()
depends=('bash'
	 'tar')
makedepends=('npm'
	     'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("Motrix.desktop"
	"aria2.conf"
	"motrix"
	"Motrix.tar.gz"::"https://github.com/agalwood/Motrix/archive/v$_pkgver.tar.gz")
noextract=()
md5sums=('SKIP'
	'SKIP'
	'SKIP'
	'SKIP')
validpgpkeys=()

prepare() {
	tar -xvf $_pkgname.tar.gz
	rm $_pkgname.tar.gz
	mv $_pkgname-$_pkgver $_pkgname
	npm config set registry 'https://registry.npm.taobao.org'
	export ELECTRON_MIRROR='https://npm.taobao.org/mirrors/electron/'
	export SASS_BINARY_SITE='https://npm.taobao.org/mirrors/node-sass'
	sed -i '/"dmg"/,/"linux"/{//!d}' $_pkgname/package.json
	sed -i '/"dmg"/d' $_pkgname/package.json
	sed -i '/"deb"/d' $_pkgname/package.json
	sed -i '/"snap"/d' $_pkgname/package.json
	sed -i '/"pacman"/d' $_pkgname/package.json
	sed -i '/"rpm"/d' $_pkgname/package.json
	sed -i 's/"AppImage"/"dir"/g' $_pkgname/package.json
	
}

build() {
	cd $_pkgname/
	npm install
	npm run build
}
package() {
	install -d ${pkgdir}/opt
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/share/icons
	install -d ${pkgdir}/usr/share/applications
	mv ${srcdir}/$_pkgname/release/linux-unpacked/ ${pkgdir}/opt/motrix
	install -Dm644 ${srcdir}/$_pkgname/build/256x256.png ${pkgdir}/usr/share/icons/$pkgname.png
#	echo -e "#!/bin/bash \n /opt/motrix/motrix" >> ${pkgdir}/usr/bin/motrix
	install -Dm 777 ${srcdir}/motrix ${pkgdir}/usr/bin
#	chmod a+x ${pkgdir}/usr/bin/motrix
	install -Dm 644 ${srcdir}/Motrix.desktop ${pkgdir}/usr/share/applications
	rm ${pkgdir}/opt/motrix/resources/engine/aria2.conf	
	install -Dm 644 ${srcdir}/aria2.conf ${pkgdir}/opt/motrix/resources/engine/aria2.conf
#	ln -s /usr/bin/aria2c ${pkgdir}/opt/motrix/reources/engine/aria2
	rm -rf ${srcdir}
}
