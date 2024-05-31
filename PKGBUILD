# Maintainer: Giorgi Taba K'obakhidze <t@gtk.ge>

# https://slackbuilds.org/repository/14.2/system/heirloom-pax/

pkgname="heirloom-pax"
_pkgname="heirloom"
pkgver=070715
pkgrel=1
pkgdesc="A version of the POSIX standard archive tool from the The Heirloom Toolchest"
arch=('x86_64')
url="https://heirloom.sourceforge.net/tools.html"
license=('TODO')
provides=('pax')
conflicts=('pax')
source=("${_pkgname}-$pkgver.tar.bz2::https://master.dl.sourceforge.net/project/${_pkgname}/${_pkgname}/$pkgver/${_pkgname}-$pkgver.tar.bz2?viasf=1"
        'makefile.patch')
md5sums=('d846be4b268b1d55b6ffcef847f09979'
         '3a20671c610f9b9c6aec14ce88574869')
sha256sums=('eb33f70bcc019b1d0e0a41f1d7552d45c57a16272e4e1c48634ec3e44496a30f'
            '34e48e04983d63dae2e3e7798d2c4a7f92a34f5bc743c7e6ebcd193e2217adc6')

prepare() {
  cd "${_pkgname}-$pkgver"

  sed -i '/^enum/s//static &/' cpio/cpio.h

  # Patch the paths in the man page to use /usr/lib/heirloom/bin, rather
  # than /usr/5bin (where the upstream maintainer suggests). This is
  # done to avoid littering the top level of /usr.
  sed -i.original \
    -e "s|/usr/5bin/s42/pax|/usr/bin/pax_su3|" \
    -e "s|/usr/5bin/posix/pax|/usr/bin/pax|" \
    -e "s|/usr/5bin/pax|/usr/bin/pax|" \
    -e "s|/usr/5bin/posix2001/pax|/usr/bin/pax_su3|" cpio/pax.1

  # Manually insert the CFLAGS, since autotools is not used
  CFLAGS="${CFLAGS} -D_AIX -Wno-error=format-security"
  sed -ri.original "/^CFLAGS.? = /s|-O.? |${CFLAGS} |" build/mk.config

  # We are only interested in pax and its build dependencies. Therefore
  # lets limit "make makefiles" from doing more than it needs.
  patch -p0 < ../makefile.patch
}

build() {
  cd "${_pkgname}-$pkgver"

  # Now we can build the two pax versions provided by the Heirloom Toolchest
  CFLAGS="${CFLAGS} -D_AIX -Wno-error=format-security"
  make makefiles
  make -C libcommon
  make -C libuxre
  make -C cpio pax pax_su3
}

package() {
  cd "${_pkgname}-$pkgver"

  # The install will be manual as it is easier than patching the
  # "make install" target. ;)
  #
  # Note: pax cannot go directly into /usr/bin because Heirloom Toolchest
  # provides two pax versions and the user may have another pax
  # already installed.
  install -Dm755 cpio/pax "$pkgdir"/usr/bin/pax
  install -Dm755 cpio/pax_su3 "$pkgdir"/usr/bin/pax_su3
  install -Dm644 cpio/pax.1 "$pkgdir"/usr/man/man1/pax.1

  find "$pkgdir"/usr/man -type f -exec gzip -9 {} \;

  mkdir -p "$pkgdir"/usr/share/{doc,licenses}/"$pkgname"/
  cd LICENSE
  cp -a README "$pkgdir"/usr/share/doc/"$pkgname"/
  cp -a \
    COPYING COPYING.LGPL LICENSE LUCENT OPENSOLARIS.LICENSE README \
    "$pkgdir"/usr/share/licenses/"$pkgname"/
}
