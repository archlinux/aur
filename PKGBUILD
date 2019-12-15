# Maintainer: Connor Reeder <connor.reeder@ymail.com>

pkgname=aio-remote
pkgrel=2
pkgver=3.5.0
pkgdesc="All In One remote to control any application using an android app."
arch=("any")
url="https://aioremote.net"
license=('unknown')
depends=("java-runtime=8")
makedepends=("wget")
optdepends=('bluez: for bluetooth support')
source=("$pkgname.desktop" "$pkgname.png" "$pkgname")
noextract=()
md5sums=('fcebc46b9245b7a40cff4b58e66635f7'
         '84d303db6c7a90e2d2e46371e4fcef8f'
         '3e67e3b48e5e9a77a49dc8d1576e3392')

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
	echo "exec /usr/bin/java -jar /usr/share/java/${pkgname}/${jar_file}" >> ${srcdir}/aio-remote
}
pkgver() {
	cat version.txt
}

package() {
	local jar_file=$(cat jar_file.txt)
	install -Dm644 ${jar_file} "$pkgdir/usr/share/java/$pkgname/${jar_file}"
	install -Dm644 "config.ini" "$pkgdir/usr/share/doc/$pkgname/config.ini.example"
	install -Dm644 "${pkgname}.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
	install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
	install -Dm644 ${pkgname}.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
