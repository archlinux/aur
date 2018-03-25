# Maintainer: Please see AUR package page for current maintainer(s) and contact information.

pkgname=brave-snapshot-bin
pkgver=0.22.7
_pkgver=$pkgver
pkgrel=2
pkgdesc="A web browser that stops ads and trackers by default. Binary snapshot."
arch=('x86_64') # Upstream supports x86_64 only
url="https://www.brave.com/"
license=('custom:several')
depends=('gtk3' 'gconf' 'nss' 'alsa-lib' 'libxss' 'libgnome-keyring' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support')
provides=('brave' 'brave-browser')
conflicts=('brave' 'brave-bin')
source=("$pkgname-$_pkgver".tar.bz2::https://github.com/brave/browser-laptop/releases/download/v0.22.7beta/Brave-Beta.tar.bz2
        "MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt")
options=(!strip)
sha512sums=('f0ae6872ff681c03b8cfef8818f514267494faa6a47bb61ad220c6f89ccc6cc152fe4d170f79e8850a27fe9c7e8814f9dcd1fda752630fa421e867dff1e05a49'
            'b8823586fead21247c8208bd842fb5cd32d4cb3ca2a02339ce2baf2c9cb938dfcb8eb7b24c95225ae625cd0ee59fbbd8293393f3ed1a4b45d13ba3f9f62a791f')
_bdir=brave-beta-linux-x64

build() {
	if [[ ! (-r /proc/sys/kernel/unprivileged_userns_clone && $(< /proc/sys/kernel/unprivileged_userns_clone) == 1 && -n $(zcat /proc/config.gz | grep CONFIG_USER_NS=y) ) ]]; then
		echo "User namespaces are not detected as enabled on your system, brave will run with the sandbox disabled"
	fi
}

package() {
  cd "$srcdir"

  install -d -m0755 "$pkgdir"/usr/lib

  cp -a --reflink=auto $_bdir "$pkgdir/usr/lib/$pkgname"

  _launcher="$pkgdir/usr/bin/brave"
  install -Dm0755 /dev/stdin "$_launcher"<<END
#!/usr/bin/sh

FLAG="--no-sandbox"

if [[ -r /proc/sys/kernel/unprivileged_userns_clone && \$(< /proc/sys/kernel/unprivileged_userns_clone) == 1 && -n \$(zcat /proc/config.gz | grep CONFIG_USER_NS=y) ]]; then
	FLAG=""
fi

exec /usr/lib/$pkgname/brave-beta "\$FLAG" -- "\$@"
END

  _deskfile="$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm0644 /dev/stdin "$_deskfile"<<END
[Desktop Entry]
Version=1.0
Name=Brave
# Only KDE 4 seems to use GenericName, so we reuse the KDE strings.
# From Ubuntu's language-pack-kde-XX-base packages, version 9.04-20090413.
GenericName=Web Browser
GenericName[ar]=متصفح الشبكة
GenericName[bg]=Уеб браузър
GenericName[ca]=Navegador web
GenericName[cs]=WWW prohlížeč
GenericName[da]=Browser
GenericName[de]=Web-Browser
GenericName[el]=Περιηγητής ιστού
GenericName[en_GB]=Web Browser
GenericName[es]=Navegador web
GenericName[et]=Veebibrauser
GenericName[fi]=WWW-selain
GenericName[fr]=Navigateur Web
GenericName[gu]=વેબ બ્રાઉઝર
GenericName[he]=דפדפן אינטרנט
GenericName[hi]=वेब ब्राउज़र
GenericName[hu]=Webböngésző
GenericName[it]=Browser Web
GenericName[ja]=ウェブブラウザ
GenericName[kn]=ಜಾಲ ವೀಕ್ಷಕ
GenericName[ko]=웹 브라우저
GenericName[lt]=Žiniatinklio naršyklė
GenericName[lv]=Tīmekļa pārlūks
GenericName[ml]=വെബ് ബ്രൌസര്‍
GenericName[mr]=वेब ब्राऊजर
GenericName[nb]=Nettleser
GenericName[nl]=Webbrowser
GenericName[pl]=Przeglądarka WWW
GenericName[pt]=Navegador Web
GenericName[pt_BR]=Navegador da Internet
GenericName[ro]=Navigator de Internet
GenericName[ru]=Веб-браузер
GenericName[sl]=Spletni brskalnik
GenericName[sv]=Webbläsare
GenericName[ta]=இணைய உலாவி
GenericName[th]=เว็บเบราว์เซอร์
GenericName[tr]=Web Tarayıcı
GenericName[uk]=Навігатор Тенет
GenericName[zh_CN]=网页浏览器
GenericName[zh_HK]=網頁瀏覽器
GenericName[zh_TW]=網頁瀏覽器
# Not translated in KDE, from Epiphany 2.26.1-0ubuntu1.
GenericName[bn]=ওয়েব ব্রাউজার
GenericName[fil]=Web Browser
GenericName[hr]=Web preglednik
GenericName[id]=Browser Web
GenericName[or]=ଓ୍ବେବ ବ୍ରାଉଜର
GenericName[sk]=WWW prehliadač
GenericName[sr]=Интернет прегледник
GenericName[te]=మహాతల అన్వేషి
GenericName[vi]=Bộ duyệt Web
# Gnome and KDE 3 uses Comment.
Comment=Access the Internet
Comment[ar]=الدخول إلى الإنترنت
Comment[bg]=Достъп до интернет
Comment[bn]=ইন্টারনেটটি অ্যাক্সেস করুন
Comment[ca]=Accedeix a Internet
Comment[cs]=Přístup k internetu
Comment[da]=Få adgang til internettet
Comment[de]=Internetzugriff
Comment[el]=Πρόσβαση στο Διαδίκτυο
Comment[en_GB]=Access the Internet
Comment[es]=Accede a Internet.
Comment[et]=Pääs Internetti
Comment[fi]=Käytä internetiä
Comment[fil]=I-access ang Internet
Comment[fr]=Accéder à Internet
Comment[gu]=ઇંટરનેટ ઍક્સેસ કરો
Comment[he]=גישה אל האינטרנט
Comment[hi]=इंटरनेट तक पहुंच स्थापित करें
Comment[hr]=Pristup Internetu
Comment[hu]=Internetelérés
Comment[id]=Akses Internet
Comment[it]=Accesso a Internet
Comment[ja]=インターネットにアクセス
Comment[kn]=ಇಂಟರ್ನೆಟ್ ಅನ್ನು ಪ್ರವೇಶಿಸಿ
Comment[ko]=인터넷 연결
Comment[lt]=Interneto prieiga
Comment[lv]=Piekļūt internetam
Comment[ml]=ഇന്റര്‍‌നെറ്റ് ആക്‌സസ് ചെയ്യുക
Comment[mr]=इंटरनेटमध्ये प्रवेश करा
Comment[nb]=Gå til Internett
Comment[nl]=Verbinding maken met internet
Comment[or]=ଇଣ୍ଟର୍ନେଟ୍ ପ୍ରବେଶ କରନ୍ତୁ
Comment[pl]=Skorzystaj z internetu
Comment[pt]=Aceder à Internet
Comment[pt_BR]=Acessar a internet
Comment[ro]=Accesaţi Internetul
Comment[ru]=Доступ в Интернет
Comment[sk]=Prístup do siete Internet
Comment[sl]=Dostop do interneta
Comment[sr]=Приступите Интернету
Comment[sv]=Gå ut på Internet
Comment[ta]=இணையத்தை அணுகுதல்
Comment[te]=ఇంటర్నెట్‌ను ఆక్సెస్ చెయ్యండి
Comment[th]=เข้าถึงอินเทอร์เน็ต
Comment[tr]=İnternet'e erişin
Comment[uk]=Доступ до Інтернету
Comment[vi]=Truy cập Internet
Comment[zh_CN]=访问互联网
Comment[zh_HK]=連線到網際網路
Comment[zh_TW]=連線到網際網路
StartupNotify=true
StartupWMClass=brave
TryExec=brave
Exec=brave %U
Terminal=false
Icon=brave
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
END

  install -Dm0644 "$srcdir"/$_bdir/resources/extensions/brave/img/braveAbout.png "$pkgdir"/usr/share/pixmaps/brave.png

  install -Dm0664 "$srcdir"/MPL2 "$pkgdir/usr/share/licenses/$pkgname/MPL2"

  mv "$pkgdir"/usr/lib/"$pkgname"/{LICENSE,LICENSES.chromium.html} "$pkgdir/usr/share/licenses/$pkgname/"

  ln -s /usr/lib/PepperFlash "$pkgdir"/usr/lib/pepperflashplugin-nonfree
}
