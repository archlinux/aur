pkgname=mtgaprotracker
_pkgname=mtgap
pkgver=2.0.47
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
sha256sums=('aa0fd34dbb763c621b7e8dbf1353c43bcfbfda887b7f0d9b671f7e0fe231cdf3' 
	    '93dfa25b7da8394dce436a67b600bc06bb7576daa62bdabe6e48f2bf8c9e1436'
	    '145aa9f5ccb104f5b93cccbe5221755299abcdf02d4cd4d635e5038bfca63048'
	    '5edc0ef1c18ee3f92487024460a60193834bb2fdd23b1f7b03d0acdd460f41a3'
	    '744f7e4ffc03307a1c994acb2de079cecd4085e0ed540365406a4115c0d507db'
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

