# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=pbuilder
pkgver=0.231.3
pkgrel=1
pkgdesc="Personal package builder for Debian packages"
arch=('any')
license=('GPL-2.0-or-later')
url="https://pbuilder-team.pages.debian.net/pbuilder"
depends=('bash' 'debootstrap' 'dpkg')
optdepends=('devscripts' 'libeatmydata' 'fakeroot' 'net-tools' 'iproute2' 'sudo')
makedepends=('libxslt' 'po4a' 'dblatex')
checkdepends=('man-db')
backup=('etc/pbuilderrc')
options=('!emptydirs')
source=("https://salsa.debian.org/pbuilder-team/pbuilder/-/archive/${pkgver}/pbuilder-${pkgver}.tar.gz"
        "query-host-packages-using-pacman.patch"
        "pbuilder.tmpfiles.conf")
sha512sums=('24df27553874f7628738106bdf5ae26ba5f29467c80b9aabdabcd1e04b3e670153b39081ed1e65002c105309346863e11d63806c8a37f90cc0e362897741554b'
            'f878da2e3510c98e550cb227a9b86b7d8d806cb6092da5e81877d6f667fca80a7ebd87c752f08759751527a323b372f78c16a4496269726e5e4f500806fee50d'
            '6c73c65e97115b82763a5c033a121844e4db5f9097ec90334ebba66913b8e52a17f22179b2e17dd7fdb5d723f7c6919074e4d646bf419d6dc0c5971df358014d')

prepare() {
  cd "${srcdir}/pbuilder-${pkgver}"

  patch -Np1 < "${srcdir}/query-host-packages-using-pacman.patch"
  sed -i 's@/usr/share/sgml/docbook/dtd/xml/4.2/@/usr/share/xml/docbook/xml-dtd-4.2/@' \
    Documentation/pbuilder-doc.xml
  sed -i 's@/usr/share/xml/docbook/stylesheet/docbook-xsl/@/usr/share/xml/docbook/xsl-stylesheets/@' \
    Documentation/pbuilder-doc.xsl
}

build() {
  cd "${srcdir}/pbuilder-${pkgver}"

  make
}

check() {
  cd "${srcdir}/pbuilder-${pkgver}"

  make check
}

package() {
  cd "${srcdir}/pbuilder-${pkgver}"

  make install DESTDIR="${pkgdir}" SBINDIR="${pkgdir}/usr/bin"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1/" debuild-pbuilder.1 pdebuild.1
  install -Dm644 -t "${pkgdir}/usr/share/man/man5/" pbuilderrc.5
  install -Dm644 -t "${pkgdir}/usr/share/man/man8/" pbuilder.8
  cat <<EOF > "${pkgdir}/etc/pbuilderrc"
# this is your configuration file for pbuilder.
# the file in /usr/share/pbuilder/pbuilderrc is the default template.
# /etc/pbuilderrc is the one meant for overwriting defaults in
# the default template
#
# read pbuilderrc.5 document for notes on specific options.
MIRRORSITE=http://please-choose-a-valid-mirror.example.com/
EOF

  install -Dm644 "${srcdir}/pbuilder.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/pbuilder.conf"
}
