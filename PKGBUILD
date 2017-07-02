# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=cyberfox-kde-bin
pkgver=52.2.1
pkgrel=1
pkgdesc="Fast, stable & reliable x64-bit web browser with openSUSE's patches for better integration with KDE"
arch=('x86_64')
url="https://cyberfox.8pecxstudios.com/"
license=('MPL')
depends=('alsa-lib' 'libxt' 'mime-types' 'dbus-glib' 'hunspell' 'gtk2' 'gtk3' 'nss' 'kcyberfoxhelper' 'wget')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'speech-dispatcher: Text-to-Speech')
provides=("cyberfox=$pkgver")
conflicts=('cyberfox')
options=('!emptydirs' '!strip')
install=$pkgname.install

source=("cyberfox-kde_${pkgver}_amd64.deb::https://hawkeye116477.github.io/cyberfox-deb/pool/main/c/cyberfox-kde/cyberfox-kde_${pkgver}_amd64.deb")


package() {
# Extract Cyberfox from .deb package
msg2 "Extracting Cyberfox..."
bsdtar -xf data.tar.xz -C "$pkgdir/"

# Use system-provided dictionaries. Hunspell symlink is in deb.
msg2 "Creating symlink to hyphen..."
ln -Ts /usr/share/hyphen "$pkgdir/opt/cyberfox/hyphenation"

_settings=/opt/cyberfox/.installer/settings

if [ -f "$_settings" ]; then
echo "Previous settings detected! Do you wish to load them?"
select yn in "Yes" "No"; do
                case $yn in
                    Yes )
    if grep -q download_language=yes "$_settings"; then
    _chosen_language=$(grep -Po 'chosen_language=\K[^ ]+' $_settings)
    wget -O $srcdir/cyberfox-locale-${_chosen_language}_${pkgver}_amd64.deb https://hawkeye116477.github.io/cyberfox-deb/pool/main/c/cyberfox/cyberfox-locale-${_chosen_language}_${pkgver}_amd64.deb;
	msg2 "Extracting locale..."
    bsdtar -xf $srcdir/cyberfox-locale-${_chosen_language}_${pkgver}_amd64.deb
    bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"
    fi
    

    if grep -q download_CyberCTR=yes "$_settings"; then
    wget "https://hawkeye116477.github.io/cyberfox-deb/pool/main/c/cyberfox/cyberfox-ext-cyberctr_${pkgver}_amd64.deb";
    msg2 "Extracting CyberCTR..."
    bsdtar -xf $srcdir/cyberfox-ext-cyberctr_${pkgver}_amd64.deb
    bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"
    fi
    
    if grep -q download_Pocket=yes "$_settings"; then
    wget "https://hawkeye116477.github.io/cyberfox-deb/pool/main/c/cyberfox/cyberfox-ext-pocket_${pkgver}_amd64.deb";
    msg2 "Extracting Pocket..."
    bsdtar -xf $srcdir/cyberfox-ext-pocket_${pkgver}_amd64.deb
    bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"
    fi
    
    mkdir $pkgdir/opt/cyberfox/.installer/
    cp $_settings $pkgdir/opt/cyberfox/.installer/
                break;;
No )
echo "Root access is required to remove settings file!"
sudo rm -rvf /opt/cyberfox/.installer/
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
    wget -O $srcdir/cyberfox-locale-${_chosen_language}_${pkgver}_amd64.deb https://hawkeye116477.github.io/cyberfox-deb/pool/main/c/cyberfox/cyberfox-locale-${_chosen_language}_${pkgver}_amd64.deb;
	msg2 "Extracting locale..."
    bsdtar -xf $srcdir/cyberfox-locale-${_chosen_language}_${pkgver}_amd64.deb
    bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"
                    break;;
                    No ) 
                     _download_language=no
                    _chosen_language=en-US
                    break;;
                    esac
                done

# Download and install CyberCTR and Pocket
echo "Do you wish to download and install CyberCTR?"
            select yn in "Yes" "No"; do
                case $yn in
                    Yes )
_download_CyberCTR=yes
wget "https://hawkeye116477.github.io/cyberfox-deb/pool/main/c/cyberfox/cyberfox-ext-cyberctr_${pkgver}_amd64.deb";
msg2 "Extracting CyberCTR..."
bsdtar -xf $srcdir/cyberfox-ext-cyberctr_${pkgver}_amd64.deb
bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"
                    break;;
                    No ) 
                    _download_CyberCTR=no
                    break;;
                    esac
                done

echo "Do you wish to download and install Pocket?"
            select yn in "Yes" "No"; do
                case $yn in
                    Yes )
_download_Pocket=yes
wget "https://hawkeye116477.github.io/cyberfox-deb/pool/main/c/cyberfox/cyberfox-ext-pocket_${pkgver}_amd64.deb";
msg2 "Extracting Pocket..."
bsdtar -xf $srcdir/cyberfox-ext-pocket_${pkgver}_amd64.deb
bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"
                    break;;
                    No ) 
                    _download_Pocket=no
                    break;;
                    esac
                done

echo -e "Do you wish to save your choices? Thanks to this, you won't have to select language, 
choose to install CyberCTR (or not) and Pocket (or not) again when reinstalling/updating."
            select yn in "Yes" "No"; do
                case $yn in
                    Yes )
mkdir $pkgdir/opt/cyberfox/.installer/
tee -a $pkgdir/opt/cyberfox/.installer/settings <<EOF
download_language=$_download_language
chosen_language=$_chosen_language
download_CyberCTR=$_download_CyberCTR
download_Pocket=$_download_Pocket
EOF
break;;
No ) break;;
                    esac
                done
fi
}
sha256sums=('b76e1dfcb484b90a8e89b5a77317f3c669b1b53b164543fb6f4c3d5b58b69720')
