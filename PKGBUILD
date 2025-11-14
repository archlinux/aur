# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Sebastian J. Bronner <waschtl@sbronner.com>

pkgname=aqbanking-git
pkgver=6.7.7beta+6+g98ad900a
pkgrel=2
pkgdesc="A library for online banking and financial applications"
arch=('x86_64')
url='https://www.aquamaniac.de/rdm/projects/aqbanking'
license=('GPL-2.0-only OR GPL-3.0-only')
depends=('bash' 'glibc' 'gmp' 'gwenhywfar-git')
makedepends=('git')
provides=("aqbanking=${pkgver%beta+*}")
conflicts=('aqbanking')
options=('!makeflags')
install="${pkgname}.install"
source=('git+https://git.aquamaniac.de/git/aqbanking')
sha256sums=('SKIP')
_sourcedir=aqbanking

pkgver() {
  git -C "${_sourcedir}" describe --tags | sed 's/-/+/g'
}

prepare() {
  ACLOCAL_FLAGS='-I /usr/share/aclocal' make -C "${_sourcedir}" -fMakefile.cvs
}

build() {
  # The targets typedefs and types need to be built when building from GIT
  # (README:239-246). The README file mistakenly specifies to run configure
  # after these. They require configure to have been run. As of version
  # 5.99.43beta+10+gfe9dcc2b these targets break building outside of the source
  # tree (as is my custom to do). That is why I am using cd $_sourcedir.
  cd "${_sourcedir}"

  BUILD_DATE="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m%d%H%M%S)"

  export PKG_CONFIG=/usr/bin/pkg-config
  ./configure --prefix=/usr --enable-gwenhywfar \
              --with-build-datetime="${BUILD_DATE}" \
              --with-backends="aqhbci aqofxconnect aqpaypal aqnone" # aqnone https://www.aquamaniac.de/rdm/issues/258
  make typedefs
  make types
  make
}

package() {
  make -C "${_sourcedir}" DESTDIR="${pkgdir}" install
}
