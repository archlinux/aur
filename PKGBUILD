#!/bin/bash
# shellcheck disable=SC2034,SC2164
# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Maintainer: Marcus Behrendt <marcus dot behrendt dot eightysix(in numbers) at bigbrothergoogle dot com
_pkgbase=arc-kde
_pkgname=("${_pkgbase}"{,'-wallpapers'}
          'kvantum-theme-arc'
          'konsole-colorscheme-arc'
          'yakuake-skin-arc'
          'konversation-theme-arc')
pkgname=("${_pkgname[@]/%/-git}")
pkgbase=${_pkgbase}-git
pkgver=20170912.r7.g826411a
pkgrel=1
epoch=2
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/${_pkgbase}"
license=('GPL3')
makedepends=('git')
options=('!strip')
source=("${pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgbase}"
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
	cd "${pkgbase}"
	rm -r konversation/themes/papirus{,-dark}/src
	mv yakuake/{kns_,}skins
}

_install() {
	cd "${pkgbase}"
	# shellcheck disable=SC2154
	install -d "${pkgdir}"/usr/share
	cp -r "$@" "${pkgdir}"/usr/share
}

package_arc-kde-git() {
	pkgdesc="Arc theme for KDE Plasma 5"
	depends=('plasma-workspace')
	optdepends=('papirus-icon-theme: for a more consistent and beautiful experience (recommended)'
	            'arc-gtk-theme: for a consistent look in GTK applications'
	            'arc-kde-wallpapers: Arc KDE wallpapers'
	            'kvantum-theme-arc: Arc theme for Kvantum (recommended)'
	            'konsole-colorscheme-arc: Arc theme for Konsole'
	            'yakuake-skin-arc: Arc theme for Yakuake'
	            'konversation-theme-arc: Arc theme for Konversation'
	            'arc-firefox-theme: Arc theme for Firefox')
	provides=("${_pkgbase}")
	conflicts=("${_pkgbase}")
	install=${pkgbase}.install

	_install plasma aurorae color-schemes
}

package_arc-kde-wallpapers-git() {
	pkgdesc="Arc KDE wallpapers"
	provides=('arc-kde-wallpapers')
	conflicts=("${provides[0]}" "${pkgbase}<2:")

	_install wallpapers
}

package_kvantum-theme-arc-git() {
	pkgdesc="Arc theme for Kvantum"
	depends=('kvantum-qt5')
	provides=('kvantum-theme-arc')
	conflicts=("${provides[0]}" "${pkgbase}<2:")

	_install Kvantum
}

package_konsole-colorscheme-arc-git() {
	pkgdesc="Arc theme for Konsole"
	depends=('konsole')
	provides=('konsole-colorscheme-arc')
	conflicts=("${provides[0]}" "${_pkgbase}<2:")

	_install konsole
}

package_yakuake-skin-arc-git() {
	pkgdesc="Arc theme for Yakuake"
	depends=('yakuake')
	provides=('yakuake-skin-arc')
	conflicts=("${provides[0]}" "${_pkgbase}<2:")

	_install yakuake
}

package_konversation-theme-arc-git() {
	pkgdesc="Arc theme for Konversation"
	depends=('konversation')
	provides=('konversation-theme-arc')
	conflicts=("${provides[0]}" "${pkgbase}<2:")

	_install konversation
}
