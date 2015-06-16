# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Alexander Grothe <seahawk1986[at]hotmail[dot]com>
pkgname=vdr-markad
pkgver=0.1.4_37_gc55f43f
epoch=1
_gitver=c55f43f413dff8740f99d684e8879835d4409920
_vdrapi=2.2.0
pkgrel=8
pkgdesc="automatic advertisement detection"
url="http://projects.vdr-developer.org/projects/plg-markad"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('ffmpeg' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-markad.git#commit=$_gitver"
        "markad-newmakefile-vdr-1.7.36.tgz::http://www.vdr-portal.de/index.php?page=Attachment&attachmentID=32670"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '5dd5c090a59066adca01ac487a9faeae'
         'c0d6383c9c9b8ee6c34af19179676bf3')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed 's/-/_/g;s/v//'
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  cp "$srcdir/markad/plugin/Makefile" plugin/Makefile
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="$pkgdir" install

  #Move the logofiles to the right place and add a symlink to workaround patching.
  mkdir -p "$pkgdir/usr/share"
  mv "$pkgdir/var/lib/markad" "$pkgdir/usr/share/markad"
  ln -s /usr/share/markad "$pkgdir/var/lib/markad"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
