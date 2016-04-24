# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=ucsc-kent-genome-tools
pkgver=331
pkgrel=1
pkgdesc="UCSC genome browser 'kent' bioinformatic utilities"
arch=('i686' 'x86_64')
url="http://hgdownload.soe.ucsc.edu/admin/exe/"
license=('other')
install=$pkgname.install
depends=('mariadb-clients' 'libpng' 'openssl')
source=(http://hgdownload.soe.ucsc.edu/admin/exe/userApps.v${pkgver}.src.tgz)
sha1sums=('d2a99387a559ae525f078dbfdaa4ab7158098331')

prepare() {
  cd "${srcdir}/userApps/"
  make clean
}

build() {
   cd "${srcdir}/userApps/"
   
   # not sure why this is required
   make libs
   cp kent/src/lib/x86_64/* kent/src/lib/local/.
   cp kent/src/lib/local/* kent/src/lib/x86_64/.
   
   make all
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
