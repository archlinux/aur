# Maintainer: Matt Parnell/ilikenwf <parwok@gmail.com>
# based on chromium-snapshot-bin by det
# Contributors: Ner0, alexwizard, thotypous, jdhore, xduugu, randypenguin, bdheeman, AlK

pkgname=ungoogled-chromium
pkgver=55.0.2883.95
pkgrel=1
pkgdesc="The open-source project behind Google Chrome (Latest Snapshot)"
arch=('x86_64')
url="https://github.com/Eloston/ungoogled-chromium"
license=('BSD')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent' 'libxss' 'icu'
         'libexif' 'libgcrypt' 'ttf-font' 'systemd' 'dbus' 'flac' 'snappy'
         'pciutils' 'libpulse' 'harfbuzz' 'libsecret'
         'perl' 'perl-file-basedir' 'desktop-file-utils' 'hicolor-icon-theme'
         'gconf')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kdeutils-kwalletmanager: for storing passwords in KWallet'
            'pepper-flash: for Pepper Flash plugin [AUR]')
makedepends=('python3' 'python2' 'gperf' 'yasm' 'mesa' 'ninja' 'git')
provides=('chromium')
install=$pkgname.install
source=("git://github.com/Eloston/ungoogled-chromium"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname"_{16,22,24,32,48,64,128,256}.png)
md5sums=('SKIP'
         '374877078f924e08afe93b30d0daea09'
         '39910905d8966edff40ca6be7535fdce'
         '6cd41f6e08eee03c6553603fb0b6ecd7'
         '227eac16d1e737bed42742840b950d41'
         '308eb2e0c509e12ecf33165ced9eef0d'
         'e9944fe09afc8495a2fbf70db810a219'
         '17856a060d1fc003447cb7a3f414be7d'
         'f2325d8de3d217471f029e8b59a712e3'
         '811f5de21b882cdb49618de549e017ca'
         'c6cf982d5ebece0b9cd64f065acd384a')

# don't compress the package - we're just going to uncompress during install in a moment
PKGEXT='.pkg.tar'

pkgver() {
	cd "${srcdir}/${pkgname}"
	
	echo $(grep -oPm1 '([0-9]+\.?)+' version.ini)
	pkgrel=$(grep -oP '\=\ [0-9]$' version.ini|sed -e 's/\=\ //g')
}

build() {
	cd "${srcdir}/${pkgname}"
	
	msg "Building...this will take a while..."
	/usr/bin/python build.py
	
	msg "Extracting built tarball to properly package..."
	tar xvf "${srcdir}/${pkgname}/build/${pkgname}_${pkgver}-${pkgrel}_linux_defaultcpu.tar.xz -C ${srcdir}"
}

package() {
	msg2 "Creating directory structure..."
	install -d "$pkgdir"/opt/
	install -d "$pkgdir"/usr/bin/
	install -d "$pkgdir"/usr/share/applications/
	install -d "$pkgdir"/usr/share/licenses/${pkgname}/

	msg2 "Moving contents..."
	# Main script
	install -m755 "${srcdir}/$pkgname.sh" "${pkgdir}/usr/bin/$pkgname"

	# Desktop
	install -m644 "${srcdir}/$pkgname.desktop" "$pkgdir/usr/share/applications/"

	# Icons
	for i in 16 22 24 32 48 64 128 256; do
		install -Dm644 ${pkgname}_${i}.png "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png
	done

	cd "${pkgname}_${pkgver}-${pkgrel}"
	rm *.png &> /dev/null

	# Man page
	gzip -9 chrome.1
	install -m644 chrome.1.gz "$pkgdir"/usr/share/man/man1/$pkgname.1.gz
	rm chrome.1 chrome.1.gz

	cd "${srcdir}/${pkgname}"

	# License
	install -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

	msg2 "Installing main directory..."
	mv "${srcdir}/${pkgname}_${pkgver}-${pkgrel}" "$pkgdir/opt/${pkgname}"
}
