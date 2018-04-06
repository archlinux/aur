# Maintainer: fusion809
# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>
# Contributor: Salamandar <felix@piedallu.me>

_pkgname=atom
_version=beta
_pkgver=1.26.0
_pkgrel=1
_ver=${_pkgver}-beta${_pkgrel}
pkgname="${_pkgname}-editor-${_version}"
pkgdesc='Hackable text editor for the 21st Century, built using web technologies on the Electron framework - Beta channel.'
pkgver="${_pkgver}.${_version}${_pkgrel}"
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2')
optdepends=('gvfs: file deletion support')
makedepends=('git' 'npm')
conflicts=('atom-editor-beta-bin' 'atom-editor-beta-arch')
provides=('atom-editor-beta-bin')
install=atom.install

_archive="${_pkgname}-${_pkgver}-${_version}${_pkgrel}"
source=(
	"${_archive}.tar.gz::$url/archive/v${_ver}.tar.gz"
	"${_pkgname}-${_version}.desktop"
	"atom.install"
)
sha256sums=('02d3af109f71fe2ef0698e945663bfdff4cfc152ccc8f77f9bf654b868dd089f'
            'c62faaf2f50cddb1a834ccb33c95724076d2859c88baac7d9d676bc9c3afc8c6'
            '9fe12f1bc573f5d431fcc8f9ca3ed17fc1e1d30248ae3b58209fc53084ae0a4e')

prepare() {
	cd "${srcdir}/${_archive}"

	chmod 755 -R package.json
	sed -i -e 's@node script/bootstrap@node script/bootstrap --no-quiet@g' \
		./script/build

	sed -i -e "s/<%=Desc=%>/${pkgdesc}/g" \
		${srcdir}/${_pkgname}-${_version}.desktop
}

build() {
	# Fix : GYP does not support python3 but uses python, not python2
	export PYTHON=/usr/bin/python2
	cd "${srcdir}"
	mkdir -p pypath
	ln -fs /usr/bin/python2 ./pypath/python
	export PATH=$(pwd)/pypath:$PATH

	cd "${srcdir}/${_archive}"
	# Cleanup a non-clean srcdir
	rm -f ./apm/package-lock.json ./node_modules/github/node_modules.bak
	./script/build
}

package() {
	cd "${srcdir}/${_archive}"

	_ver=$(cat package.json | grep version | sed 's/version//g' | sed 's/://g' | sed 's/ //g' |  sed 's/"//g' | sed 's/,//g')

	[[ "${CARCH}" = "i686" ]] && _arch=i386 || _arch=amd64

	install -dm755 ${pkgdir}/usr/bin
	install -dm755 ${pkgdir}/usr/share/${_pkgname}-${_version}
	install -dm755 ${pkgdir}/usr/share/applications
	install -dm755 ${pkgdir}/usr/share/licenses/$pkgname
	install -dm755 ${pkgdir}/usr/share/pixmaps

	cp -r out/${_pkgname}-${_version}-${_ver}-${_arch}/*                    ${pkgdir}/usr/share/${_pkgname}-${_version}
	install -Dm644 ${srcdir}/${_pkgname}-${_version}.desktop                ${pkgdir}/usr/share/applications/${_pkgname}-${_version}.desktop
	mv ${pkgdir}/usr/share/${_pkgname}-${_version}/atom.png                 ${pkgdir}/usr/share/pixmaps/${_pkgname}-${_version}.png
	mv ${pkgdir}/usr/share/${_pkgname}-${_version}/LICENSE                  ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
	mv ${pkgdir}/usr/share/${_pkgname}-${_version}/resources/app/atom.sh    ${pkgdir}/usr/bin/atom-beta
	rm ${pkgdir}/usr/share/${_pkgname}-${_version}/resources/app.asar.unpacked/resources -rf
	ln -sf "/usr/share/${_pkgname}-${_version}/resources/app/apm/node_modules/.bin/apm" "${pkgdir}/usr/bin/apm-${_version}"

	find "${pkgdir}" \( \
		    -name "*.a" \
		-or -name "*.bat" \
		-or -name "benchmark" \
		-or -name "doc" \
		-or -name "html" \
		-or -name "man" \
		-or -path "*/less/gradle" \
		-or -path "*/task-lists/src" \
		\) -prune -exec rm -r '{}' \;

	find "${pkgdir}" \
		-name "package.json" \
		-exec sed -i -e "s|${srcdir}/atom-${_ver}/apm|/usr/share/${_pkgname}-${_version}/resources/app/apm|g" '{}' +
}
