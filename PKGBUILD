# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <contrasutra@myrealbox.com>
# Maintainer: ferreum <code at ferreum de>

_pkgname=elinks
pkgname=${_pkgname}-git
pkgver=v0.17.0rc1.r0.gee60a7e8
pkgrel=2
pkgdesc="An advanced and well-established feature-rich text mode web browser. Git version, JavaScript disabled."
arch=(i686 x86_64 armv6h armv7h aarch64)
url="https://github.com/rkd77/elinks"
provides=(${_pkgname})
license=('GPL')
conflicts=(${_pkgname})
depends=('bzip2' 'expat>=2.0' 'gpm>=1.20.4' 'openssl' 'curl' 'lua' 'libidn2' 'libsixel' 'gc' 'tre' 'zlib')
makedepends=('git')
source=("git+https://github.com/rkd77/elinks#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  # not needed when using autoreconf
  #[ -x configure ] || sh autogen.sh

  # autoreconf to allow compiling on arm (project's config is outdated (updated 2004)?)
  autoreconf -ifv

  ./configure --prefix=/usr --mandir=/usr/share/man \
              --sysconfdir=/etc \
              --with-luapkg=lua54 \
              --with-zlib \
              --without-x \
              --without-spidermonkey \
              --with-libcurl \
              --with-libsixel \
              --enable-cgi \
              --enable-gemini \
              --enable-leds \
              --disable-smb \
              --disable-sm-scripting \
              --enable-256-colors \
              --enable-html-highlight \
              --enable-exmode
  # need -j1 to disable parallelism, which fixes "ld: no input files" error
  # see https://github.com/rkd77/elinks/issues/209
  make -j1
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/share/locale/locale.alias"
}

# vim:set sw=2 et:
