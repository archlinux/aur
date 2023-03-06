# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
# Contributor: Bitts311 <oceanmail311@gmail.com>

_pkgname=Qogir-theme
_pkgver=2023-02-27
pkgbase="qogir-gtk-theme"
pkgname=("qogir-gtk-theme" "qogir-gtk2-theme")
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Qogir is a flat Design theme for GTK"
arch=('any')
url="https://github.com/vinceliuice/Qogir-theme"
license=('GPL3')
makedepends=('grep' 'sassc')
optdepends=(
	'kvantum-theme-qogir-git: Matching Kvantum theme'
    'qogir-icon-theme: Matching icon theme'
    'vimix-cursors: Matching cursor theme'
    'tela-icon-theme: Recommended icon theme'
)
backup=(etc/qogir-gtk-theme/options.txt)
options=('!strip')
source=(
    "$pkgbase-$pkgver.tar.gz::https://github.com/vinceliuice/$_pkgname/archive/$_pkgver.tar.gz"
    "options.txt"
)
sha256sums=('211d2d7e027fe595e7512ca346b63a9314ee59e3ddee875bc1c06aeef9e5b9bb'
            'fabf821acfe0641fd233d4d7a42a536aedc369516de62f877e83a1070c73327e')

packaging() {
	INSTALL_OPTS="$(/usr/bin/grep \
        --extended-regexp \
        --max-count=1 \
        --line-regexp \
        --no-messages \
        --invert-match '^\s*$|#.+' \
        "/${backup[0]}" || echo -n '--theme all --tweaks image square round --icon arch')"

    cd "$_pkgname-$_pkgver" || return 1
    install -dm755 "$pkgdir/usr/share/themes"
    install -D --mode=644 "$srcdir/options.txt" --target-directory="$pkgdir/${backup[0]}"
    ./install.sh ${INSTALL_OPTS//--logo/--icon} --dest "$pkgdir/usr/share/themes"
}

package_qogir-gtk-theme() {
	depends=('gtk3')
	packaging
}

package_qogir-gtk2-theme() {
	depends=('gtk-engines' 'gtk-engine-murrine')
	provides=('qogir-gtk-theme')
	conflicts=('qogir-gtk-theme')
	packaging
}
