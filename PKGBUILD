# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-suspendoutput
pkgver=2.0.0
_vdrapi=2.2.0
pkgrel=9
pkgdesc="Output device that does nothing"
url="http://phivdr.dyndns.org/vdr/vdr-dummydevice/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('ffmpeg')
_plugname=${pkgname//vdr-/}
source=("http://phivdr.dyndns.org/vdr/$pkgname/$pkgname-$pkgver.tgz"
        "10_suspendoutput_vdr-2.1.x_compat.patch::http://www.minidvblinux.de/git/?a=blob&p=vdr-plugin-suspendoutput&h=e9f9bc511668b6d884a000db29b01d970bc5095d"
        "11_suspendoutput_svdrp.patch::http://www.minidvblinux.de/git/?a=blob&p=vdr-plugin-suspendoutput&h=045172a810e98bad784cdae4f22bcc305118b490"
        "12_suspendoutput_nooutput.patch::http://www.minidvblinux.de/git/?a=blob&p=vdr-plugin-suspendoutput&h=dda561c8a229804b2e9bef05a189be234b95246f"
        '13_suspendoutput_remove_template_redefine.patch'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('4cbeaf9bf9c83e72ed3a8dee703caf39'
         'fb094cd51172345fec1d3d30684e6af3'
         '4a7dda396e042ab2a5e47c3db06f8925'
         '8e3fefbce7410be7c0d960e2eb59d2ce'
         'f5e5543022910a7eb4f36d888efaf363'
         '9b908b272a2f24e1c73b990b53fb5e76')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -p1 -i "$srcdir/10_suspendoutput_vdr-2.1.x_compat.patch"
  patch -p1 -i "$srcdir/11_suspendoutput_svdrp.patch"
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
