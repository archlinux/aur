# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
# Contributor: Bitts311 <oceanmail311@gmail.com>

pkgname=qogir-gtk-theme
_pkgname=Qogir-theme
_pkgver=2021-08-02
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Qogir is a flat Design theme for GTK"
arch=('any')
url="https://github.com/vinceliuice/Qogir-theme"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
optdepends=('kvantum-theme-qogir-git: Matching Kvantum theme'
            'qogir-icon-theme: Matching icon theme'
            'vimix-cursors: Matching cursor theme'
            'tela-icon-theme: Recommended icon theme'
            'sassc: used to compile sass files to css for theme installation')
backup=(etc/qogir-gtk-theme/options.txt)
conflicts=('qogir-gtk-themes-git')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/vinceliuice/$_pkgname/archive/$_pkgver.tar.gz"
	"options.txt"
)
sha256sums=('8eaa45957cc99088ba8ee566b074e9a12fbc74a7cbc4728bd9efc423839e5604'
            'd8d2c44bf9d91d7d6e993f102baf579dd77f1deacfa47ddeed28c5030df0ff1f')

build() {
	if [ -f /etc/qogir-gtk-theme/options.txt ]; then
		INSTALL_OPTS="$(/usr/bin/grep --max-count=1 --line-regexp '[^#\s*].*' /etc/qogir-gtk-theme/options.txt)"
		if [ $? = 0 ]; then
			export INSTALL_OPTS
			return 0
		fi
	fi
}

package() {
	cd "$_pkgname-$_pkgver"
	install -dm755 "$pkgdir/usr/share/themes"
	install -D --mode=644 "$srcdir/options.txt" --target-directory="$pkgdir/etc/qogir-gtk-theme/"
	if [ -z "$INSTALL_OPTS" ]; then
		./install.sh -d "$pkgdir/usr/share/themes"
	else
		./install.sh ${INSTALL_OPTS} -d "$pkgdir/usr/share/themes"
	fi
}
