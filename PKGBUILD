# Maintainer: Sebastian J. Bronner <waschtl@sbronner.com>

pkgname=aqbanking-git
pkgver=5.99.43beta+10+gfe9dcc2b
pkgrel=1
pkgdesc="A library for online banking and financial applications"
arch=(x86_64 i686)
url=https://www.aquamaniac.de/rdm/projects/aqbanking
license=(GPL)
depends=(gwenhywfar-git ktoblzcheck libofx)
options=('!makeflags')
provides=(aqbanking)
conflicts=(aqbanking)
source=(git+https://git.aquamaniac.de/git/aqbanking)
sha256sums=(SKIP)
_sourcedir=aqbanking

pkgver() {
  git -C $_sourcedir describe --tags | sed 's/-/+/g'
}

prepare() {
  ACLOCAL_FLAGS='-I /usr/share/aclocal' make -C $_sourcedir -fMakefile.cvs
}

build() {
  # The targets typedefs and types need to be built when building from GIT
  # (README:239-246). The README file mistakenly specifies to run configure
  # after these. They require configure to have been run. As of version
  # 5.99.43beta+10+gfe9dcc2b these targets break building outside of the source
  # tree (as is my custom to do). That is why I am using cd $_sourcedir.
  cd $_sourcedir
  ./configure --prefix=/usr --enable-gwenhywfar --with-backends="aqhbci aqofxconnect"
  make typedefs
  make types
  make
}

package() {
  make -C $_sourcedir DESTDIR=$pkgdir install
}
