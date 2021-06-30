# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
pkgname=dict-devils
pkgver=1
_deb_srcver=1.0
_debver=${_deb_srcver}-13.1
pkgrel=2
pkgdesc="The Devil's Dictionary by Ambrose Bierce for dictd et al."
arch=('any')
url="https://packages.debian.org/sid/dict-devil"
license=('custom: Public Domain')
optdepends=('dictd: dict client and server')
makedepends=('dictd')
conflicts=('dictd-devils')
install=${pkgname}.install

# Alternative archive of original source:
#  - https://web.archive.org/web/20170402162112id_/http://wiretap.area.com/Gopher/Library/Classic/devils.txt
#  - The "orig" tarball below contains nothing but this file (in a directory).
source=("https://deb.debian.org/debian/pool/main/d/dict-devil/dict-devil_${_deb_srcver}.orig.tar.gz"
        "https://deb.debian.org/debian/pool/main/d/dict-devil/dict-devil_${_debver}.debian.tar.xz")
sha512sums=('7dad3ab008ba976a0af58377bd206f2870617866b854b8a2cf588f6eefcaaab4a261e9f511b094410c9e454b7ee94b83ec1351774728b171f0e6cdbefa903fd1'
            '0f8c59bf145a0c737e14e156e949382aae79c42eab6ac8721a5d4a282a79ec0de35841a53487b58b3c86e4f153a0366de67f39df6bea1c6217734013b04ebb5e')


prepare()
{
	cd "dict-devil-${_deb_srcver}"

	# Extract licensing statement.
	grep -m1 -B1 'Public Domain' devils.txt > LICENSE

	# Fix various typographical errors.
	patch -p1 devils.txt ../debian/patches/debian-changes
}


# Note: Building is reproducible.
#  - devil2dict calls dictfmt with the `--without-time' flag.
#  - dictzip's input is touched to be from epoch.
#    - The Debian package instead uses the `--no-name' flag, which is custom to
#      Debian's dictzip.
build()
{
	cd "dict-devil-${_deb_srcver}"

	../debian/devil2dict devils.txt devils

	touch --date='@0' devils.dict
	dictzip devils.dict
}


package() {
	cd "dict-devil-${_deb_srcver}"

	install -m 0755 -d "${pkgdir}/usr/share/dictd"
	install -m 0644 -t "${pkgdir}/usr/share/dictd/" devils.{dict.dz,index}
	
	install -m 0755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
