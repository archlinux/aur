_npmname_base=gamemusic
_npmname=${_npmname_base}-cli
_npmscope=@camoto
pkgname=${_npmname} # All lowercase
pkgver=latest
pkgrel=1
pkgdesc="Import, export and convert music files used by DOS games"
arch=(any)
url="http://github.com/Malvineous/${_npmname_base}js"
license=()
depends=('nodejs' )
makedepends=('npm')
optdepends=()

pkgver() {
	# Grab the latest version from npmjs.org
	#npm view "${_npmscope}/${_npmname}@latest" version
	# ...but as a dodgy hack use the version of the parent package instead.  This
	# way when the base library gets updated this package version number will
	# change to match, even though technically the package we're installing
	# hasn't been updated, only one of its dependencies has.
	npm view "${_npmscope}/${_npmname_base}@latest" version
}

package() {
	#npm install -g --user root --prefix "${pkgdir}/usr" "${_npmscope}/${_npmname}@${pkgver}"
	# We should be installing ${pkgver} but since that is now the parent library
	# version, it won't match the -cli package version.  So we just use 'latest'
	# to get whatever CLI version is there.  It will always install the latest
	# version of the underlying library because of the '*' spec in package.json
	# so it should always match the $pkgver.
	npm install -g --user root --prefer-online --prefix "${pkgdir}/usr" "${_npmscope}/${_npmname}@latest"

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/cli/issues/1103 for details.
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}"

	# Remove references to srcdir/pkgdir
	find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}
