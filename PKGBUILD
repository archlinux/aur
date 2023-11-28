# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>
_job=1373302
_name=xwaylandvideobridge
pkgname=${_name}-bin
pkgver=j${_job}
pkgrel=2
pkgdesc="A tool to make it easy to stream wayland windows and screens to Xwayland applicatons that don't have native pipewire support."
arch=(x86_64)
url="https://invent.kde.org/system/${_name}"
license=(GPL2)
provides=('xwaylandvideobridge' 'pwbypass')
conflicts=('xwaylandvideobridge' 'xwaylandvideobridge-git' 'xwaylandvideobridge-cursor-mode-2-git')
depends=('qt5-base' 'qt5-x11extras' 'qt5-declarative' 'kcoreaddons5' 'kwindowsystem5' 'kwidgetsaddons5' 'knotifications5' 'ki18n5' 'gettext' 'xdg-desktop-portal' 'libxcb')
makedepends=('git' 'ostree')
optdepends=('freetype2' 'fontconfig' 'pkgconf')
source=("$_name-$pkgver.flatpak::${url}/-/jobs/${_job}/artifacts/raw/${_name}.flatpak"
		xwaylandvideobridge.sh)
sha512sums=('0e1439a0802c2fd14280bca8f851d0f27ce8214a20ceeb3f0faaba28cb3cd8b7c8292c3c9bd5fd39ea21d0a8bbb87b0d8bf73dbf4b9ddd0bf57f1659ed7666ff'
            '71a5a0abff0ae6d6c8b4ff94ce1f343864b33a8e403d9f7c8d1fd7b07c0981468917f1589af7acf1e6296aa20697eda0a99fc8f2afea86cff06849a166e94d53')

prepare(){
	if [ -d "${srcdir}/outdir" ]; then
  		# Clean the past builds #
  		rm -r "${srcdir}/outdir"
	fi
	ostree init --repo=repo --mode=archive
	ostree static-delta apply-offline --repo=repo "xwaylandvideobridge-$pkgver.flatpak"
	ostree checkout --repo=repo -U $(basename $(echo repo/objects/*/*.commit | cut -d/ -f3- --output-delimiter=) .commit) outdir
       # Remove unwanted files
       rm -r \
               outdir/files/lib/cmake \
               outdir/files/lib/debug \
               outdir/files/share/app-info \
               outdir/files/share/icons/hicolor/icon-theme.cache \
               outdir/files/share/locale \
               outdir/files/share/qlogging-categories5 \
               outdir/files/share/runtime
}

package() {
	cd outdir/files
    mkdir -m 0755 -p $pkgdir/{opt/$_name,usr/bin,usr/share}
    cp -dpr --no-preserve=ownership lib/* "${pkgdir}"/opt/$_name
    cp -dpr --no-preserve=ownership share "${pkgdir}"/usr/
	install -Dm0755 bin/$_name -t "${pkgdir}"/opt/$_name/
	install -Dm0755 "${srcdir}"/$_name.sh "${pkgdir}"/usr/bin/$_name
}
