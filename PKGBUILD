# Maintainer: VCalV
_pkgname=gourou
pkgname="${_pkgname}-appimage"
pkgver=0.8.7
__appimagename="libgourou_utils-${pkgver}-x86_64.AppImage"
pkgrel=4
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files (no dependencies)"
arch=('x86_64')
license=('LGPL-3.0-only')
url="https://forge.soutade.fr/soutade/libgourou"
depends=('zlib' 'fuse2')
makedepends=()
conflicts=(gourou-git gourou gourou-bin)
provides=("gourou=${pkgver}")
options=(!strip)
source=(
	"https://soutade.fr/files/${__appimagename}.tar.gz"
)
sha512sums=(
        227de9e18ddf5da660712872b9765cbe52f96e09dfe6537069633cf70f24822e6c960b26b89c3fc61230cae38b3a6c30cbc82daa2df8b8fe966b1818f9ee58e3
)

prepare() {
	cd "$srcdir"
	chmod +x "$__appimagename/$__appimagename"
	./"$__appimagename/$__appimagename" --appimage-extract utils >/dev/null
}

package() {
	install -d "$pkgdir"/{usr/bin/,usr/share/man/man1/}

	cd "$srcdir"
	__appimages="${pkgdir}/opt/${_pkgname}/"
	__squashfs="${srcdir}/squashfs-root/utils/"

	install -d "${__appimages}"

	# start by installing the actual image
	cp -a --no-preserve=ownership "$__appimagename/$__appimagename" "${__appimages}"

	# install man pages
	cp --no-preserve=ownership "${__squashfs}"/man/* "$pkgdir"/usr/share/man/man1/
	gzip -9 "$pkgdir"/usr/share/man/man1/*

	# create symlinks for executables
	for cmd in acsmdownloader adept_activate adept_remove adept_loan_mgt; do
		ln -s "/opt/${_pkgname}/${__appimagename}" "${pkgdir}/usr/bin/${cmd}"
	done

	install -Dm444 "${__squashfs}"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
