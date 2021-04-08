# Maintainer: Artemii Sudakov <finziyr@yandex,ru>

pkgname=termius-app
_pkgname=${pkgname%-*}
pkgver=7.8.0
pkgrel=1
pkgdesc="Desktop SSH Client"
url="https://www.termius.com/"
arch=('x86_64')
license=('custom')
conflicts=('termius')
provides=('termius')
# Depends: libgtk-3-0, libnotify4, libnss3, libxss1, libxtst6, xdg-utils, libatspi2.0-0, libuuid1, libappindicator3-1, libsecret-1-0
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libuuid.so' 'libappindicator-gtk3' 'libsecret')
# Now I will specify the dependencies that I got from the ldd output
# You can view them by executing: 
# for dep in $(ldd /opt/Termius/termius-app | sed 's/^[[:blank:]]*//' | cut -d " " -f 3); do pacman -Qoq $dep; done | sort -u | tr '\n' ' '

#depends+=(alsa-lib atk at-spi2-atk at-spi2-core avahi bzip2 cairo dbus e2fsprogs expat fontconfig freetype2 fribidi gcc-libs gdk-pixbuf2 glib2 glibc gmp gnutls graphite gtk3 harfbuzz keyutils krb5 libcap libcloudproviders libcups libdatrie libdrm libepoxy libffi libgcrypt libgpg-error libidn2 libjpeg-turbo libp11-kit libpng libtasn1 libthai libtiff libunistring libx11 libxau libxcb libxcomposite libxcursor libxdamage libxdmcp libxext libxfixes libxi libxinerama libxkbcommon libxrandr libxrender lz4 mesa nettle nspr nss pango pcre pixman systemd-libs util-linux-libs wayland xz zlib zstd)

makedepends=('tar' 'sed')
_mirror='https://deb.termius.com'
# I got the URL to download the deb package using the server from ubuntu, path: /var/lib/apt/lists/deb.termius.com_dists_squeeze_main_binary-amd64_Packages
source=(
	"$pkgname-$pkgver.deb::$_mirror/pool/main/t/$pkgname/${pkgname}_${pkgver}_amd64.deb"
)
sha512sums=('0eadd8df40134c696927953a0f38f3294ae2da70bc6dc19d0e1d5036f3fb7893127310a6cef562567de0dfa956c16f9b390b876a0ebdf554aa7d64a7cabdebfe')

prepare() {
	mkdir "$srcdir/work" || :
	tar -x -f "$srcdir"/data.tar.xz -C "$srcdir/work" || :
}

package() {
	cd "$srcdir/work"
	cp -ax ./usr "$pkgdir"/usr
	install -d -m 755 "$pkgdir"/usr/bin
	cp -ax ./opt "$pkgdir"/opt
	ln -s /opt/Termius/$pkgname "$pkgdir"/usr/bin/$pkgname
	ln -s $pkgname "$pkgdir"/usr/bin/$_pkgname
	sed 's/\/opt\/Termius\/termius-app/\/usr\/bin\/termius/g' -i "$pkgdir"/usr/share/applications/$pkgname.desktop
}
