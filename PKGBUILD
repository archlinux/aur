# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>
_job=888697
_name=xwaylandvideobridge
pkgname=${_name}-bin
pkgver=j${_job}
pkgrel=1
pkgdesc="A tool to make it easy to stream wayland windows and screens to Xwayland applicatons that don't have native pipewire support."
arch=(x86_64)
url="https://invent.kde.org/system/${_name}"
license=(GPL2)
provides=('xwaylandvideobridge' 'pwbypass')
depends=('qt5-base' 'qt5-x11extras' 'qt5-declarative' 'kcoreaddons' 'kwindowsystem' 'kwidgetsaddons' 'knotifications' 'ki18n' 'gettext' 'xdg-desktop-portal' 'libxcb')
makedepends=('git' 'ostree')
optdepends=('freetype2' 'fontconfig' 'pkgconf')
source=("${url}/-/jobs/${_job}/artifacts/raw/${_name}.flatpak"
		xwaylandvideobridge.sh)
sha512sums=('5e56c52098f9d719b4fda1ff905b7239747ad8250abf1f036659b87c4ecc8c6daaf353b44225a28c6971c453567da91836c185e2f403109bd7cbd20a9733e757'
			'71a5a0abff0ae6d6c8b4ff94ce1f343864b33a8e403d9f7c8d1fd7b07c0981468917f1589af7acf1e6296aa20697eda0a99fc8f2afea86cff06849a166e94d53')

prepare(){
	ostree init --repo=repo --mode=archive
	ostree static-delta apply-offline --repo=repo xwaylandvideobridge.flatpak
	ostree checkout --repo=repo -U $(basename $(echo repo/objects/*/*.commit | cut -d/ -f3- --output-delimiter=) .commit) outdir
}

package() {
	cd outdir/files
	mkdir -p $pkgdir/{opt/$_name,usr/bin,usr/share}
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
	install -Dm0755 bin/$_name -t "${pkgdir}"/opt/$_name/
	install -Dm0755 "${srcdir}"/$_name.sh "${pkgdir}"/usr/bin/$_name
}
