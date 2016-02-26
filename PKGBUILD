# Maintainer: wilga <wilga at cat3 dot de>
pkgname=bwsyncandshare
pkgver=10.4.321
pkgrel=1
pkgdesc="file sync and share client"
arch=('any')
url="https://bwsyncandshare.kit.edu"
license=('custom')

# the upstream package includes a bundled Oracle jre8 but we install it as a dependency instead
depends=('jre' 'gtk2')

# curl cannot use https since this server doesn't send intermediate CA certs so we must use http.
# no security issue since the sha256sum we check against was computed from a https-downloaded copy
_tarball="bwSyncAndShare_v${pkgver}_Linux.tar.gz"
source=("http://download.bwsyncandshare.kit.edu/clients/$_tarball"
        "$pkgname-$pkgver.patch")
noextract=("$_tarball")
sha256sums=('1a36c94563110dcfc4dc76dc2c3702e2e62ac605b59e343e12aff4a76059d8af'
            '3e0817014cf6b34e63a7ea02186190efdd392be08e5e07510a90622822c893cf')

prepare() {
        tar xvzf $_tarball --exclude="bwSyncAndShare/jre"   # remove bundled Oracle jre
	cd "bwSyncAndShare"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}


package() {
	cd "bwSyncAndShare"
        install -D -m 644 -t $pkgdir/usr/share/bwSyncAndShare/ bwSyncAndShare.jar 
        install -D -m 755 -t $pkgdir/usr/share/bwSyncAndShare/ bwSyncAndShare-Client.sh
        install -D -m 644 -t $pkgdir/usr/share/icons/hicolor/128x128/apps/ install-files/bwSyncAndShare.png 
        install -D -m 644 -t $pkgdir/usr/share/applications/ install-files/bwSyncAndShare.desktop 
        install -D -m 644 -t $pkgdir/usr/share/doc/bwSyncAndShare/ LICENSE README VERSION 
        install -D -m 644 -t $pkgdir/usr/share/licenses/$pkgname/ LICENSE
}
