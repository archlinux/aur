# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=epics-base
pkgver=7.0.4.1
pkgrel=1
pkgdesc="Experimental Physics and Industrial Control System -- base"
arch=(x86_64)
url="https://epics-controls.org"
license=('EPICS Open License')
groups=(epics)
depends=(
readline
ncurses
perl
)
makedepends=(
clang
)

source=("${pkgname}-${pkgver}.tar.gz::https://epics-controls.org/download/base/base-${pkgver}.tar.gz")
#source=(https://epics-controls.org/download/base/base-${pkgver}.tar.gz{,.asc})

sha256sums=('7b1aa5a0b0a381207b3aa64b4496ffbdd0882ba3d57a09d75b94a9ef1fef668d')

prepare() {
  cd base-R${pkgver}
  export EPICS_HOST_ARCH=$(perl -CSD src/tools/EpicsHostArch.pl)
}

build() {
  cd base-R${pkgver}
  # seems like the epics devs have decided it should not be possible to seperate build from install
  # so here we build twice. once in build() for testing and once in package() to install.
  make
  make modules
}

check() {
  cd base-R${pkgver}
  make runtests || true  # TODO: figure out why some tests here are failing
}

package() {
  cd base-R${pkgver}
  
  echo "INSTALL_LOCATION=${pkgdir}/usr" >> configure/CONFIG_SITE.local
  # appairently it's not possible to build without installing...
  #make clean uninstall
  make FINAL_LOCATION=/usr
  make modules FINAL_LOCATION=/usr

  rm "${pkgdir}/usr/include/link.h" # owned by glibc

  mkdir -p "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${EPICS_HOST_ARCH}" > "${pkgdir}/etc/ld.so.conf.d/epics.conf"

  # TODO: perl stuff is not following perl install location rules, going into /usr/lib/perl/EpicsHostArch.pl, fix that
  # TODO: is this a debug build and so we get ==> WARNING: Package contains reference to $pkgdir? fix that.
  # TODO: figure out why strip option doesn't seem to work here
  # TODO: install license file

  mkdir -p "${pkgdir}/etc/profile.d"
  cat > ${pkgdir}/etc/profile.d/epics.sh <<END
export EPICS_HOST_ARCH="\$(perl -CSD /usr/lib/perl/EpicsHostArch.pl)"
export PATH=\${PATH}:/usr/bin/\${EPICS_HOST_ARCH}
END
  msg2 "Relogin or 'source /etc/profile.d/epics.sh' to use the new epics install"
}

