# Maintainer: Sébastien "Seblu" Luttringer
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=coreutils-selinux
pkgver=9.12
pkgrel=2
pkgdesc='The basic file, shell and text manipulation utilities of the GNU operating system with SELinux support'
arch=('x86_64' 'aarch64')
license=(
  GPL-3.0-or-later
  GFDL-1.3-or-later
)
url='https://www.gnu.org/software/coreutils/'
groups=('selinux')
depends=( 
  acl  
  attr
  glibc
  gmp
  libcap
  libselinux
  openssl
)
makedepends=(
  git
  gperf
  python
  wget
)
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
source=(
  git+https://git.savannah.gnu.org/git/coreutils.git?signed#tag=v${pkgver}
  git+https://git.savannah.gnu.org/git/gnulib.git
  https://ftp.gnu.org/gnu/${pkgname/-selinux}/${pkgname/-selinux}-${pkgver}.tar.gz{,.sig}
  # https://lists.gnu.org/archive/html/coreutils/2026-09/msg00064.html
  0001-env-printenv-only-quote-when-outputting-to-terminals.patch
)
validpgpkeys=(
 6C37DC12121A5006BC1DB804DF6FD971306037D9 # Pádraig Brady
)
options=(!lto)
b2sums=('b893b993f6ee1f71939e1b54c3bde44eb0ad6d777e466125090488b082637539cbb07d1f9298cccfe4e510755945a7610b9a4ad2ea83061c5a53dd09c853ee7a'
        'SKIP'
        'c125cc479e4eec0178e49a1dffa975fb5d7753a5f04d3bb695d0e8043c05d76fb07c9595db20e9df5c359fdbbb326acb976d5bec7bd1771da22840156bb66369'
        'SKIP'
        '97619b6af8bdb4e18d1a895f52e72af8e2fd2dc0afda8f724a70c9b68cdc31470398101012cc4452ab5142defe55956fd9bc8f87d71ea11ff87cb2147e122d10')

prepare() {
  cd "${pkgname/-selinux}"
  # Skip downloading unstable po files in bootstrap scripts to avoid non-deterministic builds
  export SKIP_PO="1"
  # The $SKIP_PO environment variable is only honored by the gnulib submodule if using its "sh" implementation
  export GNULIB_TOOL_IMPL="sh"

  git submodule init
  git config submodule.gnulib.url ../gnulib
  git -c protocol.file.allow=always submodule update

  ./bootstrap

  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # tail -F fails to find out that files are removed, in test VM
  # so disable the tests which verify this
  sed '/^  tests\/tail\/assert\.sh\s/d' -i tests/local.mk
  sed '/^  tests\/tail\/inotify-dir-recreate\.sh\s/d' -i tests/local.mk

  # some tests create directories with long name, which does not work on GitHub Actions
  sed '/^  tests\/du\/long-from-unreadable\.sh\s/d' -i tests/local.mk
  sed '/^  tests\/rm\/deep-2\.sh\s/d' -i tests/local.mk

  # glibc 2.44+r24+g16be1518495f-1 was built with linux-api-headers<7.2
  # linux-api-headers 7.2-1 introduced a new errno, EFTYPE, which makes a test fail:
  # strerrorname_np(EFTYPE) returns NULL whereas it is expected to return "EFTYPE".
  # As this is transient, disable the test
  # https://debbugs.gnu.org/cgi/bugreport.cgi?bug=81875
  # https://gitlab.archlinux.org/archlinux/packaging/packages/coreutils/-/commit/19945e38852ab1483f13d18c8b4afdad0b774549
  sed -i gnulib-tests/gnulib.mk \
    -e '/^TESTS += test-strerrorname_np/d' \
    -e '/^check_PROGRAMS += test-strerrorname_np/d' \
    -e '/^EXTRA_DIST += test-strerrorname_np.c signature.h macros.h/d'

}

build() {
  cd "${pkgname/-selinux}"
  aclocal -I m4
  autoconf -f
  autoheader -f
  automake -f
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --with-openssl \
    --with-selinux
  make
  
  # Generate coreutils mo files from dist tarball
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}/po"
  for po in *.po; do
    msgfmt "${po}" -o "${po%.po}.mo"
  done
}

check() {
  cd "${pkgname/-selinux}"
  make check
}

package() {
  cd "${pkgname/-selinux}"
  make DESTDIR="${pkgdir}" install

  # Install coreutils mo files from dist tarball
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}/po"
  for mo in *.mo; do
    install -Dm 644 "${mo}" "${pkgdir}/usr/share/locale/${mo%.mo}/LC_MESSAGES/${pkgname/-selinux}.mo"
    install -dm 755 ${pkgdir}/usr/share/locale/${mo%.mo}/LC_TIME
    ln -s "../LC_MESSAGES/${pkgname/-selinux}.mo" "${pkgdir}/usr/share/locale/${mo%.mo}/LC_TIME/${pkgname}.mo"
  done
}

