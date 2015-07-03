# Maintainer: Roman Beslik <rabeslik@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=lib32-libpulse-git
pkgdesc="A featureful, general-purpose sound server (32-bit client libraries)"
pkgver=v5.0.52.g43b6a67
pkgrel=1
arch=(x86_64)
url="http://pulseaudio.org/"
license=(GPL LGPL)
depends=(lib32-dbus-core lib32-json-c 
         lib32-libasyncns lib32-libcap lib32-libxtst lib32-libsm lib32-libsndfile
         pulseaudio-git)
makedepends=(git gcc-multilib libtool-multilib intltool lib32-glib2 lib32-speex lib32-gtk2)
optdepends=('lib32-alsa-plugins: ALSA support')
provides=("lib32-pulseaudio=$pkgver")
conflicts=(lib32-pulseaudio lib32-libpulse)
replaces=(lib32-pulseaudio)
options=(!emptydirs !libtool)
source=()
sha256sums=()

_gitroot="git://anongit.freedesktop.org/pulseaudio/pulseaudio"
_gitname="pulseaudio"
_gitpkgver=5.0
_libs="libpulse.la libpulse-simple.la libpulse-mainloop-glib.la"
_pkglibs="libpulsecommon-${_gitpkgver}.la libpulsedsp.la"

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --always | sed 's|-|.|g'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=/usr/lib32 \
    --libexecdir=/usr/lib32 \
    --localstatedir=/var \
    --disable-hal \
    --disable-tcpwrap \
    --disable-rpath \
    --disable-default-build-tests

  # fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make -C src $_libs $_pkglibs
}

package() {
  cd "$srcdir/$_gitname-build"
  make -j1 -C src DESTDIR="$pkgdir" \
    lib_LTLIBRARIES="$_libs" pkglib_LTLIBRARIES="$_pkglibs" \
    install-libLTLIBRARIES install-pkglibLTLIBRARIES
  make -j1 DESTDIR="$pkgdir" install-pkgconfigDATA
}
