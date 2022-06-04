# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=pbuilder
pkgver=0.231
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
        "query-host-packages-using-pacman.patch"
        "pbuilder.tmpfiles.conf")
sha512sums=('7ffa431ce9e3d7df1ae2bb5846d691ed6246d5ea42e0cc1500cf80fa2e2276f00990dcb70d3d803d00dd7a567f74a0406a664ce8c6fb13955d3033f79b954e59'
            'f7766f1452ddfc8fa4773c7aac1e7e1122b92a70099fc2d2175d213120fdb101dfda2f74b9c49f454c7dc0843454e79c3a7658357c1a0d8bffb24be965a2c08e'
            '6c73c65e97115b82763a5c033a121844e4db5f9097ec90334ebba66913b8e52a17f22179b2e17dd7fdb5d723f7c6919074e4d646bf419d6dc0c5971df358014d')

prepare() {
  cd "${srcdir}/pbuilder-${pkgver}"

  patch -Np1 < "${srcdir}/query-host-packages-using-pacman.patch"
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
