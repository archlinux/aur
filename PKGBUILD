# Maintainer: Connor Reeder <connor.reeder@ymail.com>

pkgname=aio-remote
pkgrel=1
pkgver=3.5.0
pkgdesc="All In One remote to control any application using an android app."
arch=("any")
url="https://aioremote.net"
license=('unknown')
depends=("java-environment" "bash")
optdepends=('bluez: for bluetooth support')
source=("$pkgname.desktop" "$pkgname.png")
noextract=()
md5sums=('de3ff5e5931c17a46a0719d773a58afe'
         '2b70bbd76e20a9181470a7f415f2c9cf')

prepare() {
	echo "Determining latest version..."
	latest_url=$(curl -i bit.ly/aio_remote_desktop_linux | tr -d '\r' | grep '^Location:' | sed 's/^Location:\s//')
	local bundle_file=$(echo $latest_url | sed 's/^.*\///')
	wget -P ${srcdir} ${latest_url}
	unzip "${srcdir}/${bundle_file}"
	rm -rf "${srcdir}/__MACOSX"
	local jar_file=${bundle_file/_linux.zip/.jar}
	find . -name "${jar_file}" -exec mv {} . \;
	find . -name "config.ini" -exec mv {} . \;
	echo $latest_url | sed 's/_linux.zip$//' | sed 's/^.*AioRemoteDesktop//' > version.txt
	echo ${jar_file} > jar_file.txt
	echo '#!/bin/bash' >> aio-remote
	echo "cd /usr/share/${pkgname}" >> aio-remote
	echo "java -jar ${jar_file}" >> aio-remote
}
pkgver() {
	cat version.txt
}

package() {
	local jar_file=$(cat jar_file.txt)
	install -Dm644 ${jar_file} "$pkgdir/usr/share/$pkgname/${jar_file}"
	install -Dm644 "config.ini" "$pkgdir/usr/share/$pkgname/config.ini"
	install -Dm644 "${pkgname}.png" "$pkgdir/usr/share/${pkgname}/${pkgname}.png"
	install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
	install -Dm644 ${pkgname}.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
