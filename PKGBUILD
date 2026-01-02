# Maintainer: aksr <aksr at t-com dot me>
# Contributor: Åsmund Ervik <aaervik at gmail dot com>
# Prev. maintainer: Patrice Peterson <runiq at archlinux dot us>
# Inspiration: Michael Witten <mfwitten>
# (Original) Inspiration: Gustavo Dutra <mechamo@gustavodutra.com>
# Contributor: RunningDroid <rningdrd at tormail dot org>
# Contributor: Alessandro Pezzoni <alessandro dot pezzoni at runbox dot com>
#
# Package changed name from pentadactyl-hg to pentadactyl-git on 10. April 2015

pkgname='pentadactyl-git'
license=(MIT)
pkgver=r7307.3f48ca72
pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc='Vim-like five-fingered interface for Palemoon'
arch=(any)
url='https://github.com/pentadactyl/pentadactyl'
optdepends=('palemoon')
makedepends=('git' 'zip' 'unzip')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	#sed -i 's/maxVersion="[^"]*/maxVersion="47/' pentadactyl/install.rdf
	make -C pentadactyl xpi
}

package() {
	cd "$pkgname"
	local _version_pentadactyl="$(awk -F 'em:version="|"' '/em:version/ {print $2; exit}' $srcdir/$pkgname/pentadactyl/install.rdf)"
	local _extension_id="$(awk -F 'em:id="|"' '/em:id/ {print $2; exit}' $srcdir/$pkgname/pentadactyl/install.rdf)"
	local _path_xpi="$srcdir/$pkgname/downloads/pentadactyl-${_version_pentadactyl}.xpi"
	local _path_install="$pkgdir/usr/lib/palemoon/browser/extensions/$_extension_id"

	install -d "$_path_install"
	install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	unzip -od "$_path_install" "$_path_xpi"
}
