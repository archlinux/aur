# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=pbuilder
pkgver=0.230.4
pkgrel=1
pkgdesc="Personal package builder for Debian packages"
arch=('any')
license=('GPL')
url='https://pbuilder-team.pages.debian.net/pbuilder'
depends=('debootstrap' 'dpkg')
optdepends=('devscripts' 'libeatmydata' 'fakeroot' 'net-tools' 'iproute2' 'sudo')
makedepends=('libxslt' 'tldp-xsl' 'po4a' 'dblatex')
checkdepends=('man-db')
backup=('etc/pbuilderrc')
options=('!emptydirs')
source=("https://salsa.debian.org/pbuilder-team/pbuilder/-/archive/${pkgver}/pbuilder-${pkgver}.tar.gz"
        "pbuilder.tmpfiles.conf")
sha512sums=('cccfc727f63da72e2302188ecf4a62c3cd48661476b55f4269a235f04468c53f34db54d1ac80d0257230482aa55721089ec62a3a05132505b4822c3f506ee8a8'
            '6c73c65e97115b82763a5c033a121844e4db5f9097ec90334ebba66913b8e52a17f22179b2e17dd7fdb5d723f7c6919074e4d646bf419d6dc0c5971df358014d')

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
