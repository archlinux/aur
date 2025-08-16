# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-epgsearch
pkgver=2.4.4
pkgrel=1
_vdrapi=9
epoch=1
pkgdesc="Searchtimer and replacement of the VDR program menu"
url="https://github.com/vdr-projects/vdr-plugin-epgsearch"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
optdepends=('msmtp: To send notification mails (Simpler replacement for sendmail)'
            'ssmtp: To send notification mails (Another simpler replacement for sendmail)')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-epgsearch/archive/refs/tags/v$pkgver.tar.gz"
        "50-$_plugname.conf"
        "calcstartstoptime.patch::https://github.com/vdr-projects/vdr-plugin-epgsearch/commit/76a2ac491493fc79817b7ae35d531da751ffe211.patch")
backup=("etc/vdr/conf.avail/50-conflictcheckonly.conf"
        "etc/vdr/conf.avail/50-$_plugname.conf"
        "etc/vdr/conf.avail/50-${_plugname}only.conf"
        "etc/vdr/conf.avail/50-quick$_plugname.conf"
        'var/lib/vdr/plugins/epgsearch/epgsearchcats.conf-epgdata'
        'var/lib/vdr/plugins/epgsearch/epgsearchcats.conf-tvm2vdr-hoerzu'
        'var/lib/vdr/plugins/epgsearch/epgsearchcats.conf-tvm2vdr-tvmovie'
        'var/lib/vdr/plugins/epgsearch/epgsearchconflmail.templ'
        'var/lib/vdr/plugins/epgsearch/epgsearchmenu.conf'
        'var/lib/vdr/plugins/epgsearch/epgsearchupdmail-html.templ'
        'var/lib/vdr/plugins/epgsearch/epgsearchupdmail.templ')
options=('!emptydirs')
sha256sums=('e64b4ce3ac706d5cb080e060b6e1a2815785819695d20d3fd05d31d0ee7dad7f'
            'f3f8c750a0313c01a4295d2249f030ee510b2e35137b1f2cdcaa39aa440a3a88'
            'cfe5b953610bd085234edbfa3730c563df18ae723140e5b8c8aa05a7e19bc8ce')

prepare() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  sed -i 's/^Menu/# Menu/g' conf/epgsearchmenu.conf

  # Replace Matches(time,true) with CalcStartStopTime()
  patch -Np1 -i "${srcdir}/calcstartstoptime.patch"
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make REGEXLIB='' #Empty REGEXLIB to force regex.h from glibc
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
  echo "[${_plugname}only]" > "$pkgdir/etc/vdr/conf.avail/50-${_plugname}only.conf"
  echo "[conflictcheckonly]" > "$pkgdir/etc/vdr/conf.avail/50-conflictcheckonly.conf"
  echo "[quick${_plugname}]" > "$pkgdir/etc/vdr/conf.avail/50-quick${_plugname}.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
