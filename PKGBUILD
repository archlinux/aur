# Maintainer: xyzzy

pkgname=ryujinx-bin
pkgver=1.1.468
pkgrel=1
pkgdesc='Experimental Nintendo Switch Emulator written in C# (master build channel release)'
arch=(x86_64)
url='https://github.com/Ryujinx/release-channel-master'
license=('MIT')
depends=('dotnet-runtime')
provides=(Ryujinx)
conflicts=(Ryujinx)
options=('!strip')
source=("${url}/releases/download/${pkgver}/ryujinx-${pkgver}-linux_x64.tar.gz"
        'https://raw.githubusercontent.com/Ryujinx/Ryujinx/master/distribution/linux/ryujinx.desktop'
        'https://raw.githubusercontent.com/Ryujinx/Ryujinx/master/distribution/linux/ryujinx-logo.svg'
        'https://raw.githubusercontent.com/Ryujinx/Ryujinx/master/distribution/linux/ryujinx-mime.xml')

b2sums=('927c0ad57119def3f1600ad23ea08454255e6c85339357a0369464fb0b19fad2e5f206fae5d322649bbbb6c37d6f64ce18fee3fbd52f59781a8c474032056036'
        '56f1f5ce656d9b9c14ec79effe4c6498ddf26c325770d8463a1b0819fce00e6bbb005b8625c616c48d03551265fb6ce3ee94be79c187fcddcf9aeed99cffcbd5'
        'f96fe6146018fd869c55e413b2cc6cf12f17c5257af52df14f57978133792c7fb76e8526b15a5120dbf12a9fed7b8e4723a3ff9f2e45b613b10ee1017ba0b996'
        '8ad90ddda6b76e6661cd0c9c38f19906aa09b6f4ff1f9b21f739b490590001068bee4f3f985f41e67fd2092f6b361bb8a422702b4820915d2eec6233341d99b3')

prepare() {
	# avoid crash due to stack smashing detection (https://github.com/Ryujinx/Ryujinx/issues/3183#issuecomment-1292808614)
	sed --in-place 's/Exec=Ryujinx/Exec=env COMPlus_EnableAlternateStackCheck=1 Ryujinx/' "${srcdir}/ryujinx.desktop"
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
