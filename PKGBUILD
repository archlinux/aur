# Contributor: Adam Nielsen <malvineous@shikadi.net>
# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua
# Contributor: Andrea Agosti <cifvts@gmail.com>
# Contributor: Charles Clement <caratorn@gmail.com>
# Contributor: Geraldo Augusto Vecchiato <geraldoav@gmail.com>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_pkgname=instantclient-basic
pkgname=oracle-${_pkgname}
pkgver=21.3.0.0.0
_urlver=213000
_unzippath=instantclient_21_3
pkgrel=1
pkgdesc="Light replacement for the Oracle client (files to run OCI, OCCI and JDBC-OCI programs)"
arch=('x86_64')
url="http://www.oracle.com/technetwork/database/features/instant-client/"
license=('custom:OTN')
depends=('gcc-libs' 'libaio')
replaces=('instantclient-basic' 'instantclient-basiclite')
options=(!strip)

# Fail if retrieval is attempted of any of the manual:// URLs
DLAGENTS+=('manual::/usr/bin/false');

# These are the only files we want to include in the source package
source=(LICENSE
        oracle.sh
        "https://download.oracle.com/otn_software/linux/instantclient/${_urlver}/${_pkgname}-linux.x64-${pkgver}.zip")
md5sums=('2d62e22e4f2d7e6d220fafde0f692a7d'
         '784005aa31cb56bb2303179d98fccd8e'
         '2d112ee5020f7b88f50dd7b0d14afcda')
sha256sums=('f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2'
            '36b5ab97950f1667403dd9b59c3cad25d8f9e457702feaece835d1bff7c971c9'
            '8576e75d0088ecc01e4bacd48507ca8bb445f441a2cc4eb326e92d3294d6efa5')

plain "If you run into any problems downloading the files, get the .zip version from"
plain "Oracle and place them in the PKGBUILD directory then re-run makepkg:"
plain ""
plain "  https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html"
plain ""
plain "Alternatively, unofficial prebuilt Arch packages are available by adding the"
plain "following lines to /etc/pacman.conf, if you agree to the Oracle licence[1]:"
plain ""
plain "  [oracle]"
plain "  SigLevel = Optional TrustAll"
plain '  Server = http://linux.shikadi.net/arch/$repo/$arch/'
plain ""
plain "Then run 'pacman -Sys oracle' to see available packages."
plain ""
plain "[1]: http://www.oracle.com/technetwork/licenses/instant-client-lic-152016.html"
plain ""

package() {
	cd "$srcdir/${_unzippath}/"
	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/lib"
	install -m 755 -t "$pkgdir/usr/bin" adrci genezi uidrvci
	# Copy files but not symlinks
	install -m 755 -t "$pkgdir/usr/lib" `find . -type f -name '*.so*'`
	install -m 644 -t "$pkgdir/usr/lib" *.jar

	# Copy across the script to set environment variables
	install -Dm755 "$srcdir/oracle.sh" "$pkgdir/etc/profile.d/oracle.sh"

	# create required symlinks
	cd "$pkgdir/usr/lib" || return 1
	local lib link
	for lib in *.so*; do
		link=$lib
		while [[ ${link#*.} != so ]]; do
			link=${link%.*}
			ln -s $lib $link
		done
	done

	install -Dm644 "$srcdir/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
}
