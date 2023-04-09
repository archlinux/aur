# Maintainer: Sébastien "Seblu" Luttringer
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
pkgver=9.2
pkgrel=3
pkgdesc='The basic file, shell and text manipulation utilities of the GNU operating system with SELinux support'
arch=('x86_64' 'aarch64')
license=('GPL3')
url='https://www.gnu.org/software/coreutils/'
groups=('selinux')
depends=('glibc' 'acl' 'attr' 'gmp' 'libcap' 'openssl' 'libselinux')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
source=("https://ftp.gnu.org/gnu/${pkgname/-selinux}/${pkgname/-selinux}-$pkgver.tar.xz"{,.sig}
        '01-FS#77969.patch::https://git.savannah.gnu.org/cgit/coreutils.git/patch/?id=76f2fb627118a26c25003dbd98c22c153b7ee1d2'
        'copy-fix-reflink-auto-fallback.patch'
        'gnulib-backupfile-62607.patch'
        'coreutils-backup-62607.patch')
validpgpkeys=('6C37DC12121A5006BC1DB804DF6FD971306037D9') # Pádraig Brady
sha256sums=('6885ff47b9cdb211de47d368c17853f406daaf98b148aaecdf10de29cc04b0b3'
            'SKIP'
            'a3cc5d1548bd6a26e1b8f4cff076862243af9faaffc4c257a0c766457fd028cc'
            '4b2ac873a9cb4a825bb90e964383ca0cb956ece347e9ded5387ddd8ff293855b'
            '5455ce8f736d5d8f5c7a5c8b70b4ec46a7e050125924f2135af4fbf685bddda6'
            '10a8ea0b14c5254775c3817a31a07928c0609ca3eaec78fcecddeefe95101b9d')

prepare() {
  cd ${pkgname/-selinux}-$pkgver
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
  sed '/^  tests\/tail-2\/assert\.sh\s/d' -i tests/local.mk
  sed '/^  tests\/tail-2\/inotify-dir-recreate\.sh\s/d' -i tests/local.mk

  # some tests create directories with long name, which does not work on GitHub Actions
  sed '/^  tests\/du\/long-from-unreadable\.sh\s/d' -i tests/local.mk
  sed '/^  tests\/rm\/deep-2\.sh\s/d' -i tests/local.mk
}

build() {
  cd ${pkgname/-selinux}-$pkgver
  aclocal -I m4
  autoconf -f
  autoheader -f
  automake -f
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib \
      --with-openssl \
      --enable-no-install-program=groups,hostname,kill,uptime \
      --with-selinux
  make
}

check() {
  cd ${pkgname/-selinux}-$pkgver
  make check
}

package() {
  cd ${pkgname/-selinux}-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
