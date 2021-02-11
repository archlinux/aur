# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Westofer Raymond <westoferraymond@gmail.com>
pkgname=athens-git
_pkgname=athens
pkgver=v1.0.0.beta.37.r7.ga0b98d4c0
pkgrel=1
pkgdesc="Athens is an open-source and local-first alternative to Roam Research. Athens lets you take notes... Master branch "
arch=('x86_64')
url="https://github.com/athensresearch/athens"
license=('Eclipse Public License - v 1.0') #TODO
groups=()
depends=()
makedepends=("git" "leiningen" "yarn" "jq")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
#replaces=()
#backup=()
#options=()
install=
source=('athens::git+https://github.com/athensresearch/athens')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${_pkgname}"

	# electron builder enforces email and homepage!
jq '.author|={"name":"athensresearch" , "email":"athensresearch@gmail.com"}' package.json  > tmp.json && mv tmp.json package.json
jq '.homepage="https://github.com/athensresearch/athens"' package.json > tmp.json && mv tmp.json package.json
echo '[Desktop Entry]
 Name=athens
 Exec=/opt/athens/athens %U
 Terminal=false
 Type=Application
 Icon=athens
 StartupWMClass=athens
 Comment=Open-Source Networked Thought
 Categories=Utility;' > "${srcdir}/${_pkgname}/athens.desktop"
}

build() {
	cd "$srcdir/${_pkgname}"
	yarn --cache-folder "${srcdir}/yarn-cache"
	lein compile
	yarn --cache-folder "${srcdir}/yarn-cache" electron-builder  --linux dir
}

#check() {
	#cd "$srcdir/${_pkgname}"
	#make -k check
#}

package() {
	cd "$srcdir/${_pkgname}"
	# idk, guess it is uselss
	mkdir -p "${pkgdir}/opt/${_pkgname}"

	cp -R ./dist/linux-unpacked/* "${pkgdir}/opt/${_pkgname}"

	# Executable:
	mkdir -p "${pkgdir}/usr/bin"
	echo ln -s "/opt/${_pkgname}/athens" "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "/opt/${_pkgname}/athens" "${pkgdir}/usr/bin/${_pkgname}"

	# License:
	mkdir -p "${pkgdir}/usr/share/licenses/athens"
	install -D -m755 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/athens/LICENSE"

	# icon
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
	install -D -m755 "${srcdir}/${_pkgname}/build/icon.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/athens.png"

	#desktop file
	mkdir -p "${pkgdir}/usr/share/applications"
	install -D -m755 "${srcdir}/${_pkgname}/athens.desktop" "${pkgdir}/usr/share/applications/athens.desktop"


#	make DESTDIR="$pkgdir/" install
}

