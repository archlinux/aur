pkgname=mtgaprotracker
_pkgname=mtgap
pkgver=2.0.19
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
sha256sums=('836b9e4bc9a69f3edd849f2be7d3dcfb7577d8f255ccd9e60fc711e830f6e76d' 
	    '93dfa25b7da8394dce436a67b600bc06bb7576daa62bdabe6e48f2bf8c9e1436'
	    '145aa9f5ccb104f5b93cccbe5221755299abcdf02d4cd4d635e5038bfca63048'
	    '08b70f663e27c042df8a42d177f1f253211ae11301bca5a977bf8ff56f13fe54'
	    '80986b6981fabefab626287e3410c81979bee8dd7e131c34e1f7f5073bc1bd8b'
	    '37ccf4d92edbb95a8d54967e157ae845e099ad822a70e9e551041d81027871f0')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Set system Electron version for ABI compatibility
  sed -r 's#("electron": ").*"#\1'$(cat /usr/lib/electron/version)'"#' -i package.json

  # Allow higher Node versions
  sed 's#"node": "#&>=#' -i package.json
  yarn install
  yarn add @electron-forge/cli
  yarn add @electron-forge/plugin-webpack
  

}

build(){
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -u src/windows/home/home.html < "${srcdir}/home.html.patch"
	patch -u src/app/ipc_main.ts < "${srcdir}/ipc_main.ts.patch"
	patch -u src/app/main_window.ts < "${srcdir}/main_window.ts.patch"
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

