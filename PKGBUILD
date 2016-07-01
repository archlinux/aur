# Maintainer: White-Oak <lpzhelud@gmail.com>
pkgname=servo-latest
pkgver=r20160701
pkgrel=1
pkgdesc="A modern, high-performance browser engine being developed for application and embedded use"
arch=('x86_64')
url="https://servo-builds.s3.amazonaws.com/index.html"
license=('unknown')
provides=('servo')
conflicts=('servo')
makedepends=('gendesk')
md5sums=('SKIP')
source=("https://servo-builds.s3.amazonaws.com/nightly/linux/servo-latest.tar.gz")

prepare(){
	gendesk -f --pkgname "Servo" --pkgdesc "$pkgdesc" --exec '/opt/servo/servo -w -b --pref dom.mozbrowser.enabled --pref dom.forcetouch.enabled --pref shell.builtin-key-shortcuts.enabled=false /opt/servo/build/browserhtml-3e3805f69808f24d/out/index.html'
}

pkgver(){
	time=$(curl -s -v -X HEAD "https://servo-builds.s3.amazonaws.com/nightly/linux/servo-latest.tar.gz" 2>&1\
	 | grep '^< Last-Modified:'\
	 | sed -n -e 's/^< Last-Modified: //p')
	date --date="$time" +r%Y%m%d
}

package() {
	install -Dm644 "Servo.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -d "$pkgdir/opt/servo"
	cp -r "servo" "$pkgdir/opt"
}
