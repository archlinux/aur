# Maintainer: BrLi <brli@chakralinux.org>
# Contributor: Kyriakos Brastianos <kyriakosbrastianos @ gmail.com>
# Contributor: danyf90 <daniele.formichelli@gmail.com>

_pkgname=firefox
_channel=nightly
_lang=zh-TW
_pkgver=76.0a1

pkgname=${_pkgname}-${_channel}-${_lang/TW/tw}
pkgver=76.0a1.20200319215651
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

source=("${_srcurl}-l10n/${_file}-x86_64.tar.bz2"{,.asc})
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')
sha512sums=("${_srcsum}"
            'SKIP')

pkgver() {
  printf "%s.%s" $_pkgver $(curl -s $_srcurl/firefox-${_pkgver}.en-US.linux-${CARCH}.txt | head -n1)
}

package() {
  cd $srcdir
 
  install -d $pkgdir/{opt,usr/{bin,share/applications}}
  cp -r firefox $pkgdir/opt/firefox-nightly
  ln -s /opt/firefox-nightly/firefox $pkgdir/usr/bin/firefox-nightly
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${_pkgname}-${_channel}.desktop" << END
[Desktop Entry]
Name=Firefox Nightly
GenericName=Web Browser
Icon=${_pkgname}-${_channel}
Type=Application
Categories=Application;Network;
MimeType=text/html
Encoding=UTF-8
Exec=${_pkgname}-${_channel} %u
Terminal=false
MultipleArgs=false
StartupNotify=false
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${_pkgname}-${_channel}-safe.desktop" << END
[Desktop Entry]
Name=Firefox Nightly - Safe Mode
GenericName=Web Browser - Safe Mode
Icon=${_pkgname}-${_channel}
Type=Application
Categories=Application;Network;
MimeType=text/html
Encoding=UTF-8
Exec=${_pkgname}-${_channel} -safe-mode %u
Terminal=false
MultipleArgs=false
StartupNotify=false
END

  for size in 16 32 48 128; do
    install -Dm644 $srcdir/firefox/browser/chrome/icons/default/default${size}.png $pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}-${_channel}.png
  done

  
  _vendorjs="$pkgdir/opt/firefox-nightly/browser/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
pref("browser.shell.checkDefaultBrowser", false);
pref("browser.tabs.drawInTitlebar", true);
END

}
