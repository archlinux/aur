# Maintainer: Artemii Sudakov <finziyr@yandex,ru>

pkgname=termius-app
_pkgname=${pkgname%-*}
pkgver=7.9.0
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
# TERMS_OF_USE is a copy-paste of https://termius.com/terms-of-use from browser
source=(
	"$pkgname-$pkgver.deb::$_mirror/pool/main/t/$pkgname/${pkgname}_${pkgver}_amd64.deb"
	"TERMS_OF_USE"
)
sha512sums=('f669beef28f6d7c5261a8113e8488a3408e8ae0d39fb2d60fce599fb110b5ab1f7286e101db2aa90c2b2018b2fc8a4ffae149b43733488e3d3e4681dc53740b2'
            'bf187f1ec9387d9c3ddbd0e401a235ec9bafab14698f49a182546ed4a057c398f3532f472b2a6be22b9a200b29d1ccb6e3c2fb69a92dfce2a4bf29264617565b')

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
	install -D -m 644 "$srcdir"/TERMS_OF_USE "$pkgdir"/usr/share/licenses/$_pkgname/TERMS_OF_USE
}
