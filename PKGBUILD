# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-iptv
pkgver=2.4.0
_vdrapi=2.4.0
pkgrel=1
pkgdesc="Integrates multicast IPTV transport streams seamlessly into VDR"
url="http://www.saunalahti.fi/~rahrenbe/vdr/iptv/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('curl' "vdr-api=${_vdrapi}")
optdepends=('vlc: Needed for vlc2iptv')
_plugname=${pkgname//vdr-/}
source=("http://www.saunalahti.fi/~rahrenbe/vdr/$_plugname/files/$pkgname-$pkgver.tgz"
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/3Sat.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/Bundesligen-TV.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/Daytona-Beach.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/NASA.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/Sky-News.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/THE_VOICE.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/zdf-iptv.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/zdf_info-iptv.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/zdf_kultur-iptv.conf'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'etc/vdr/plugins/iptv/vlcinput/3Sat.conf'
        'etc/vdr/plugins/iptv/vlcinput/Bundesligen-TV.conf'
        'etc/vdr/plugins/iptv/vlcinput/Daytona-Beach.conf'
        'etc/vdr/plugins/iptv/vlcinput/NASA.conf'
        'etc/vdr/plugins/iptv/vlcinput/Sky-News.conf'
        'etc/vdr/plugins/iptv/vlcinput/THE_VOICE.conf'
        'etc/vdr/plugins/iptv/vlcinput/zdf-iptv.conf'
        'etc/vdr/plugins/iptv/vlcinput/zdf_info-iptv.conf'
        'etc/vdr/plugins/iptv/vlcinput/zdf_kultur-iptv.conf')
md5sums=('4de2b227c24f362b452870dbee05b30f'
         '5e960f7a71ee493c0bb7a7c56ea109c4'
         '8b51a64c8278f62dd9721a83a0654933'
         '48c790160833a16bc29aff1e0410995b'
         '7b70a8121d1ae0bc9dabc803589b89d0'
         'cbfba3010acd61c93ac6ca2b18de6c23'
         '433df5f08b933040bf81684f45006f09'
         'cf7e544dd2eba58ebef78131706749e4'
         'b611bef1267193d056f8e0b3eae3a63d'
         '793750d284f06285ea317128abcc398c'
         '5ffc4e10ee120975540a7b3bff916d56')

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make GITTAG=''
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install-lib install-i18n

  install -Dm755 iptv/vlc2iptv "$pkgdir/usr/share/vdr/plugins/iptv/vlc2iptv"

  mkdir -p "$pkgdir/etc/vdr/plugins/iptv/vlcinput"
  cp "$srcdir"/*.conf "$pkgdir/etc/vdr/plugins/iptv/vlcinput"
  rm "$pkgdir/etc/vdr/plugins/iptv/vlcinput/50-iptv.conf"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
