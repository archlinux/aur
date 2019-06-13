# Maintainer: BrLi <brli@chakralinux.org>
# Contributor: Kyriakos Brastianos <kyriakosbrastianos @ gmail.com>
# Contributor: danyf90 <daniele.formichelli@gmail.com>

_pkgname=firefox
_channel=nightly
_lang=zh-TW
_pkgver=69.0a1

pkgname=${_pkgname}-${_channel}-${_lang/TW/tw}
pkgver=69.0a1.20190613095633
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org, nightly build (zh-TW)'
url='https://www.mozilla.org/en-US/firefox/'
screenshot="http://people.mozilla.org/~shorlander/blog-images/australis-linux.png"
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'libxt' 'libnotify' 'mailcap' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')
provides=("firefox=$_pkgver" "${_pkgname}-${_channel}")
conflicts=("${_pkgname}-${_channel}")

_srcurl="https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central"
_file="${_pkgname}-${_pkgver}.${_lang}.linux"
_srcsum="$(curl -s "${_srcurl}-l10n/${_file}-x86_64.checksums" | grep "${_file}-x86_64.tar.bz2" | grep sha512 | cut -d " " -f1 | head -n1)" 

source=("${_srcurl}-l10n/${_file}-x86_64.tar.bz2"{,.asc}
        "${_pkgname}-${_channel}.desktop"
        "${_pkgname}-${_channel}-safe.desktop")
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')
sha512sums=("${_srcsum}"
            'SKIP'
            '8591fdea03adac7f2a52bc10631730a2bbc15e1d5f254768fb161176ad8fe1059f253bcb8fa17d8d63ca3c27f0580520c7ebfc4415ffd7061cc479b3a369d659'
            'dadbd2daaaf6470f62a4f847a9c9ef9e171eb7359113c47f9d31cf100475d48422aca6a236c9ee7a996971d867ed421c7079bd2b069aef12c6745663092b1e38')

pkgver() {
  printf "%s.%s" $_pkgver $(curl -s $_srcurl/firefox-${_pkgver}.en-US.linux-${CARCH}.txt | head -n1)
}

package() {
  cd $srcdir
 
  install -d $pkgdir/{opt,usr/{bin,share/applications}}
  cp -r firefox $pkgdir/opt/firefox-nightly
  ln -s /opt/firefox-nightly/firefox $pkgdir/usr/bin/firefox-nightly
  install -Dm644 $srcdir/{${_pkgname}-${_channel}.desktop,${_pkgname}-${_channel}-safe.desktop} $pkgdir/usr/share/applications/
  for size in 16 32 48 128; do
    install -Dm644 $srcdir/firefox/browser/chrome/icons/default/default${size}.png $pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png
  done

  
  _vendorjs="$pkgdir/opt/firefox-nightly/browser/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
pref("browser.shell.checkDefaultBrowser", false);
pref("browser.tabs.drawInTitlebar", true);
END

}
