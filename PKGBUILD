# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Alexander Grothe <seahawk1986[at]hotmail[dot]com>
pkgname=vdr-markad
pkgver=0.1.4_44_g3681d3a
epoch=1
_gitver=3681d3a18383c238870de7d1ec1f1f9c8079cf89
_vdrapi=2.2.0
pkgrel=1
pkgdesc="automatic advertisement detection"
url="http://projects.vdr-developer.org/projects/plg-markad"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('ffmpeg' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-markad.git#commit=$_gitver"
        "vdr-2.3.2-markad-0.1.4.git20160925_v2.diff::https://www.vdr-portal.de/index.php?attachment/40533"
        "vdr-markad-newmakefile.diff"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '966a3b0ac4f9dbe9c3f0434072ed79cc'
         '77001bbf5f138d1d1cd7a6f334fa8202'
         'c0d6383c9c9b8ee6c34af19179676bf3')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed 's/-/_/g;s/v//'
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  patch -p1 -i "$srcdir/vdr-markad-newmakefile.diff"
  patch -p1 -i "$srcdir/vdr-2.3.2-markad-0.1.4.git20160925_v2.diff"
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
