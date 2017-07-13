# Maintainer: Jack Frost <fbt@fleshless.org>
# % Trigger: 1483567654 %

pkgname='ssm-services-git'
pkgdesc='Service scripts for ssm'
license=( 'BSD' )
pkgver=1.2.r59.gd259153
pkgrel=1
arch=( 'any' )
url='https://git.fleshless.org/ssm-services/about'

provides=( 'ssm-services' )
conflicts=( 'ssm-services' )

source=( "${pkgname}::git+https://git.fleshless.org/ssm-services" )
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

	mkdir -pm755 "$pkgdir/etc/ssm/init.d"
	cp -a init.d/* "$pkgdir/etc/ssm/init.d/"

	mkdir -pm755 "$pkgdir/etc/ssm/conf.d"
	cp -a conf.d/* "$pkgdir/etc/ssm/conf.d/"

	cd "${pkgdir}"
	backup+=( etc/ssm/init.d/* )
	backup+=( etc/ssm/conf.d/* )
}
