# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>
_job=853700
_name=xwaylandvideobridge
pkgname=${_name}-bin
pkgver=j${_job}
pkgrel=1
pkgdesc="A tool to make it easy to stream wayland windows and screens to Xwayland applicatons that don't have native pipewire support."
arch=(x86_64)
url="https://invent.kde.org/davidedmundson/${_name}"
license=(GPL2)
provides=('xwaylandvideobridge' 'pwbypass')
depends=('qt5-base' 'qt5-x11extras' 'qt5-declarative' 'kcoreaddons' 'kwindowsystem' 'kwidgetsaddons' 'knotifications' 'ki18n' 'gettext' 'xdg-desktop-portal' 'libxcb')
makedepends=('git' 'ostree')
optdepends=('freetype' 'fontconfig' 'pkgconf')
source=("https://invent.kde.org/davidedmundson/${_name}/-/jobs/${_job}/artifacts/raw/${_name}.flatpak"
		pwbypass.sh)
sha512sums=('c6e1a395bf8f8192958a53b88681bf3d3ac24beae4dd780cdcd3a6d85d7510d338fe6f36b2e3ba01b0362ab601a05d1ae5ff2dd556a71da877c256b07b5e2f91'
			'bc3b4292c8f31afeefcf56bff33a298476db663d1d725340735d9075722a0fbbd0574b17456c963de1a9e4d03bcda0d7b1654dc8b229d156da14233b296ade04')

prepare(){
	ostree init --repo=repo --mode=archive
	ostree static-delta apply-offline --repo=repo xwaylandvideobridge.flatpak
	ostree checkout --repo=repo -U $(basename $(echo repo/objects/*/*.commit | cut -d/ -f3- --output-delimiter=) .commit) outdir
}

package() {
	cd outdir/files
	mkdir $pkgdir/{opt,opt/$_name,usr,usr/bin,usr/share}
	cp -r lib/* "${pkgdir}"/opt/$_name
	cp -r share "${pkgdir}"/usr/
	rm -r \
			"${pkgdir}"/opt/$_name/cmake \
			"${pkgdir}"/opt/$_name/debug \
			"${pkgdir}"/usr/share/app-info \
			"${pkgdir}"/usr/share/icons/hicolor/icon-theme.cache \
			"${pkgdir}"/usr/share/locale \
			"${pkgdir}"/usr/share/qlogging-categories5 \
			"${pkgdir}"/usr/share/runtime
	chmod 0755 -R "${pkgdir}"/opt/$_name
	chmod 0644 -R "${pkgdir}"/usr/share
	install -Dm0755 bin/pwbypass -t "${pkgdir}"/opt/$_name/
	install -Dm0755 "${srcdir}"/pwbypass.sh "${pkgdir}"/usr/bin/pwbypass
}
