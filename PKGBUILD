# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=ucsc-kent-genome-tools
pkgver=334
pkgrel=1
pkgdesc="UCSC genome browser 'kent' bioinformatic utilities"
arch=('i686' 'x86_64')
url="http://hgdownload.soe.ucsc.edu/admin/exe/"
license=('other')
install=$pkgname.install
depends=('mariadb-clients' 'libpng' 'openssl')
source=(http://hgdownload.soe.ucsc.edu/admin/exe/userApps.v${pkgver}.src.tgz)
sha1sums=('a60504c54cab7e4287d45160f7db53ab881eaf91')

prepare() {
  cd "${srcdir}/userApps/"
  make clean
}

build() {
  cd "${srcdir}/userApps/"
   
  make all
}

package() {
  cd "${srcdir}/userApps/"
  mkdir -p "${pkgdir}/opt/${pkgname}/"
  cp -a * "${pkgdir}/opt/${pkgname}/."
  rm -rf "${pkgdir}/opt/${pkgname}/kent"

  mkdir -p "$pkgdir/etc/profile.d"
  echo "export PATH=/opt/${pkgname}/bin:"'$PATH' > "$pkgdir/etc/profile.d/${pkgname}.sh"
  chmod +x "$pkgdir/etc/profile.d/${pkgname}.sh"

  cat  > "${pkgdir}/opt/${pkgname}/.hg.conf" <<EOF
db.host=genome-mysql.cse.ucsc.edu
db.user=genomep
db.password=password
central.db=hgcentral
EOF
   
  install -D -m644 licenseUcscGenomeBrowser.txt "${pkgdir}/usr/share/licenses/${pkgname}/licenseUcscGenomeBrowser.txt"
  install -D -m644 GenomeBrowserLicense.pdf "${pkgdir}/usr/share/licenses/${pkgname}/GenomeBrowserLicense.pdf"
  install -D -m644 licenseBlat.txt "${pkgdir}/usr/share/licenses/${pkgname}/licenseBlat.txt"
}

# vim:set ts=2 sw=2 et:
