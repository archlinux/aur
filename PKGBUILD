# Maintainer: xyzzy

pkgname=ryujinx-bin
pkgver=1.1.406
pkgrel=1
pkgdesc='Experimental Nintendo Switch Emulator written in C# (master build channel release)'
arch=(x86_64)
url='https://github.com/Ryujinx/release-channel-master'
license=('MIT')
depends=('dotnet-runtime')
provides=(Ryujinx)
conflicts=(Ryujinx)
options=('!strip')
source=(
	"${url}/releases/download/${pkgver}/ryujinx-${pkgver}-linux_x64.tar.gz"
	'https://raw.githubusercontent.com/Ryujinx/Ryujinx/master/distribution/linux/ryujinx.desktop'
	'https://raw.githubusercontent.com/Ryujinx/Ryujinx/master/distribution/linux/ryujinx-logo.svg'
	'https://raw.githubusercontent.com/Ryujinx/Ryujinx/master/distribution/linux/ryujinx-mime.xml'
)
sha512sums=(	
	'b22d09ad358c9a11b0ced8a681c90f85b97562aa3072204526dc3e151747d3663b1998a51f5748157c92b337ec23f3646564fda99d3b6c76c7861f16189a9aa5'
	'2d7b57eb966d686abb20dcb4fcd8e1e26ad4a8f83f42b650ff8b8c86c179efa53b62422aa4bc5825f0358cc6e247707bab61537742ef17e8868213a126dbf1d3'
	'8e2d6d29df63ced7439dcd7b05f4314c4e07e1d2b2298aedbaf2f0accb3c7acd543a6810c44d1301a049d43865447a82a61d459976bb483ed52ea51e34ee27c3'
	'438278d51df2c0219bcf58fce35176d8f904f53c2aa0bd01298c0d3c901c829964113cc4af192f13b26eff8b57728b5f16d6a300a92e072345a7c17684872559'
)

prepare() {
	# avoid crash due to stack smashing detection (https://github.com/Ryujinx/Ryujinx/issues/3183#issuecomment-1292808614)
	sed --in-place 's/Exec=Ryujinx/Exec=env COMPlus_EnableAlternateStackCheck=1 Ryujinx/' 'ryujinx.desktop'
}

package() {
	mkdir --parents "${pkgdir}/opt"
	cp --recursive "${srcdir}/publish" "${pkgdir}/opt/ryujinx"
	chmod +x "${pkgdir}/opt/ryujinx/Ryujinx"

	# create writable logs directory
	install --directory --mode=777 "${pkgdir}/opt/ryujinx/Logs"
	
	mkdir --parents "${pkgdir}/usr/bin"
	ln --symbolic "/opt/ryujinx/Ryujinx" "${pkgdir}/usr/bin/Ryujinx"
	
	install -D "${srcdir}/ryujinx.desktop" "${pkgdir}/usr/share/applications/ryujinx.desktop"
	install -D "${srcdir}/ryujinx-logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/ryujinx.svg"
	install -D "${srcdir}/ryujinx-mime.xml" "${pkgdir}/usr/share/mime/packages/ryujinx.xml"
}
