# Maintainer: Francesco Zardi <frazar0 [at] hotmail [dot] it>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir at archlinux.org>
# Contributor: Tom Newsom <Jeepster at gmx.co.uk>
_basename=gnuplot
_version_major=4
_version_minor=6
_version_patch=7

pkgname=$_basename$_version_major
pkgver=$_version_major.$_version_minor.$_version_patch
pkgrel=3
pkgdesc="Plotting package which outputs to X11, PostScript, PNG, GIF, and others"
arch=('i686' 'x86_64')
url="http://www.gnuplot.info"
license=('custom')
depends=('readline' 'gd' 'wxgtk2.8' 'cairo' 'libjpeg' 'openssl-1.1' 'qt4' 'lua')
provides=('gnuplot')
makedepends=('texinfo' 'emacs' 'texlive-core' 'texlive-latexextra')
install=gnuplot.install
source=("http://downloads.sourceforge.net/sourceforge/$_basename/$_basename-$pkgver.tar.gz"
        'use-wx-config-2.8.patch'
        'update-lua-5.3.patch')
sha1sums=('0f76465981f4643a5a5491333aeda4d56d890622'
          '2074dc08fdd80c7ad0beb0137983edc1de5dcd6c'
          '532e3c0ff2daa47d1bd54ffd2f77592b83113c79')

prepare() {
  cd "$srcdir/$_basename-$pkgver"

  # fix default source location; use the GDFONTPATH variable to modify at runtime
  sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' src/variable.c

  sed -i -e 's|/usr/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
  -e 's|$(X11ROOT)/X11R6/lib/X11/fonts/Type1|$(X11ROOT)/usr/share/fonts/Type1|' \
  src/variable.c

  # Use wx-config-2.8 instead of wx-config
  patch -p1 -i ../use-wx-config-2.8.patch

  # Replace calls to functions deprecated in Lua 5.3
  patch -p1 -i ../update-lua-5.3.patch
}

build() {
  cd "$srcdir/$_basename-$pkgver"

  # Set same ABI version used to compile wxgtk2.8
  export CXXFLAGS="${CXXFLAGS:-} -fabi-version=2"

  ./configure --prefix=/usr \
              --libexecdir=/usr/bin \
              --with-gihdir=/usr/share/gnuplot \
              --with-readline=gnu \
              --enable-stats \
              --enable-qt4
  make pkglibexecdir=/usr/bin
}

package() {
  cd "$srcdir/$_basename-$pkgver"
  make pkglibexecdir=/usr/bin DESTDIR="$pkgdir" install install-info

  install -Dm644 lisp/dotemacs "$pkgdir/usr/share/emacs/site-lisp/dotemacs"
  install -Dm644 Copyright "$pkgdir/usr/share/licenses/$_basename/Copyright"

  rm -f "$pkgdir/usr/share/texmf-dist/ls-R"
}
