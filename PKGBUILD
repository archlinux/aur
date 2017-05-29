# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-kde-bin
pkgver=53.0.3
pkgrel=1
pkgdesc="
'KDE Plasma Edition' of the free, open and private browser. It contains KDE patches (which contains KDE file dialogs, file associations, protocol handlers and other KDE Plasma integration features) and other useful patches."
arch=('x86_64')
url="https://www.waterfoxproject.org/"
license=('MPL' 'GPL')
depends=('alsa-lib' 'libxt' 'mime-types' 'dbus-glib' 'hunspell' 'gtk2' 'gtk3' 'nss' 'kwaterfoxhelper')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'speech-dispatcher: Text-to-Speech')
conflicts=('waterfox-bin' 'waterfox-git')
options=('!emptydirs' '!strip')

source=("waterfox-kde_${pkgver}_amd64.deb::https://hawkeye116477.github.io/waterfox-deb/pool/main/w/waterfox-kde/waterfox-kde_${pkgver}_amd64.deb")


package() {
# Extract Waterfox from .deb package
msg2 "Extracting the data.tar.xz..."
bsdtar -xf data.tar.xz -C "$pkgdir/"

# Download and install language pack
echo "Do you wish to download and install language pack (if you want to have en-US this is not needed)?"
            select yn in "Yes" "No"; do
                case $yn in
                    Yes )
echo -e "Available languages:
  (ach) Acholi;	(af) Afrikaans;	(an) Aragonese;	(ar) Arabic;	(as) Assamese;	
  (ast) Asturian;	(az) Azerbaijani;	(bg) Bulgarian;	(bn) Bengali; 
  (br) Breton;	(bs) Bosnian;	(ca) Catalan;	(cak) Maya Kaqchikel;
  (cs) Czech;	(cy) Welsh;	(da) Danish;	(de) German;	(dsb) Lower Sorbian; (el) Greek;
  (en) English; (eo) Esperanto; (es) Spanish; (et) Estonian; (eu) Basque;
  (fa) Persian; (ff) Fulah; (fi) Finnish; (fr) French; (fy) Western Frisian; (ga) Irish (Ireland);
  (gd) Gaelic (Scotland); (gl) Galician; (gn) Guarani; (gu) Gujarati (India); 
  (he) Hebrew; (hi) Hindi (India); (hr) Croatian; (hsb) Upper Sorbian; (hu) Hungarian; 
  (hy) Armenian (Armenia); (id) Indonesian; (is) Icelandic; (it) Italian; (ja) Japanese; 
  (kk) Kazakh; (km) Khmer; (kn) Kannada; (ko) Korean; (lij) Ligurian; (lt) Lithuanian; 
  (lv) Latvian; (mai) Maithili; (mk) Macedonian; (ml) Malayalam; (mr) Marathi; (ms) Malay;
  (nb) Norwegian (Bokmål); (nl) Dutch; (nn) Norwegian (Nynorsk); (or) Oriya; 
  (pa) Punjabi (India); (pl) Polish; (pt) Portuguese; (rm) Romansh; (ro) Romanian; (ru) Russian; 
  (si) Sinhala; (sk) Slovak; (sl) Slovenian; (son) Songhai; (sq) Albanian; 
  (sr) Serbian; (sv) Swedish; (ta) Tamil; (te) Telugu; (th) Thai; 
  (tr) Turkish; (uk) Ukrainian; (uz) Uzbek; (vi) Vietnamese; (xh) Xhosa; 
  (zh-hans) Chinese (Simplified); (zh-hant) Chinese (Traditional)
"
printf "Type language code of language you wish to download and install (for example: en or pl): "
read chosenlang
    wget -O $srcdir/waterfox-locale-${chosenlang}_${pkgver}_amd64.deb https://hawkeye116477.github.io/waterfox-deb/pool/main/w/waterfox/waterfox-locale-${chosenlang}_${pkgver}_amd64.deb;
	msg2 "Extracting locale..."
    bsdtar -xf $srcdir/waterfox-locale-${chosenlang}_${pkgver}_amd64.deb
    bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"
                    break;;
                    No ) break;;
                    esac
                done

# Download and install Firejail profile for Waterfox
echo "Do you wish to download and install Firejail profile for Waterfox?"
            select yn in "Yes" "No"; do
                case $yn in
                    Yes )
wget "https://hawkeye116477.github.io/waterfox-deb/pool/main/w/waterfox/waterfox-firejail-profile_${pkgver}_amd64.deb";
msg2 "Extracting Firejail profile for Waterfox..."
bsdtar -xf $srcdir/waterfox-firejail-profile_${pkgver}_amd64.deb
bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"
                    break;;
                    No ) break;;
                    esac
                done

  # Use system-provided dictionaries. Hunspell symlink is in deb.
  msg2 "Creating symlink to hyphen..."
  ln -Ts /usr/share/hyphen "$pkgdir/opt/waterfox/hyphenation"
}
sha256sums=('cfd8d3e9e3e50b517a90637401b81b228026b44058dd03bcb9331741f0ae78c7')
