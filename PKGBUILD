# vim: ft=PKGBUILD
# Maintainer: Jack L. Frost <fbt@fleshless.org>
# % Trigger: 1441370137 %

pkgname=('vdev-git' 'vdevfs-git' 'vdev-libudev-compat-git')
pkgver=r672.7eab644
pkgrel=1
pkgdesc='A virtual device manager for *nix'
url='https://github.com/jcnelson/vdev.git'
arch=( 'x86_64' 'i686' )
license=( 'custom:ISC' )
makedepends=( 'libpstat' 'fskit' 'squashfs-tools' 'dash' )

source=( "${pkgname}::git+${url}" )

pkgver() {
	cd "${pkgname}"

	if git_version=$( git describe --long --tags 2>/dev/null ); then
		IFS='-' read last_tag tag_rev commit <<< "$git_version"
		printf '%s.r%s.%s' "$last_tag" "$tag_rev" "$commit"
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd "${pkgname}"
	
	make PREFIX=/usr -C vdevd
	make PREFIX=/usr -C hwdb
	make PREFIX=/usr -C fs

	make PREFIX=/usr -C libudev-compat
}

package_vdev-git() {
	depends=( 'util-linux' 'kmod' 'iproute2' 'sed' 'grep' 'device-mapper' 'lvm2' 'dash' )
	provides=( 'vdev' 'udev' )
	conflicts=( 'vdev' )

	cd "$pkgname"

	# vdevd
	make -C vdevd \
		DESTDIR="$pkgdir" \
		PREFIX='/usr' \
		ETCDIR='/etc' \
		BINDIR='/usr/bin' \
		SBINDIR='/usr/bin' \
	install

	# config
	make -C example \
		DESTDIR="$pkgdir" \
		PREFIX='/usr' \
		ETCDIR='/etc' \
	install

	# hwdb
	make DESTDIR="${pkgdir}" PREFIX=/usr -C hwdb install

	# Config files
	cd "$pkgdir"
	backup+=( etc/vdev/actions/*.act )
	backup+=( etc/vdev/*.conf )
}

package_vdevfs-git() {
	depends=( 'libpstat' 'fskit' 'fuse' 'libstdc++5' )
	provides=( 'vdevfs' )
	conflicts=( 'vdevfs' )

	cd vdev-git
	make -C fs \
		DESTDIR="$pkgdir" \
		PREFIX='/usr' \
		SBINDIR='/usr/bin' \
	install
}

package_vdev-libudev-compat-git() {
	provides=( "libudev" 'libudev.so' )
	conflicts=( "libudev" 'libudev.so'	)

	cd vdev-git
	make -C libudev-compat \
		DESTDIR="$pkgdir" \
		PREFIX=/usr \
	install
}

sha1sums=( 'SKIP' )
