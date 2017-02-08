# Contributor: Cyano Hao < c at cyano dot cn >

pkgname=hid-asus-dkms-git
pkgver=r80.36df3da
pkgrel=1
pkgdesc="ASUS HID DKMS Driver"
arch=('any')
url="http://www.asus.com/"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("git+https://github.com/vlasenko/hid-asus-dkms.git"
        "41-hid-asus.rules")
               
sha256sums=('SKIP'
            '3fbd48f7d2f58c7f9f27bcfb65c09b914d14a61924095f20a8eface0ef776e27')

_gitrepo=hid-asus-dkms
_dkmsname=hid-asus

pkgver() {
	cd "$srcdir/$_gitrepo"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitrepo"
	sed -i s/PACKAGE_NAME=\"asus\"/PACKAGE_NAME=\"$_dkmsname\"/ dkms.conf
	sed -i s/PACKAGE_VERSION=1.0/PACKAGE_VERSION="$pkgver"/ dkms.conf
}

package() {
	installDir="$pkgdir/usr/src/$_dkmsname-$pkgver"

	install -dm755 "$installDir"
	install -m644 "$srcdir/$_gitrepo/dkms.conf" "$installDir"
	install -dm755 "$pkgdir/etc/udev/rules.d"
	install -m644 "$srcdir/41-hid-asus.rules" "$pkgdir/etc/udev/rules.d/41-hid-asus.rules"

	install -dm755  "$installDir/src"
	
	cd "$srcdir/$_gitrepo"
	for file in src/* ; do
		install -m644 "$srcdir/$_gitrepo/$file" "$installDir/$file"
	done
}
