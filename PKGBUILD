# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='profile-sync-daemon-git'
_pkgname='profile-sync-daemon'
pkgver=r648.18955ef
pkgrel=1
pkgdesc='Syncs browser profiles to tmpfs reducing SSD/HDD calls and speeding-up browsers.'
arch=('any')
url='https://github.com/graysky2/profile-sync-daemon'
license=('MIT')
depends=('procps-ng' 'rsync' 'systemd' 'findutils')
makedepends=('git')
conflicts=('firefox-sync' 'goanysync' 'go-anysync-git' 'iceweasel-sync'
'tmpfs-store' 'tmpfs-sync' 'user-profile-sync-daemon' 'profile-sync-daemon')
provides=('profile-sync-daemon')
_branch='master'
#_branch='unstable'
source=("git://github.com/graysky2/profile-sync-daemon#branch=$_branch")
install=psd.install
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	# set version of psd to match pkgver
	sed -i "s/@VERSION@/$pkgver/" "$srcdir/$_pkgname/common/profile-sync-daemon.in"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
