pkgname=mtgaprotracker
_pkgname=mtgap
pkgver=2.0.49
pkgrel=1
pkgdesc="Automatically uploads collection, decks, battles, draft and inventory from your Magic: The Gathering Arena client"

arch=('i686' 'x86_64')
license=('MIT')
depends=('electron')
makedepends=('yarn' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Razviar/mtgap/archive/v${pkgver}.tar.gz"
	"runmtgap.sh" 
	"${_pkgname}.desktop"
	"home.html.patch"
	"ipc_main.ts.patch"
	"main_window.ts.patch")
sha256sums=('504b7dd11ed0af23c397cad454bf0c80988ea748ef067889ac7c633f70dfbd3d' 
	    '93dfa25b7da8394dce436a67b600bc06bb7576daa62bdabe6e48f2bf8c9e1436'
	    '145aa9f5ccb104f5b93cccbe5221755299abcdf02d4cd4d635e5038bfca63048'
	    '5edc0ef1c18ee3f92487024460a60193834bb2fdd23b1f7b03d0acdd460f41a3'
	    '5aa2cb1d6d6fda1cb8be156f7a1e7419c5f14b7693a30d069201558689787e2c'
	    '424fc6ae2b2c824744c25e02f58ac0ec6f63f43c168e022dccd75d8974eb7643')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Set system Electron version for ABI compatibility
  sed -r 's#("electron": ").*"#\1'$(cat /usr/lib/electron/version)'"#' -i package.json

  # Allow higher Node versions
  sed 's#"node": "#&>=#' -i package.json
  yarn install
  yarn add @electron-forge/cli
  yarn add @electron-forge/plugin-webpack
  patch -u src/windows/home/home.html < "${srcdir}/home.html.patch"
  patch -u src/app/ipc_main.ts < "${srcdir}/ipc_main.ts.patch"
  patch -u src/app/main_window.ts < "${srcdir}/main_window.ts.patch"
  

}

build(){
	cd "${srcdir}/${_pkgname}-${pkgver}"
	yarn run package 
}

package(){
	cd "${srcdir}/${_pkgname}-${pkgver}/out"

	case "$CARCH" in
	'x86_64')
		_dir_arch='x64'
		;;
	'i686')
		_dir_arch='i386'
		;;
	*)
		_dir_arch=$CARCH
		;;
	esac
	mkdir -p "${pkgdir}/opt/"
	cp -a "${pkgname}-linux-${_dir_arch}" "${pkgdir}/opt/"

	#Dirty Workaround for logging. Should likely go somewhere else.
	mkdir -p "${pkgdir}/opt/${pkgname}-linux-${_dir_arch}/undefined/MTGAproTracker"
	chgrp users -R "${pkgdir}/opt/${pkgname}-linux-${_dir_arch}/undefined"
	chmod 775 -R "${pkgdir}/opt/${pkgname}-linux-${_dir_arch}/undefined"

	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/statics/icon.ico" "${pkgdir}/usr/share/icons/${_pkgname}.ico"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm755 "${srcdir}/runmtgap.sh" "${pkgdir}/usr/bin/mtgap"
}

