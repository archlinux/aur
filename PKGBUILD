# vim: ft=PKGBUILD
# Maintainer: Jack L. Frost <fbt@fleshless.org>
# % Trigger: 1433748792 %

pkgname=('vdev-git' 'vdev-libudev-compat-git')
pkgver=r479.33c6877
pkgrel=1
pkgdesc='A virtual device manager for *nix'
url='https://github.com/jcnelson/vdev.git'
arch=( 'x86_64' 'i686' )
license=( 'custom:ISC' )
conflicts=( 'vdev' )
provides=( 'vdev' )
makedepends=( 'libpstat' 'fskit' )
backup=( etc/vdev )

source=( "${pkgname}::git+${url}" )
sha1sums=( 'SKIP' )

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
	make PREFIX=/usr
	make -C libudev-compat
}

package_vdev-git() {
	depends=( 'libpstat' 'fskit' 'util-linux' 'kmod' 'iproute2' 'sed' 'grep' 'device-mapper' 'lvm2' 'fuse' 'dash' )

	cd "$pkgname"
	make PREFIX='/usr' \
	     DESTDIR="${pkgdir}" \
	     SBINDIR="${pkgdir}/usr/bin" \
	     USRSBINDIR="${pkgdir}/usr/bin" \
	install

	cd "$pkgdir"

	# There is no way to tell the Makefile not to install these.
	rm etc/init.d/vdev
	rmdir etc/init.d

	# Config files
	backup+=( etc/vdev/actions/* )
	backup+=( etc/vdev/* )
}

package_vdev-libudev-compat-git() {
	provides=( "libudev=${_udevver}" 'libgudev-1.0.so' 'libudev.so' )
	conflicts=( "libudev=${_udevver}" 'libgudev-1.0.so'  'libudev.so'	)

	cd vdev-git
	make LIBDIR="${pkgdir}/usr/lib" INCLUDEDIR="${pkgdir}/usr/include" -C libudev-compat install
}

# vim: noet 
