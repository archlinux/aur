# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=ucsc-kent-genome-tools
pkgver=316
pkgrel=1
pkgdesc="UCSC genome browser 'kent' bioinformatic utilities"
arch=('i686' 'x86_64')
url="http://hgdownload.soe.ucsc.edu/admin/exe/"
license=other
install=$pkgname.install
depends=('mariadb-clients' 'libpng' 'openssl')
source=(http://hgdownload.soe.ucsc.edu/admin/exe/userApps.v${pkgver}.src.tgz)
sha1sums=('b9eddc7e7bce7d3f6a2b09d06175b9ebee776764')

build() {
   cd "${srcdir}/userApps/"
   make
}

package() {
   cd "${srcdir}/userApps/"
   mkdir -p "${pkgdir}/usr/bin/"
   mv bin/ "${pkgdir}/usr/bin/kentUtils/"

   mkdir -p "$pkgdir/etc/profile.d"
   echo "export PATH=/usr/bin/kentUtils:"'$PATH' > "$pkgdir/etc/profile.d/kentUtils.sh"

   mkdir -p "${pkgdir}/opt/kentUtils/"
cat  > "${pkgdir}/opt/kentUtils/.hg.conf" <<EOF
db.host=genome-mysql.cse.ucsc.edu
db.user=genomep
db.password=password
central.db=hgcentral
EOF
   
   install -D -m644 licenseUcscGenomeBrowser.txt "${pkgdir}/usr/share/licenses/kentUtils/licenseUcscGenomeBrowser.txt"
   install -D -m644 GenomeBrowserLicense.pdf "${pkgdir}/usr/share/licenses/kentUtils/GenomeBrowserLicense.pdf"
   install -D -m644 licenseBlat.txt "${pkgdir}/usr/share/licenses/kentUtils/licenseBlat.txt"
}

# vim:set ts=2 sw=2 et:
