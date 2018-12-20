# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-kde-bin
pkgver=56.2.6
pkgrel=1
pkgdesc="Free, open and private browser with openSUSE's patches for better integration with KDE"
arch=('x86_64')
url="https://www.waterfoxproject.org/"
license=('MPL')
depends=('gtk3' 'gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'hunspell' 'ttf-font' 'hicolor-icon-theme' 'kwaterfoxhelper')
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
source=("waterfox-kde-${pkgver}-0-x86_64.pkg.tar.xz::https://download.opensuse.org/repositories/home:/hawkeye116477:/waterfox/Arch/x86_64/waterfox-kde-${pkgver}-0-x86_64.pkg.tar.xz")
sha256sums=('82316366bc4f03c64d8b8ec702810277046d7161cb8613dbf6a7aceb62a9c1bc')

package() {
mv $srcdir/usr/ $pkgdir/usr/
# Settings file for language packs
_settings=/usr/lib/waterfox/.installer/settings

if [ -f "$_settings" ]; then
echo "Previous settings detected! Do you wish to load them?"
select yn in "Yes" "No"; do
                case $yn in
                    Yes )
    if grep -q download_language=yes "$_settings"; then
    _chosen_language=$(grep -Po 'chosen_language=\K[^ ]+' $_settings)
    wget -O $srcdir/waterfox-i18n-${_chosen_language}-${pkgver}-0-x86_64.pkg.tar.xz https://download.opensuse.org/repositories/home:/hawkeye116477:/waterfox/Arch/x86_64/waterfox-i18n-${_chosen_language}-${pkgver}-0-x86_64.pkg.tar.xz;
	msg2 "Extracting locale..."
    bsdtar -xf $srcdir/waterfox-i18n-${_chosen_language}-${pkgver}-0-x86_64.pkg.tar.xz -C "$pkgdir/"
    rm $pkgdir/.BUILDINFO
    rm $pkgdir/.MTREE
    rm $pkgdir/.PKGINFO
    fi
    mkdir $pkgdir/usr/lib/waterfox/.installer/
    cp $_settings $pkgdir/usr/lib/waterfox/.installer/
                break;;
No )
echo "Root access is required to remove settings file!"
sudo rm -rvf /usr/lib/waterfox/.installer/
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
  (ast) Asturian; (az) Azerbaijani; (bg) Bulgarian; (bn-bd) Bengali - Bangladesh;
  (bn-in) Bengali - India; (br) Breton; bs) Bosnian; (ca) Catalan;
  (cak) Maya Kaqchikel; (cs) Czech; (cy) Welsh; (da) Danish; (de) German;
  (dsb) Lower Sorbian; (el) Greek; (en-gb) English - British;
  (en-za) English - South African; (eo) Esperanto; (es-ar) Spanish - Argentina;
  (es-cl) Spanish - Chile; (es-es) Spanish - Spain; (es-mx) Spanish
  (et) Estonian; (eu) Basque; (fa) Persian; (ff) Fulah; (fi) Finnish;
  (fr) French; (fy-nl) Frisian; (ga-ie) Irish; (gd) Gaelic - Scotland;
  (gl) Galician; (gn) Guarani; (gu-in) Gujarati - India; (he) Hebrew;
  (hi-in) Hindi - India; (hr) Croatian; (hsb) Upper Sorbian; (hu) Hungarian;
  (hy-am) Armenian; (id) Indonesian; (is) Icelandic; (it) Italian;
  (ja) Japanese; (ka) Georgian; (kab) Kabyle; (kk) Kazakh; (km) Khmer;
  (kn) Kannada; (ko) Korean; (lij) Ligurian; (lt) Lithuanian; (lv) Latvian;
  (mai) Maithili; (mk) Macedonian; (ml) Malayalam; (mr) Marathi; (ms) Malay;
  (nb-no) Norwegian - Bokmål; (nl) Dutch; (nn-no) Norwegian - Nynorsk; (or) Oriya;
  (pa-in) Punjabi - India; (pl) Polish; (pt-br) Portuguese - Brazilian;
  (pt-pt) Portuguese - Portugal; (rm) Romansh; (ro) Romanian; (ru) Russian;
  (si) Sinhala; (sk) Slovak; (sl) Slovenian; (son) Songhai; (sq) Albanian;
  (sr) Serbian; (sv-se) Swedish; (ta) Tamil; (te) Telugu; (th) Thai;
  (tr) Turkish; (uk) Ukrainian; (uz) Uzbek; (vi) Vietnamese;
  (xh) Xhosa; (zh-cn) Simplified Chinese; (zh-tw) Traditional Chinese
"
printf "Type language code of language you wish to download and install
(language code is acronym that is inside the parentheses () before your language,
for example - for Polish, type pl): "
read _chosen_language

    wget -O $srcdir/waterfox-i18n-${_chosen_language}-${pkgver}-0-x86_64.pkg.tar.xz https://download.opensuse.org/repositories/home:/hawkeye116477:/waterfox/Arch/x86_64/waterfox-i18n-${_chosen_language}-${pkgver}-0-x86_64.pkg.tar.xz;
	msg2 "Extracting locale..."
    bsdtar -xf $srcdir/waterfox-i18n-${_chosen_language}-${pkgver}-0-x86_64.pkg.tar.xz -C "$pkgdir/"
    rm $pkgdir/.BUILDINFO
    rm $pkgdir/.MTREE
    rm $pkgdir/.PKGINFO
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
mkdir $pkgdir/usr/lib/waterfox/.installer/
tee -a $pkgdir/usr/lib/waterfox/.installer/settings <<EOF
download_language=$_download_language
chosen_language=$_chosen_language
EOF
break;;
No ) break;;
                    esac
                done
fi

}
