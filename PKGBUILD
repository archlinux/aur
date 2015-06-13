# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>

pkgname=snd-gtk-jack-cvs
pkgver=15.6
pkgrel=1
pkgdesc="A sound editor with JACK enabled and GTK GUI. CVS version"
arch=('i686' 'x86_64')
url="http://ccrma.stanford.edu/software/snd/"
license=('custom')
depends=('fftw' 'gsl' 'gtk3' 'jack')
makedepends=('ladspa' 'cvs')
provides=('snd-ls' 'snd')
conflicts=('snd-ls' 'snd')

_cvsroot=":pserver:snd.cvs.sourceforge.net:/cvsroot/snd"
_cvsmod="cvs-snd"

#pkgver() {
#ver="$(cvs -z3 -d "$_cvsroot" log -h snd.h | sed -n 4p | sed -e 's/head\: //')"
#printf "15r%s" ${ver}
#}


build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."

  if [[ -d "$_cvsmod/CVS" ]]; then
    cd "$_cvsmod"
    cvs -z3 update -d
  else
    cvs -z3 -d "$_cvsroot" co -f "$_cvsmod"
    cd "$_cvsmod"
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"
  ./configure --prefix=/usr --without-pulseaudio --without-portaudio --with-jack --with-ladspa
  make LIBS="-lm -ldl -lpthread"
}

package() {
  cd "$srcdir/$_cvsmod-build"
  make prefix=$pkgdir/usr install
  rm -f $pkgdir/usr/share/$_pkgname/*.{fs,rb}
  install -D -m 644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
