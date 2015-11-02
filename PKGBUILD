# vim: ft=PKGBUILD
# Maintainer: Jack L. Frost <fbt@fleshless.org>
# Contributor: Eric Vidal <eric@obarun.org>
# % Trigger: 1441370137 %

pkgname=('vdev-git' 'vdevfs-git' 'vdev-libudev-compat-git')
pkgver=r683.9f910cf
pkgrel=8
pkgdesc='A virtual device manager for *nix'
url='https://github.com/jcnelson/vdev.git'
arch=( 'x86_64' 'i686' )
license=( 'custom:ISC' )
makedepends=( 'libpstat' 'fskit' 'squashfs-tools' 'dash' )

source=(
	"${pkgname}::git+${url}"
	vdev_install
	vdev_hook
)

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
	depends=( 'util-linux' 'kmod' 'iproute2' 'sed' 'grep' 'makedev' 'dash' )
	optdepends=( 'lvm2' 'device-mapper' )
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
		RUNDIR='/run' \
		LOGDIR='/var/log' \
	install

	# hwdb
	make DESTDIR="${pkgdir}" PREFIX=/usr -C hwdb install

	# mkinitcpio hook
	install -Dm644 "$srcdir/vdev_hook" "$pkgdir/usr/lib/initcpio/hooks/vdev"
	install -Dm644 "$srcdir/vdev_install" "$pkgdir/usr/lib/initcpio/install/vdev"

	# Install the license
	install -Dm644 "$srcdir/$pkgbase/LICENSE.ISC" "$pkgdir/usr/share/licenses/$pkgname"

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

	# Install the license
	install -Dm644 "$srcdir/$pkgbase/LICENSE.ISC" "$pkgdir/usr/share/licenses/$pkgname"
}

package_vdev-libudev-compat-git() {
	provides=( "libudev" 'libudev.so' )
	conflicts=( "libudev" 'libudev.so'	)

	cd vdev-git
	make -C libudev-compat \
		DESTDIR="$pkgdir" \
		PREFIX=/usr \
	install

	# Missing solink
	ln -s /lib/libudev.so.1 "$pkgdir/usr/lib/libudev.so"

	# Install the license
	install -Dm644 "$srcdir/$pkgbase/LICENSE.ISC" "$pkgdir/usr/share/licenses/$pkgname"
}

sha1sums=('SKIP'
          '91445e5acb0749a689c6da940f867613a8db1396'
          '2bbd2b40a9cd87f3a74fdb51565cbab63b0fc887')
