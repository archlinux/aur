# Maintainer: Zach Jaggi <feilen1000@gmail.com>

pkgname=openal-hrtf
pkgver=1.0
pkgrel=1
_oalversion=1.15.1
arch=('i686' 'x86_64')
license=('LGPL')
pkgdesc="Enable binaural audio globally in 3d applications"
depends=('openal>=1.14')
url="https://wiki.archlinux.org/index.php/Gaming"
source=("http://kcat.strangesoft.net/openal-releases/openal-soft-$_oalversion.tar.bz2"
        'http://www.sp.m.is.nagoya-u.ac.jp/HRTF/archive/data02.tgz'
        'alsoftrc')
noextract=('data02.tgz')
md5sums=('SKIP'
         'SKIP'
         'SKIP')

prepare() {
    cd $srcdir
    mkdir -p hrtfs CIAIR
    tar -xf data02.tgz -C CIAIR
}

build() {
  for hrtftable in CIAIR; do
    cd $srcdir/$hrtftable
    makehrtf -m -r=44100 -i="$srcdir/openal-soft-$_oalversion/utils/$hrtftable.def" -o=$srcdir/hrtfs/$hrtftable-%r.mhr
    makehrtf -m -r=48000 -i="$srcdir/openal-soft-$_oalversion/utils/$hrtftable.def" -o=$srcdir/hrtfs/$hrtftable-%r.mhr
  done
}

package() {

  install -m644 -D $srcdir/alsoftrc $pkgdir/etc/openal/alsoft.conf

  cd $srcdir/hrtfs
  for hrtftable in CIAIR; do
    install -m644 -D ./$hrtftable-44100.mhr $pkgdir/usr/share/openal/hrtfs/$hrtftable-44100.mhr
    install -m644 -D ./$hrtftable-48000.mhr $pkgdir/usr/share/openal/hrtfs/$hrtftable-48000.mhr
  done

}
