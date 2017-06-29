# Maintainer: fusion809
# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

_pkgname=atom
_version=beta

# Versions
pkgname=${_pkgname}-editor-${_version}
_pkgrel=1
_pkgver=1.19.0
pkgver="${_pkgver}.beta${_pkgrel}"
_ver=$_pkgver-beta${_pkgrel}
pkgrel=1
pkgdesc='Hackable text editor for the 21st Century, built using web technologies on the Electron framework - Beta channel.'
arch=('x86_64' 'i686')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs-lts-boron' 'nss' 'python2')
optdepends=('gvfs: file deletion support')
makedepends=('git' 'npm')
conflicts=('atom-editor-beta-bin' 'atom-editor-beta-arch')
install=atom.install
source=("${_pkgname}-${_pkgver}-${_version}${_pkgrel}.tar.gz::$url/archive/v${_pkgver}-${_version}${_pkgrel}.tar.gz"
"${_pkgname}-${_version}.desktop")
sha256sums=('SKIP'
            'c62faaf2f50cddb1a834ccb33c95724076d2859c88baac7d9d676bc9c3afc8c6')

prepare() {
	cd "$srcdir/${_pkgname}-${_pkgver}-${_version}${_pkgrel}"

	sed -i -e "/exception-reporting/d" \
		-e "/metrics/d" \
	package.json

	chmod 755 -R package.json
	sed -i -e 's@node script/bootstrap@node script/bootstrap --no-quiet@g' \
		./script/build

	sed -i -e "s/<%=Desc=%>/$pkgdesc/g" ${srcdir}/${_pkgname}-${_version}.desktop
}

build() {
	cd "$srcdir/${_pkgname}-${_pkgver}-${_version}${_pkgrel}"

	export PYTHON=/usr/bin/python2
	until ./script/build; do :; done
}

package() {
	cd "$srcdir/${_pkgname}-${_pkgver}-${_version}${_pkgrel}"

	_ver=$(cat package.json | grep version | sed 's/version//g' | sed 's/://g' | sed 's/ //g' |  sed 's/"//g' | sed 's/,//g')

	_arch=amd64
	
	if [ "${CARCH}" = "i686" ]; then
	_arch=i386
	fi
  
	install -dm755 ${pkgdir}/usr/bin
	install -dm755 ${pkgdir}/usr/share/${_pkgname}-${_version}
	install -dm755 ${pkgdir}/usr/share/applications
	install -dm755 ${pkgdir}/usr/share/licenses/$pkgname
	install -dm755 ${pkgdir}/usr/share/pixmaps

	cp -r out/${_pkgname}-${_version}-${_ver}-${_arch}/* ${pkgdir}/usr/share/${_pkgname}-${_version}/
	mv ${pkgdir}/usr/share/${_pkgname}-${_version}/atom.png ${pkgdir}/usr/share/pixmaps/${_pkgname}-${_version}.png
	mv ${pkgdir}/usr/share/${_pkgname}-${_version}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 $srcdir/${_pkgname}-${_version}.desktop ${pkgdir}/usr/share/applications/${_pkgname}-${_version}.desktop
	cp ${pkgdir}/usr/share/${_pkgname}-${_version}/resources/app/atom.sh ${pkgdir}/usr/bin/atom-beta
	rm -rf ${pkgdir}/usr/share/${_pkgname}-${_version}/resources/app.asar.unpacked/resources
	ln -sf "/usr/share/${_pkgname}-${_version}/resources/app/apm/node_modules/.bin/apm" "${pkgdir}/usr/bin/apm-${_version}"

	find "$pkgdir" \
		-name "*.a" -exec rm '{}' \; \
		-or -name "*.bat" -exec rm '{}' \; \
		-or -name "benchmark" -prune -exec rm -r '{}' \; \
		-or -name "doc" -prune -exec rm -r '{}' \; \
		-or -name "html" -prune -exec rm -r '{}' \; \
		-or -name "man" -prune -exec rm -r '{}' \; \
		-or -path "*/less/gradle" -prune -exec rm -r '{}' \; \
		-or -path "*/task-lists/src" -prune -exec rm -r '{}' \; \
		-or -name "package.json" -exec sed -i -e "s|${srcdir}/atom-${_ver}/apm|/usr/share/${_pkgname}-${_version}/resources/app/apm|g" '{}' +
}
