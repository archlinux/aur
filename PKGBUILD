# Mantainer Jens Staal <staal1978@gmail.com>

pkgname=dev86-git
pkgver=0.16.20.r11.g4ed1997
pkgrel=1
pkgdesc="The 16-bit bcc compiler + elksemu, github source fork"
arch=('i686' 'x86_64')
url="https://github.com/jbruchon/dev86"
license=('GPL' 'LGPL' 'custom')

if [ "${CARCH}" == "x86_64" ]; then
  depends=('lib32-glibc')
  makedepends=('bin86' 'git' 'gcc-multilib')
else
  makedepends=('bin86' 'git')
fi

provides=('dev86' 'bin86' 'elksemu')
conflicts=('dev86' 'bin86')
replaces=('dev86' 'bin86')

source=('dev86::git://github.com/jbruchon/dev86.git' \
        'elks::git://github.com/jbruchon/elks.git'
)

sha256sums=('SKIP' 'SKIP')

options=('!libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')

pkgver() {
  cd "$srcdir"/dev86/

  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
  else
    echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
  fi
}

prepare() {
  cd "$srcdir"/elks
  rm -f dev86 # in case link already exists
  ln -s "$srcdir"/dev86 dev86
  cd dev86
  sed 's|%=|"%="|g' -i cpp/token1.tok
}

build() {
  cd "$srcdir"/elks/dev86
  #always build as 32-bit to get elksemu
  if [ "${CARCH}" == "x86_64" ]; then
  _GCC32="gcc -m32 -march=i686 -mtune=generic -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2" 
  _LD32="ld -m32 -Wl,-O1,--sort-common,--as-needed,-z,relro" 
  make ELKSSRC="$srcdir"/elks PREFIX=/usr MANDIR=/usr/share/man DIST="$pkgdir" CHOST="i686-pc-linux-gnu" CC="$_GCC32" LD="$_LD32" all
  else
  make ELKSSRC="$srcdir"/elks PREFIX=/usr MANDIR=/usr/share/man DIST="$pkgdir" all
  fi
  #build some elks userland programs for testing / proof-of-concept
  cd ../elks
  make defconfig
  make dep
  
  cd ../busyelks
  ./build
    
}


package() {
  cd "$srcdir"/elks/dev86
  mkdir -p "$pkgdir"/usr/share/man/man1
  mkdir -p "$pkgdir"/usr/man/man1 #hack...
  make install-all DIST="$pkgdir"
  cp -r "$pkgdir"/usr/man/* "$pkgdir"/usr/share/man/
  rm -rf "$pkgdir"/usr/man
  mkdir -p "$pkgdir"/usr/bin86
  cp "$srcdir"/elks/busyelks/_install/bin/* "$pkgdir"/usr/bin86/
}

