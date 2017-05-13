# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=cyberfox-kde-bin
pkgver=52.1.2
pkgrel=4
pkgdesc="
'KDE Plasma Edition' of the fast, stable & reliable x64-bit web browser. It contains KDE patches, which contains KDE file dialogs, file associations, protocol handlers and other KDE Plasma integration features."
arch=('x86_64')
url="https://cyberfox.8pecxstudios.com/"
license=('MPL' 'GPL')
depends=('alsa-lib' 'libxt' 'mime-types' 'dbus-glib' 'hunspell' 'gtk2' 'gtk3' 'nss' 'kcyberfoxhelper')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'speech-dispatcher: Text-to-Speech')
conflicts=('cyberfox')
options=('!emptydirs' '!strip')
install=$pkgname.install

source=("cyberfox-kde_${pkgver}_amd64.deb::https://hawkeye116477.github.io/cyberfox-deb/pool/main/c/cyberfox-kde/cyberfox-kde_${pkgver}_amd64.deb")


package() {
msg2 "Extracting Cyberfox..."
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
if [ "$chosenlang" == "pl" ]; then
	printf "\nWITAJCIE RODACY :)\n";
	wget -O $srcdir/cyberfox-locale-${chosenlang}_${pkgver}_amd64.deb https://hawkeye116477.github.io/cyberfox-deb/pool/main/c/cyberfox/cyberfox-locale-${chosenlang}_${pkgver}_amd64.deb;
	msg2 "Extracting locale..."
    bsdtar -xf $srcdir/cyberfox-locale-${chosenlang}_${pkgver}_amd64.deb
    bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"
else
    wget -O $srcdir/cyberfox-locale-${chosenlang}_${pkgver}_amd64.deb https://hawkeye116477.github.io/cyberfox-deb/pool/main/c/cyberfox/cyberfox-locale-${chosenlang}_${pkgver}_amd64.deb;
	msg2 "Extracting locale..."
    bsdtar -xf $srcdir/cyberfox-locale-${chosenlang}_${pkgver}_amd64.deb
    bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"
fi;
                    break;;
                    No ) break;;
                    esac
                done
# Download and install CyberCTR and Pocket
echo "Do you wish to download and install CyberCTR?"
            select yn in "Yes" "No"; do
                case $yn in
                    Yes )
wget "https://hawkeye116477.github.io/cyberfox-deb/pool/main/c/cyberfox/cyberfox-ext-cyberctr_${pkgver}_amd64.deb";
msg2 "Extracting CyberCTR..."
bsdtar -xf $srcdir/cyberfox-ext-cyberctr_${pkgver}_amd64.deb
bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"
                    break;;
                    No ) break;;
                    esac
                done

echo "Do you wish to download and install Pocket?"
            select yn in "Yes" "No"; do
                case $yn in
                    Yes )
wget "https://hawkeye116477.github.io/cyberfox-deb/pool/main/c/cyberfox/cyberfox-ext-pocket_${pkgver}_amd64.deb";
msg2 "Extracting Pocket..."
bsdtar -xf $srcdir/cyberfox-ext-pocket_${pkgver}_amd64.deb
bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"
                    break;;
                    No ) break;;
                    esac
                done

  
  # Use system-provided dictionaries. Hunspell symlink is in deb.
  msg2 "Creating symlink to hyphen..."
  ln -Ts /usr/share/hyphen "$pkgdir/opt/cyberfox/hyphenation"
}
sha256sums=('6944f99ec1543c1f27f58b68278a81fbfe21e718d3f9d8ebfbefe0ca56476848')
