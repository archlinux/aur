# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=pbuilder-git
pkgver=0.231.r20.ga7a3f03e
pkgrel=1
pkgdesc="Personal package builder for Debian packages"
arch=('any')
license=('GPL')
url='https://pbuilder-team.pages.debian.net/pbuilder'
depends=('debootstrap' 'dpkg' 'inetutils')
optdepends=('ubuntu-keyring: checking release signatures of ubuntu distributions'
            'debian-archive-keyring: checking release signatures of debian distributions'
            'debian-keyring: checking release signatures of debian distributions (alternative package)')
makedepends=('git')
checkdepends=('man-db')
provides=('pbuilder')
conflicts=('pbuilder')
backup=('etc/pbuilderrc')
options=('emptydirs')
source=("git+https://salsa.debian.org/pbuilder-team/pbuilder.git")
sha512sums=('SKIP')

prepare() {
    cd ${srcdir}/pbuilder

    # Not building documents
    sed -i 's/$(MAKE) -C Documentation/#$(MAKE) -C Documentation/' Makefile
}

pkgver() {
    cd pbuilder

    # Reference: https://wiki.archlinux.org/title/VCS_package_guidelines#Git
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/pbuilder"

  make
}

check() {
  cd "${srcdir}/pbuilder"

  make check
}

package() {
  cd "${srcdir}/pbuilder"

  make install DESTDIR="${pkgdir}" SBINDIR="${pkgdir}/usr/bin"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1/" debuild-pbuilder.1 pdebuild.1
  install -Dm644 -t "${pkgdir}/usr/share/man/man5/" pbuilderrc.5
  install -Dm644 -t "${pkgdir}/usr/share/man/man8/" pbuilder.8

  for i in 'aptcache' 'build' 'ccache' 'result'
  do
    install -d "${pkgdir}/var/cache/pbuilder/$i"
  done

  cat <<EOF > "${pkgdir}/etc/pbuilderrc"
# this is your configuration file for pbuilder.
# the file in /usr/share/pbuilder/pbuilderrc is the default template.
# /etc/pbuilderrc is the one meant for overwriting defaults in
# the default template
#
# read pbuilderrc.5 document for notes on specific options.
MIRRORSITE=http://please-choose-a-valid-mirror.example.com/
EOF
}
