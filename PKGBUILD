# Maintainer: Viech <viech unvanquished net>

pkgname=unvanquished-data
pkgver=0.41.0
pkgrel=1

_gitver="archlinux/${pkgver}-${pkgrel}"

pkgdesc='Game assets for Unvanquished.'
arch=('any')
url='http://www.unvanquished.net'
license=('GPL3')

makedepends=('aria2>=1.18.7-2' 'sed') # XXX dependency on sed for workaround below
source=("https://github.com/Unvanquished/Unvanquished/raw/${_gitver}/download-pk3-torrent.sh")

# disable package compression since assets are already compressed
PKGEXT='.pkg.tar'

build() {
	cd "${srcdir}"

	chmod +x download-pk3-torrent.sh
}

package() {
	# create installation directory
	install -dm755 "${pkgdir}/usr/share/unvanquished/pkg/"

	# use package source directory as the cache for the download script
	if [ ! -d "${srcdir}/cache" ]; then
		mkdir "${srcdir}/cache"
	fi

	# attempt to copy existing assets from the system, so they aren't redownloaded
	if [ -d /usr/share/unvanquished/pkg ]; then
		echo "Copying existing assets from the system..."
		cp -r /usr/share/unvanquished/pkg/*.pk3 "${pkgdir}/usr/share/unvanquished/pkg/" || true
	fi

	# make the download script aware of copied assets, so it will remove unneeded ones
	ls -c1 "${pkgdir}/usr/share/unvanquished/pkg/" > "${srcdir}/cache/last-assets.txt"

	# remove old aria2 progress files in case the torrent itself was updated
	rm -f "${srcdir}/cache/"*".aria2"

	# XXX work around a bug in aria2/GnuTLS https handling by using http for now
	sed -i 's,https,http,' download-pk3-torrent.sh

	# download new or modified assets
	./download-pk3-torrent.sh "${pkgdir}/usr/share/unvanquished/pkg/" "${srcdir}/cache" "${pkgver}"
}

md5sums=('bb2d205411ab0b05e755abe06e8d38b3')
