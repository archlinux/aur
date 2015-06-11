# Maintainer: Jack Frost <fbt@fleshless.org>
# % Trigger: 1433749545 %

pkgname='watchman-sm-services-git'
pkgdesc='Service scripts for watchman'
license=( 'BSD' )
pkgver=r136.6d33ef6
pkgrel=1
arch=( 'any' )
url='https://github.com/fbt/watchman-services'

provides=( 'watchman-sm-services' )
conflicts=( 'watchman-sm-services' )

source=( "${pkgname}::git+https://git.fleshless.org/watchman-services" )
md5sums=( 'SKIP' )

pkgver() {
	cd "$srcdir/$pkgname"

	if git_version=$( git describe --long --tags 2>/dev/null ); then
		IFS='-' read last_tag tag_rev commit <<< "$git_version"
		printf '%s.r%s.%s' "$last_tag" "$tag_rev" "$commit"
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

package() {
	cd "${srcdir}/${pkgname}"

	mkdir -pm755 "$pkgdir/etc/watchman/init.d"
	cp -a init.d/* "$pkgdir/etc/watchman/init.d/"

	mkdir -pm755 "$pkgdir/etc/watchman/conf.d"
	cp -a conf.d/* "$pkgdir/etc/watchman/conf.d/"

	cd "${pkgdir}"
	backup+=( etc/watchman/init.d/* )
	backup+=( etc/watchman/conf.d/* )
}
