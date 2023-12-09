# Maintainer: Ole Petter Orhagen <ole at orhagen dot no>
# https://aur.archlinux.org/cfengine-git.git
#
# Contributor: Kuba Serafinowski <zizzfizzix AT gmail DOT com>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Christian Berendt <christian@thorlin.de>
# Contriburor: Alexey Shpakovsky <alexey at shpakovsky dot ru>
# Contriburor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Vanush Misha Paturyan <ektich+cfengine-aur@gmail.com>

pkgname="cfengine-git"
pkgver="3.23.0.r9.g042225d"
pkgrel=1
pkgdesc='Automated suite of programs for configuring and maintaining Unix-like computers.'
url='https://cfengine.com'
license=('GPL3')
arch=(
    'i686'
    'x86_64'
)
depends=(
    'lmdb'
    'pcre'
    'libxml2'
    'pam'
    'libyaml'
    'curl'
    'openssl'
)
makedepends=(
    'git'
    'which'
    'inetutils'
)
optdepends=(
    'libvirt'
    'postgresql-libs'
    'libmariadbclient'
    'acl'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}-${pkgver}::git+https://github.com/cfengine/core.git"
        "git+https://github.com/NorthernTechHQ/libntech.git"
        "git+https://github.com/cfengine/masterfiles.git")
md5sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)
install=${pkgname}.install

pkgver() {
    cd "$srcdir/${pkgname}-${pkgver}"
    printf "%s" "$(git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  git submodule init
  git config submodule.libntech.url "$srcdir/libntech"
  git -c protocol.file.allow=always submodule update
  ./autogen.sh

  cd ..
  cd masterfiles
  ./autogen.sh
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"

  export CFLAGS="$CFLAGS -fcommon"
  ./configure \
    --prefix=/usr \
    --with-workdir=/var/${pkgname} \
    --with-openssl \
    --with-pcre \
    --with-libacl=check \
    --with-libxml2 \
    --with-libvirt=check \
    --with-lmdb \
    --with-mysql=check \
    --with-postgresql=check
  make
  cd ..

  # now build the masterfiles
  cd "$srcdir/masterfiles"
  ./configure \
      --prefix=/usr/share/doc/cfengine/CoreBase \
      --with-core=../${pkgname}-${pkgver}
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make check || true

  cd ..
  cd "$srcdir/masterfiles"
  make check || true
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
  cd ..

  # masterfiles
  cd "$srcdir/masterfiles"
  make DESTDIR=$pkgdir install
  cd ..

  install -d -m755 ${pkgdir}/var/cfengine/bin
  install -d -m755 ${pkgdir}/var/cfengine/masterfiles

  for f in $(ls ${pkgdir}/usr/bin); do
    /bin/ln -s /usr/bin/$f ${pkgdir}/var/cfengine/bin
  done
}

# vim:set ts=2 sw=2 et:
# emacs:
# Local Variables:
# sh-indentation: 2
# End:
