# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: David Roheim < david dot roheim at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail >

# Set to 1 to enable usermode support
_with_usermode=0

pkgname=mock
pkgver=1.2.20
pkgrel=1
pkgdesc="A simple chroot build environment manager for building RPMs"
url="https://github.com/rpm-software-management/$pkgname"
arch=('any')
license=('GPL2')
depends=('python')
((_with_usermode)) && depends+=('usermode')
makedepends=('bash-completion')
optdepends=('createrepo_c: for mockchain command'
            'dnf-plugins-core: to create RPMs for Fedora >= 24 and for Mageia'
            'lvm2: for lvm_root plugin'
            'pigz: for parallel compression of chroot cache'
            'yum-utils: to create RPMs for Fedora <= 23 (including EL5, EL6 and EL7)')
install="$pkgname.install"
backup=("etc/$pkgname/site-defaults.cfg")
source=("$url/archive/$pkgname-$pkgver.tar.gz")
md5sums=('e4d5b7424fd9c14fbe3b150367357a86')

prepare() {
	mv "$pkgname-$pkgname-$pkgver" "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr      \
	            --sysconfdir=/etc  \
	            --libdir=/usr/lib  \
	            --sbindir=/usr/bin

	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	if ((_with_usermode)); then
		mv "$pkgdir/usr/bin/$pkgname"{,.py}
		sed -e "s|/usr/sbin/$pkgname|/usr/bin/$pkgname.py|" \
		    -i "$pkgdir/etc/security/console.apps/$pkgname"
		ln -s /usr/bin/consolehelper "$pkgdir/usr/bin/$pkgname"
	fi
}

# vim: set ft=sh ts=4 sw=4 noet:
