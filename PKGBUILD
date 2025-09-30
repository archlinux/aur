# Maintainer: Arti Zirk <arti@zirk.me>
# Maintainer: ndom91
# Contributor: Drata
# Contributor: otaj

_pkgname="Drata Agent"
pkgname=drata-agent
pkgver=3.8.0
pkgrel=1
pkgdesc="The Drata Agent is a light-weight tray-application that runs in the background, reporting important read-only data to Drata about your machine’s state for compliance tracking."
arch=('x86_64')
url="https://github.com/drata/drata-agent"
license=("Apache-2.0")
depends=('electron')
optdepends=('libappindicator-gtk3: systray indicator')
makedepends=('asar')
options=('!strip' '!emptydirs')
source=("drata-agent")
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/drata/agent-releases/releases/download/${pkgver}/Drata-Agent-linux.deb")
sha512sums=('0f692de3645f30c9925a61e3a6044270f6ec662fb2ba654ed9902bd491b4ed7a54572b212bf4a3eee3f856c0ec1c28a59309a67652a1bb006c65c8ca70cd6bac')
sha512sums_x86_64=('505eeb647821783f76049eba7c57d8ed61e576dbe0b5dec400a05e5b92a0ad854725ec7df1c1d6b0fc8f7d2d35938dd5917f7dba6438e04b9ffc96bb8ee8fb2a')

prepare() {
	## Extract archive
	install -dm755 $pkgname-$pkgver
	tar -xJC $pkgname-$pkgver -f data.tar.xz

	pushd "$pkgname-$pkgver"

	## Use system electron via wrapper
	sed -i 's|^Exec=.*$|Exec=/usr/bin/drata-agent %U|' usr/share/applications/$pkgname.desktop

	# workaround for https://github.com/electron/electron/issues/31121
	asar extract opt/"$_pkgname"/resources/app.asar app
	sed -i "s#process\.resourcesPath#'/usr/lib/$pkgname'#g" app/dist/main.js
	asar pack app opt/"$_pkgname"/resources/app.asar

	popd
}


package() {
	cd "$srcdir"/$pkgname-$pkgver

	## Main electron app bundle
	install -D -m644 opt/"$_pkgname"/resources/app.asar "$pkgdir"/usr/lib/$pkgname/app.asar
	install -D -m755 "$srcdir"/drata-agent "$pkgdir"/usr/bin/drata-agent

	## Install included osquery binary
	install -D -m755 opt/"$_pkgname"/resources/lib/linux/bin/osqueryi "$pkgdir"/usr/lib/$pkgname/lib/linux/bin/osqueryi
	### TODO: Could we replace osqueryi binary with arch linux package?

	## Install additional stuff
	install -D -m644 usr/share/applications/$pkgname.desktop \
					"$pkgdir"/usr/share/applications/$pkgname.desktop

	## Install icons
	for size in 16 32 48 128 256 512 ; do
		install -D -m644 usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png \
						"$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png
	done
}
