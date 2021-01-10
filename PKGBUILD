# Maintainer: Rose Kunkel <rose at rosekunkel dot me>

pkgname=guile3
_pkgname=guile
pkgver=3.0.5
pkgrel=1
pkgdesc='Portable, embeddable Scheme implementation written in C'
arch=('x86_64')
url='https://www.gnu.org/software/guile/'
license=('GPL3')
depends=('gmp' 'libltdl' 'ncurses' 'texinfo' 'libunistring' 'gc' 'libffi' 'readline')
source=("https://ftp.gnu.org/pub/gnu/${_pkgname}/${_pkgname}-$pkgver.tar.lz"{,.sig}
        'skip-testing-oom-conditions.patch')
sha256sums=('a484eeffbd4d655b0c05b1382df8d40f1e561f7e71b963065762f6a6a497c675'
            'SKIP'
            '2b053f0dafc5c68cc7f186c6252348e92e4b1e0f691e1e6eca7a5101c9b9f78a')
validpgpkeys=('4FD4D288D445934E0A14F9A5A8803732E4436885') # Andy Wingo

# Running strip can potentially mangle Guile bytecode (.go) files.
# See https://aur.archlinux.org/packages/guile3/#comment-769796
options=('!strip')

function prepare {
  # Disable a test that's known to fail. See
  # https://lists.gnu.org/archive/html/bug-guile/2021-01/msg00001.html
  patch -p1 -d "${_pkgname}-$pkgver" <skip-testing-oom-conditions.patch
}

function build {
  cd "${_pkgname}-$pkgver"

  # Install guile as guile3 and info files to /usr/share/info/guile3 so we don't
  # conflict with the official guile package.
  ./configure \
    --prefix=/usr \
    --infodir=/usr/share/info/${pkgname} \
    --program-suffix=3
  make
}

function check {
  cd "${_pkgname}-$pkgver"
  make -k check
}

function package {
  cd "${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir/" install

  # The official guile package already provides this file.
  rm "$pkgdir"/usr/share/aclocal/guile.m4
}
