# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-suspendoutput
pkgver=2.1.0
_vdrapi=2.4.0
pkgrel=1
pkgdesc="Output device that does nothing"
url="http://phivdr.dyndns.org/vdr/vdr-dummydevice/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('ffmpeg')
_plugname=${pkgname//vdr-/}
source=("http://phivdr.dyndns.org/vdr/$pkgname/$pkgname-$pkgver.tgz"
        "12_suspendoutput_nooutput.patch::http://minidvblinux.de/git/?a=blob&p=vdr-plugin-suspendoutput&h=28fc94ae42381a1efb3f2e5ceb7165bdd8e56369"
        '13_suspendoutput_remove_template_redefine.patch'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('e9bbd583ea87a3809693f79e57fd63e6'
         'a9ab789cdbaa700fdb1f33db4a810d2e'
         '5f554d7dedbddeae94a26eda3d066845'
         '9b908b272a2f24e1c73b990b53fb5e76')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -p1 -i "$srcdir/12_suspendoutput_nooutput.patch"
  patch -p1 -i "$srcdir/13_suspendoutput_remove_template_redefine.patch"

  # http://www.vdr-wiki.de/wiki/index.php/Kategorie:Raspbian_VDR_Streaming_Client_mittels_Streamdev_und_rpihddevice#Installation_vorbereiten
  for i in *.mpg; do
    mv $i $i.pes
    ffmpeg -i $i.pes -f mpegts $i
  done
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
