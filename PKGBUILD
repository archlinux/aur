# Maintainer: wilga <wilga at cat3 dot de>
pkgname=bwsyncandshare
pkgver=10.6.468
pkgrel=1
pkgdesc="file sync and share client"
arch=('any')
url="https://bwsyncandshare.kit.edu"
license=('custom')

# the upstream package includes a bundled Oracle jre8 but we install it as a dependency instead
# NOTE: current version seems to require oracle jre and does NOT run with openjdk
depends=('jre' 'gtk2')

# need to download "Latest" version since no version-numbered tarball exists
# this will break when a new version is published
_tarball="bwSyncAndShare_Latest_Linux.tar.gz"
source=("https://download.bwsyncandshare.kit.edu/clients/$_tarball"
        "$pkgname-$pkgver.patch")
noextract=("$_tarball")

sha256sums=('d265fd031f2e131632faba1b0713882b672c22299e5005ee690e1788353d68af'
            'ebe8be90d0364090744b80609cdc5a71e360fc7f3e3188b2a534c7c4921e6c50')


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
