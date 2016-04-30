# Maintainer: ssf <punx69 at gmx dot net>
pkgbase=ivy-theme-git
pkgname=('ivy-icon-theme' 'ivy-theme-base' 'ivy-theme-extra-hidpi')
pkgver=2016.04.29
pkgrel=1
arch=("any")
pkgdesc="A simple desktop independent theme"
url="http://sixsixfive.deviantart.com/art/Ivy-112213849"
license=("CCPL:cc-by-sa-4.0")
makedepends=('curl' 'coreutils' 'libarchive')
# this makes pacman a bit faster, however a poor pkgmgr is still a poor pkgmgr...
PKGEXT='.pkg.tar'
SRCEXT='.pkg.tar'
options=('!strip' '!docs' '!emptydirs' '!optipng' '!libtool' '!staticlibs')
BUILDENV=('!check' '!sign')

pkgver() {
	printf "$(curl https://github.com/sixsixfive/Ivy/releases|grep -oP "<h5>(.*)</h5>"|cut -d ">" -f 2|cut -d "<" -f 1|head -n 1|tr - .)"
}

prepare() {
	#FIXME add loop/integrity checks
	curl -L https://github.com/sixsixfive/Ivy/releases/download/pre/ivy-icon-theme.txz > "${srcdir}"/icons.src
	curl -L https://github.com/sixsixfive/Ivy/releases/download/pre/ivy-gui-base.txz > "${srcdir}"/guibase.src
	curl -L https://github.com/sixsixfive/Ivy/releases/download/pre/ivy-gui-extra-hidpi.txz > "${srcdir}"/guihidpi.src
}

package_ivy-icon-theme() {
	set -e
	pkgname=("${pkgname}")
	provides=("${pkgname}=${pkgver}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}<=${pkgver}" "${pkgname}-git<=${pkgver}")
	replaces=("${pkgname}<=${pkgver}" "${pkgname}-git<=${pkgver}")
	depends=('hicolor-icon-theme')
	pkgdesc="Ivy is a colorful and sharp icon theme"
	mkdir -p "${pkgdir}"/usr/share/icons
	bsdtar -xvf "${srcdir}"/icons.src -C "${pkgdir}"/usr/share/icons
}

package_ivy-theme-base() {
	set -e
	pkgname=("${pkgname}")
	provides=("${pkgname}=${pkgver}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}<=${pkgver}" "${pkgname}-git<=${pkgver}")
	replaces=("${pkgname}<=${pkgver}" "${pkgname}-git<=${pkgver}")
	depends=('gtk2' 'gtk-engine-murrine' 'gtk3>=3.20')
	optdepends=('ivy-icon-theme' 'xfwm4' 'marco' 'openbox' 'xfce4-windowck-plugin')
	pkgdesc="Ivy is a simple and classic GUI theme"
	mkdir -p "${pkgdir}"/usr/share/themes
	bsdtar -xvf "${srcdir}"/guibase.src -C "${pkgdir}"/usr/share/themes
}

package_ivy-theme-extra-hidpi() {
	set -e
	pkgname=("${pkgname}")
	provides=("${pkgname}=${pkgver}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}<=${pkgver}" "${pkgname}-git<=${pkgver}")
	replaces=("${pkgname}<=${pkgver}" "${pkgname}-git<=${pkgver}")
	optdepends=('ivy-theme-base' 'xfwm4' 'marco' 'xfce4-windowck-plugin')
	pkgdesc="Ivy HiDPI WM-themes"
	mkdir -p "${pkgdir}"/usr/share/themes
	bsdtar -xvf "${srcdir}"/guihidpi.src -C "${pkgdir}"/usr/share/themes
}
