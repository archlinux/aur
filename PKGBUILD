# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: nl6720 <nl6720@archlinux.org>

pkgname=apparmor-git
pkgver=5.0.0.beta1.r461.gbdccc1e
pkgrel=1
pkgdesc='Mandatory Access Control (MAC) using Linux Security Module (LSM)'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://gitlab.com/apparmor/apparmor'
license=(
  GPL-2.0-only
  LGPL-2.0-only
  LGPL-2.1-only
)
depends=(
  audit
  bash
  glibc
  libgcc
  pam
  python
  python-legacy-cgi
)
makedepends=(
  apache
  autoconf-archive
  git
  libxcrypt
  python-setuptools
  ruby
  swig
)
checkdepends=(
  dejagnu
  perl-locale-gettext
  python-gobject
  python-notify2
  python-psutil
  sqlite
  tk
)
optdepends=(
  'perl: for perl bindings'
  'python-gobject: for aa-notify'
  'python-notify2: for aa-notify'
  'python-psutil: for aa-notify'
  'ruby: for ruby bindings'
  'sqlite: for aa-notify'
  'tk: for aa-notify'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}" 'libapparmor.so')
replaces=("${pkgname%-git}")
backup=('etc/apparmor/easyprof.conf'
        'etc/apparmor/logprof.conf'
        'etc/apparmor/notify.conf'
        'etc/apparmor/parser.conf'
        'etc/apparmor/severity.db')
source=(
  "$pkgname::git+https://gitlab.com/apparmor/apparmor.git"
)
sha512sums=('SKIP')
_core_perl='/usr/bin/core_perl'

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname/libraries/libapparmor/
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --sbindir=/usr/bin
    --with-perl
    --with-python
    --with-ruby
  )
  cd "$pkgname"

  # Allow building with newer toolchain
  # See https://gitlab.archlinux.org/archlinux/packaging/packages/apparmor/-/work_items/12#note_459648
  export CXXFLAGS+=" -Wno-error=format-security"

  # export required perl executable locations
  export MAKEFLAGS+=" POD2MAN=$_core_perl/pod2man"
  export MAKEFLAGS+=" POD2HTML=$_core_perl/pod2html"
  export MAKEFLAGS+=" PODCHECKER=$_core_perl/podchecker"
  export MAKEFLAGS+=" PROVE=$_core_perl/prove"
  (
    cd libraries/libapparmor/
    ./configure "${configure_options[@]}"
    make
  )
  make -C binutils
  make -C parser
  make -C profiles
  make -C utils
  make -C changehat/pam_apparmor
  make -C changehat/mod_apparmor
  make -C utils/vim

  # Copy to test location as some tests render the resulting python bytecode
  # unreproducible: https://gitlab.com/apparmor/apparmor/-/issues/184
  cd ..
  cp -av $pkgname $pkgname-test
}

check() {
  cd $pkgname-test

  echo "INFO: Running check: libraries/libapparmor"
  make -C libraries/libapparmor check

  echo "INFO: Running check binutils"
  make -C binutils check

  # echo "INFO: Running check parser"
  # NOTE: the profiles checks are notoriously broken, so run each separately
  # make -C parser check

  echo "INFO: Running check-abstractions.d profiles"
  make -C profiles check-abstractions.d

  # Many hardcoded paths are not accounted for:
  # https://gitlab.com/apparmor/apparmor/-/issues/137
  echo "INFO: Running check-logprof profiles"
  make -C profiles check-logprof

  echo "INFO: Running check-parser profiles"
  make -C profiles check-parser

  echo "INFO: Running check utils"
  # We do not care about linting when running tests
  # https://gitlab.com/apparmor/apparmor/-/issues/121
  make PYFLAKES='/usr/bin/true' -C utils check
}

package() {
  # export required perl executable locations
  export MAKEFLAGS+=" POD2MAN=$_core_perl/pod2man"
  export MAKEFLAGS+=" POD2HTML=$_core_perl/pod2html"
  export MAKEFLAGS+=" PODCHECKER=$_core_perl/podchecker"
  export MAKEFLAGS+=" PROVE=$_core_perl/prove"

  cd $pkgname
  make -C libraries/libapparmor DESTDIR="$pkgdir" install
  make -C changehat/pam_apparmor DESTDIR="$pkgdir/usr" install
  make -C changehat/mod_apparmor DESTDIR="$pkgdir" install
  make -C binutils DESTDIR="$pkgdir" SBINDIR="$pkgdir/usr/bin" USR_SBINDIR="$pkgdir/usr/bin" install
  make -C init -j1 DESTDIR="$pkgdir" SBINDIR="$pkgdir/usr/bin" USR_SBINDIR="$pkgdir/usr/bin" APPARMOR_BIN_PREFIX="$pkgdir/usr/lib/apparmor" install install-systemd
  make -C parser -j1 DESTDIR="$pkgdir" SBINDIR="$pkgdir/usr/bin" USR_SBINDIR="$pkgdir/usr/bin" install
  make -C profiles DESTDIR="$pkgdir" install
  make -C utils DESTDIR="$pkgdir" SBINDIR="$pkgdir/usr/bin" USR_SBINDIR="$pkgdir/usr/bin" BINDIR="$pkgdir/usr/bin" VIM_INSTALL_PATH="$pkgdir/usr/share/vim/vimfiles/syntax" install

  # Set file mode to allow the Perl library to be stripped:
  # https://gitlab.com/apparmor/apparmor/issues/34
  find "$pkgdir/usr/lib/perl5/" -type f -iname "*.so" -exec chmod 755 {} \;

  # Remove empty core_perl directory:
  # https://gitlab.com/apparmor/apparmor/issues/40
  rm -rv "${pkgdir}"/usr/lib/perl5/*/core_perl
  # move ruby bindings to vendor_ruby:
  # https://gitlab.com/apparmor/apparmor/issues/35
  mv -v "$pkgdir/usr/lib/ruby/"{site,vendor}_ruby
  # Adding files below /etc/apparmor.d to backup array
  cd "$pkgdir"
  # Trick extract_function_variable() in makepkg into not detecting the
  # backup array modification and adding remaining configuration files
  [[ /usr/bin/true ]] && backup=( ${backup[@]} $(find "etc/$pkgname.d/" -type f | LC_ALL=C sort) )
}
