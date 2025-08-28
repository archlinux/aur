# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=celestia
pkgname=$_pkgname-bin
pkgver=1.7.0
pkgrel=5
pkgdesc="Real-time space simulation"
arch=('x86_64')
url="https://celestiaproject.space/"
license=('GPL-2.0')

conflicts=($_pkgname)
provides=($_pkgname)
depends=(xcb-util-image gtk2 ki18n5 libimobiledevice-glue knotifications5 cairo kconfigwidgets5 dbus qt5-wayland kwayland5 libbluray kcrash5 openssl-1.1 libcanberra kwindowsystem5 gcc-libs xcb-util-renderutil libwebp libsm libssh libglvnd kwallet5 xz fontconfig kcodecs5 kdbusaddons5 libelf mesa nettle libxkbcommon-x11 karchive5 opus glibc lz4 libopenmpt xcb-util-keysyms bash libtheora libimobiledevice lame libtirpc libtasn1 libinput libxkbcommon util-linux-libs gnutls tslib alsa-lib at-spi2-core kjobwidgets5 gmp libpng gdk-pixbuf2 kcoreaddons5 luajit libepoxy openjpeg2 qt5-base libtool qt5-svg solid5 libjpeg-turbo libxcb kio5 libx11 kservice5 zstd libva kconfig5 libxslt sqlite speex libxtst kitemviews5 libvorbis libice libgcrypt libxml2 qt5-speech wayland kguiaddons5 kcompletion5 aom krb5 mpg123 mtdev kwidgetsaddons5 ncurses double-conversion libxrender qt5-quickcontrols2 pcre2 kglobalaccel5 libidn2 pixman sonnet5 perl xcb-util-wm libxext libpulse libproxy libsndfile kiconthemes5 twolame harfbuzz kxmlgui5 gsm acl libdbusmenu-qt5 libxi libgudev attr freetype2 kauth5 qt5-x11extras systemd-libs libp11-kit libdrm glib2 kbookmarks5 libvdpau pango libcap avahi libxcursor libcups libxfixes zlib qt5-declarative ktextwidgets5 libogg)
makedepends=(libappimage)

_qtver=6
_target="celestia-latest-x86_64.AppImage"
_download_url="https://download.opensuse.org/repositories/home:/munix9:/unstable/AppImage/"

source=(
	"$_download_url/$_target"
	"$_pkgname.bash"
)
sha256sums=('98fe6d8bac4e95d44a4a5092b9b201c6dffd8e005fc929c60cf62a7542900de0'
            '58672bcc02b5f50eb5dee22264b4ddb629a3927779941e359257927261021830')

_squashfs_root="squashfs-root"

prepare() {
	echo 'Extracting the AppImage (This may take some time)... '

	rm -rf $_squashfs_root
	chmod +x $_target
	./$_target --appimage-extract >> /dev/null
	chmod +x $_squashfs_root/AppRun

	echo 'Done'

	echo 'Adjusting...'

	sed -i -e 's/Celestia (Qt5)/Celestia/g' -e 's/Space Simulator (AppImage-1.7.0~git)/Space Simulator/g' $_squashfs_root/space.celestiaproject.$_pkgname.desktop

	echo 'Done'
}

package() {
	mkdir -p $pkgdir/opt/$_pkgname
	cp -arf ./$_squashfs_root $pkgdir/opt/$_pkgname
	rm -rf $pkgdir/opt/$_pkgname/$_squashfs_root/etc/ $pkgdir/opt/$_pkgname/$_squashfs_root/usr/bin/gtk-update-icon-cache $pkgdir/opt/$_pkgname/$_squashfs_root/usr/bin/sh

	install -Dm644 $pkgdir/opt/$_pkgname/$_squashfs_root/space.celestiaproject.$_pkgname.desktop -t $pkgdir/usr/share/applications/

	install -Dm644 $pkgdir/opt/$_pkgname/$_squashfs_root/celestia.png -t $pkgdir/usr/share/icons/

	install -Dm755 ./$_pkgname.bash $pkgdir/usr/bin/$_pkgname
}
