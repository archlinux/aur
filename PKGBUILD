# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-kde-bin
pkgver=56.2.3
pkgrel=2
pkgdesc="Free, open and private browser with openSUSE's patches for better integration with KDE"
arch=('x86_64')
url="https://www.waterfoxproject.org/"
license=('MPL')
depends=('libxt' 'mime-types' 'dbus-glib' 'hunspell' 'gtk2' 'gtk3' 'nss' 'kwaterfoxhelper')
makedepends=('wget')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'speech-dispatcher: Text-to-Speech'
            'pulseaudio: Audio support'
            'alsa-lib: Audio support')
provides=("waterfox=$pkgver")
conflicts=('waterfox')
options=('!emptydirs' '!strip')
install=$pkgname.install
source=("waterfox-kde_${pkgver}-${pkgrel}_amd64.deb::https://dl.bintray.com/hawkeye116477/waterfox-deb/pool/w/waterfox/waterfox-kde_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('f24f55b3d01b59a06a8ff7008ddebde654443923388f135e878d9309db94ddde')

package() {
# Extract Waterfox from .deb package
msg2 "Extracting the data.tar.xz..."
bsdtar -xf data.tar.xz -C "$pkgdir/"

# Settings file for language packs
_settings=/opt/waterfox/.installer/settings

if [ -f "$_settings" ]; then
echo "Previous settings detected! Do you wish to load them?"
select yn in "Yes" "No"; do
                case $yn in
                    Yes )
    if grep -q download_language=yes "$_settings"; then
    _chosen_language=$(grep -Po 'chosen_language=\K[^ ]+' $_settings)
    wget -O $srcdir/waterfox-locale-${_chosen_language}_${pkgver}_amd64.deb https://dl.bintray.com/hawkeye116477/waterfox-deb/pool/w/waterfox/waterfox-locale-${_chosen_language}_${pkgver}_amd64.deb;
	msg2 "Extracting locale..."
    bsdtar -xf $srcdir/waterfox-locale-${_chosen_language}_${pkgver}_amd64.deb
    bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"
    fi
    mkdir $pkgdir/opt/waterfox/.installer/
    cp $_settings $pkgdir/opt/waterfox/.installer/
                break;;
No )
echo "Root access is required to remove settings file!"
sudo rm -rvf /opt/waterfox/.installer/
break;;
                    esac
                done
fi

if [ ! -f "$_settings" ]; then
# Download and install language pack
echo "Do you wish to download and install language pack (if you want to have en-US - this is not needed)?"
            select yn in "Yes" "No"; do
                case $yn in
                    Yes )
_download_language=yes
echo -e "Available languages:
  (ach) Acholi; (af) Afrikaans; (an) Aragonese; (ar) Arabic; (as) Assamese;
  (ast) Asturian; (az) Azerbaijani; (bg) Bulgarian; (bn) Bengali; (br) Breton;
  (bs) Bosnian; (ca) Catalan; (cak) Maya Kaqchikel; (cs) Czech; (cy) Welsh;
  (da) Danish; (de) German; (dsb) Lower Sorbian; (el) Greek; (en) English;
  (eo) Esperanto; (es) Spanish; (et) Estonian; (eu) Basque; (fa) Persian;
  (ff) Fulah; (fi) Finnish; (fr) French; (fy) Western Frisian; (ga) Irish - Ireland;
  (gd) Gaelic - Scotland; (gl) Galician; (gn) Guarani; (gu) Gujarati - India;
  (he) Hebrew; (hi) Hindi - India; (hr) Croatian; (hsb) Upper Sorbian; (hu) Hungarian;
  (hy) Armenian - Armenia; (id) Indonesian; (is) Icelandic; (it) Italian;
  (ja) Japanese; (kk) Kazakh; (km) Khmer; (kn) Kannada; (ko) Korean;
  (lij) Ligurian; (lt) Lithuanian; (lv) Latvian; (mai) Maithili;
  (mk) Macedonian; (ml) Malayalam; (mr) Marathi; (ms) Malay; (nb) Norwegian - Bokmål;
  (nl) Dutch; (nn) Norwegian - Nynorsk; (or) Oriya; (pa) Punjabi - India;
  (pl) Polish; (pt) Portuguese; (rm) Romansh; (ro) Romanian; (ru) Russian;
  (si) Sinhala; (sk) Slovak; (sl) Slovenian; (son) Songhai; (sq) Albanian;
  (sr) Serbian; (sv) Swedish; (ta) Tamil; (te) Telugu; (th) Thai;
  (tr) Turkish; (uk) Ukrainian; (uz) Uzbek; (vi) Vietnamese;
  (xh) Xhosa; (zh-hans) Simplified Chinese; (zh-hant) Traditional Chinese
"
printf "Type language code of language you wish to download and install
(language code is acronym that is inside the parentheses () before your language,
for example - for Polish, type pl): "
read _chosen_language

    wget -O $srcdir/waterfox-locale-${_chosen_language}_${pkgver}_amd64.deb https://dl.bintray.com/hawkeye116477/waterfox-deb/pool/w/waterfox/waterfox-locale-${_chosen_language}_${pkgver}_amd64.deb;
	msg2 "Extracting locale..."
    bsdtar -xf $srcdir/waterfox-locale-${_chosen_language}_${pkgver}_amd64.deb
    bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"
                    break;;
                    No )
                    _download_language=no
                    _chosen_language=en-US
                    break;;
                    esac
                done

echo "Do you wish to save your choice (thanks to this, you don't have to select language again when reinstalling/updating)?"
            select yn in "Yes" "No"; do
                case $yn in
                    Yes )
mkdir $pkgdir/opt/waterfox/.installer/
tee -a $pkgdir/opt/waterfox/.installer/settings <<EOF
download_language=$_download_language
chosen_language=$_chosen_language
EOF
break;;
No ) break;;
                    esac
                done
fi

}
