pkgname=mtgaprotracker
_pkgname=mtgap
pkgver=2.0.16
pkgrel=1
pkgdesc="Automatically uploads collection, decks, battles, draft and inventory from your Magic: The Gathering Arena client"

arch=('i686' 'x86_64')
license=('MIT')
depends=('electron')
makedepends=('yarn')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Razviar/mtgap/archive/v${pkgver}.tar.gz"
	"runmtgap.sh" 
	"${_pkgname}.desktop"
	"home.html.patch"
	"ipc_main.ts.patch"
	"main_window.ts.patch")
sha256sums=('e93e35cb6c5dc514339470a2a65d410e55ba9d282fc8b1dd87cc93645b478c6a' 
	    '66e0832a5d7cb8433c8ac49307854ce80954d35ada6bf2b8251a198f8e5639cb'
	    '145aa9f5ccb104f5b93cccbe5221755299abcdf02d4cd4d635e5038bfca63048'
	    'ff07b2ddf0391ac0e75b8e115e5a4953e32b39991d6022c2d2d310a9c3f61576'
	    'f8b5d6b87ee2e60518da29c1540d0ff444a64a0f1870bf4d65f2aab577336052'
	    '06bc1af01f8df685c1d6930f8882c668e25bf0f421659dd8021758824c976d19')

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

	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/statics/icon.ico" "${pkgdir}/usr/share/icons/${_pkgname}.ico"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm755 "${srcdir}/runmtgap.sh" "${pkgdir}/usr/bin/mtgap"
}

