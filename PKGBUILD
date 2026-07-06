# Maintainer: Felix Neumärker <xdch47@posteo.de>
# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154,SC2164
# shellcheck shell=bash

pkgname=environment-modules
pkgver=5.6.1
pkgrel=6
pkgdesc="Provides for an easy dynamic modification of a user's environment via modulefile."
arch=('i686' 'x86_64')
url='https://envmodules.io/'
license=('GPL-2.0-or-later')
depends=('bash' 'glibc' 'inetutils' 'lsb-release' 'tcl>=8.5' 'procps-ng' 'util-linux' 'vi')
makedepends=('less' 'nagelfar' 'python-sphinx')
optdepends=('python: Support for environment modules in Python.'
  'cmake: Support for environment modules in CMake.'
  'xorg-xrdb: x-resource command in modulefiles')
checkdepends=('dejagnu' 'bash' 'fish' 'zsh' 'dash' 'ksh' 'tcsh' 'ruby' 'cmake' 'python' 'perl' 'r' 'xorg-xrdb')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/envmodules/modules/releases/download/v${pkgver}/modules-${pkgver}.tar.gz"
  'domainname.patch')
sha256sums=('b175e57860e62d87b6118a79cc2d76e857e5774a9ff78558d6726122760b0034'
  'e4983c68225d8d5bdf5b952a8cb7ee14941b38d1e544e99ab55b883b6552edbc')
conflicts=('lmod')
replaces=('env-modules')

backup=('etc/environment-modules/siteconfig.tcl'
  'etc/environment-modules/initrc')

prepare() {
  cd "modules-${pkgver}"

  patch --forward --strip=1 --input=../domainname.patch
}

build() {
  cd "modules-${pkgver}"

  conf=(
    --prefix=/usr/share/modules
    --bindir=/usr/bin
    --libdir=/usr/lib
    --libexecdir=/usr/lib/environment-modules
    --etcdir=/etc/environment-modules
    --initdir=/usr/share/modules/init
    --datarootdir=/usr/share
    --mandir=/usr/share/man
    --docdir=/usr/share/doc/environment-modules
    --vimdatadir=/usr/share/vim/vimfiles
    --modulefilesdir=/usr/share/modules/modulefiles
    --enable-modulespath
    --with-modulepath=/etc/environment-modules/modulefiles:/usr/share/modules/modulefiles
    --disable-set-binpath
    --disable-set-manpath
    --enable-example-modulefiles
    --enable-doc-install
    --with-tcl-linter=/usr/bin/nagelfar
    --enable-new-features
    --enable-quarantine-support
    --enable-require-via
    --enable-set-shell-startup
    --enable-silent-shell-debug-support
    --enable-unique-name-loaded
  )

  ./configure "${conf[@]}"
  make -C doc all
}

check() {
  cd "modules-${pkgver}"

  make test QUICKTEST=1
}

package() {
  cd "modules-${pkgver}"
  make DESTDIR="${pkgdir}/" install

  mkdir -p "${pkgdir}/etc/profile.d"
  ln -s "/usr/share/modules/init/profile.csh" "${pkgdir}/etc/profile.d/environment-modules.csh"
  ln -s "/usr/share/modules/init/profile.sh" "${pkgdir}/etc/profile.d/environment-modules.sh"

  mkdir "${pkgdir}/etc/environment-modules/modulefiles"
}
