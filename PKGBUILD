# Maintainer: Samuel Corsi-House <chouse.samuel@gmail.com>
# Contributor: Artemii Sudakov <finziyr@yandex.ru>

pkgname=termius-app
_pkgname=${pkgname%-*}
pkgver=7.40.2
pkgrel=1
pkgdesc="Desktop SSH Client"
url="https://termius.com/"
arch=('x86_64')
license=('custom')
conflicts=('termius')
provides=('termius')
# Depends: libgtk-3-0, libnotify4, libnss3, libxss1, libxtst6, xdg-utils, libuuid1, libappindicator3-1, libsecret-1-0
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libappindicator-gtk3' 'libsecret')
makedepends=('grep' 'sed')
# Now I will specify the dependencies that I got from the ldd output
# You can view them by executing:
# for dep in $(ldd /opt/Termius/termius-app | sed 's/^[[:blank:]]*//' | cut -d " " -f 3); do pacman -Qoq $dep; done | sort -u | tr '\n' ' '

#depends+=(alsa-lib atk at-spi2-atk at-spi2-core avahi bzip2 cairo dbus e2fsprogs expat fontconfig freetype2 fribidi gcc-libs gdk-pixbuf2 glib2 glibc gmp gnutls graphite gtk3 harfbuzz keyutils krb5 libcap libcloudproviders libcups libdatrie libdrm libepoxy libffi libgcrypt libgpg-error libidn2 libjpeg-turbo libp11-kit libpng libtasn1 libthai libtiff libunistring libx11 libxau libxcb libxcomposite libxcursor libxdamage libxdmcp libxext libxfixes libxi libxinerama libxkbcommon libxrandr libxrender lz4 mesa nettle nspr nss pango pcre pixman systemd-libs util-linux-libs wayland xz zlib zstd)

_mirror='https://deb.termius.com'
# I got the URL to download the deb package using the server from ubuntu, path: /var/lib/apt/lists/deb.termius.com_dists_squeeze_main_binary-amd64_Packages
# TERMS_OF_USE is a copy-paste of https://termius.com/terms-of-use from browser
source=(
        "pkgs-$pkgver.gz::$_mirror/dists/squeeze/main/binary-amd64/Packages.gz"
        "$pkgname-$pkgver.deb::https://termius.com/download/linux/Termius.deb"
        "TERMS_OF_USE"
)
sha256sums=(
        "SKIP"
        "SKIP"
        "09c7bc00c70480a6b0281a971a15337f98fc440a5d671bb946eea403395432a2"
)

pkgver() {
        sed -n '/Package: termius-app$/,/^$/p' "$srcdir/pkgs-$pkgver" | grep -o 'Version: .*' | cut -d " " -f 2
}
prepare() {
        mkdir "$srcdir/work" || :
        sha512sum1="$(sha512sum "$srcdir/$pkgname-$pkgver.deb" | cut -d " " -f 1)"
        sha512sum2="$(sed -n '/Package: termius-app$/,/^$/p' "$srcdir/pkgs-$pkgver" | grep -o 'SHA512: .*' | cut -d " " -f 2)"
        if [ "$sha512sum1" != "$sha512sum2" ]; then
                warning "SHA512SUM doesn't match!"
                exit 1
        fi
        bsdtar -x -f "$srcdir"/data.tar.xz -C "$srcdir/work" || :
}

package() {
        cd "$srcdir/work"
        cp -ax ./usr "$pkgdir"/usr
        install -d -m 755 "$pkgdir"/usr/bin
        cp -ax ./opt "$pkgdir"/opt
        ln -s /opt/Termius/$pkgname "$pkgdir"/usr/bin/$pkgname
        ln -s $pkgname "$pkgdir"/usr/bin/$_pkgname
        chmod 4755 /opt/Termius/chrome-sandbox
        sed 's/\/opt\/Termius\/termius-app/\/usr\/bin\/termius/g' -i "$pkgdir"/usr/share/applications/$pkgname.desktop
        install -D -m 644 "$srcdir"/TERMS_OF_USE "$pkgdir"/usr/share/licenses/$_pkgname/TERMS_OF_USE
}
