# Maintainer: Jack L. Frost <fbt@fleshless.org>
# % Trigger: 1440171640 %

pkgname=libpstat-git
pkgver=r38.291e660
pkgrel=1
pkgdesc='Library for getting information about running processes'
url='https://github.com/jcnelson/libpstat'
arch=( 'x86_64' 'i686' )
license=( 'ISC' )
provides=( 'libpstat' )
conflicts=( 'libpstat' )

source=( "${pkgname}::git+https://github.com/jcnelson/libpstat.git" )
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
	make CFLAGS="-fPIC $CFLAGS"
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}" PREFIX='/usr' INCLUDE_PREFIX='/usr' install

	install -Dm644 LICENSE.ISC "$pkgdir/usr/share/licenses/$pkgname/LICENSE.ISC"
}

# vim: noet 
