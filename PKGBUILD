# Maintainer: Alex Wiggins <alex.d.wiggins@gmail.com>
# Contributer: Kyle Keen <keenerd@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Sebastian Schwarz <seschwar@gmail.com>

pkgbase=oss-nonfree
pkgname=oss-nonfree
true && pkgname=(oss-nonfree libflashsupport-oss-nonfree)
pkgver=4.2_2017
pkgrel=1
arch=(i686 x86_64)
url="http://www.opensound.com/oss.html"
license=('custom:4Front Commercial License')
if [[ "$CARCH" == i686 ]]; then
    _pkgarch="i386"
else
    _pkgarch="amd64"
fi
source=("http://www.4front-tech.com/release/oss-linux-v${pkgver/_*}-${pkgver/*_}-$_pkgarch.tar.bz2"
        LICENSE
        oss.service
        remove-hal.patch
        rm-init-scripts.patch
        soundon.patch)
noextract=("oss-linux-v${pkgver/_*}-${pkgver/*_}-$_pkgarch.tar.bz2")
sha512sums=('73f101e99aebc715232a5b85c70b9d48b0532e49d50a14a07d2e226783818ff2118663308f663735cd69ceb4a85120bcd09ee96a0d295733283df29d68ce72db'
            '75632fd1052834ccef32c72a30b2d2fd97448332ac1152962f6aaa29eac98a53b354dd2c3336312b760d88070d5165fef0f7f8e3ee3b8a2a3634d6fc5f56c995'
            '355e1380432947c0e9caa21114b2c3debeb162fb5abcf845125ec281ce52b437ad1ee1db04d37e9b7a5ac79816c4dcbc21b4ed4cf8191f71218d99acd7bab70e'
            '6956e5e2e9323b568bb18e80bbee591b0e5ffd3d4612a50df09879941b2733c31d6b3178dc9a46c283bd1629f76b7ff5e2b54893a42a47f6379eaee4731fd9be'
            '64e6d9d8eb5320f737d3a0698a245da2b2d141b68cfb2f02e448144d1c610aa8b8a6c38b56fcca364d63171a49afe93161a00545cdb90086b5328997b3096690'
            '5b91a4f3477db1bdbc40c891aaa8bc384f5a690e8290bc4db7bdb4a715a858b2f42780bfeb14281560a0e1a73d1cd4022ed738f01b74c26456dcf0b9952981b5')
if [[ "$CARCH" == i686 ]]; then
    sha512sums[0]=TBC
else
    sha512sums[0]=73f101e99aebc715232a5b85c70b9d48b0532e49d50a14a07d2e226783818ff2118663308f663735cd69ceb4a85120bcd09ee96a0d295733283df29d68ce72db
fi

build() {
    bsdtar xf "oss-linux-v${pkgver/_*}-${pkgver/*_}-$_pkgarch.tar.bz2" \
            usr/lib/oss/lib/flashsupport.c
    gcc $CFLAGS -shared -fPIC -Wall -Werror \
            usr/lib/oss/lib/flashsupport.c -o libflashsupport.so
}

package_libflashsupport-oss-nonfree() {
    pkgdesc="Adobe flash plugin support lib (OSSv4)"
    conflicts=(libflashsupport libflashsupport-oss libflashsupport-oss-git libflashsupport-pulse)
    depends=(oss)

    install -dm755 "$pkgdir/usr/lib"
    ln -s oss/lib/libflashsupport.so "$pkgdir/usr/lib/libflashsupport.so"
}

package_oss-nonfree() {
    pkgdesc="Open Sound System UNIX audio architecture (including nonfree drivers)"
    depends=(linux-headers)
    optdepends=('gtk2: for graphical mixer (ossxmix)'
                'libflashsupport-oss: Adobe flash plugin support')
    provides=(oss)
    conflicts=(oss oss-git libflashsupport-oss libflashsupport-oss-git)
    backup=(usr/lib/oss/soundon.user)
    install=oss.install

    cd "$pkgdir"
    bsdtar xf "$srcdir/oss-linux-v${pkgver/_*}-${pkgver/*_}-$_pkgarch.tar.bz2"
    
    # remove outdated stuff
    patch -p0 < "$srcdir/rm-init-scripts.patch"
    rm usr/lib/oss/etc/S89oss
    patch -p0 < "$srcdir/remove-hal.patch"
    rm usr/lib/oss/scripts/*oss_usb-create-device*
    patch -p0 < "$srcdir/soundon.patch"

    # usr-move fixes
    mv usr/sbin/* usr/bin
    rmdir usr/sbin
    grep -IlrZ '\<s\?bin\>' . \
            | xargs -0 sed -i 's,\<\(usr/\)\?s\?bin\>,usr/bin,g' --
        grep -IlrZ '\<lib/modules\>' . \
            | xargs -0 sed -i 's,\<\(usr/\)\?lib/modules\>,usr/&,g' --

    # make OSS install its modules to /usr/lib/modules/$KERNEL/extramodules/oss
    # grep -IlrZ '\<usr/lib/modules/[^/]\+/kernel/oss\>' . \
    #        | xargs -0 sed -i 's,\<usr/lib/modules/\([^/]\+\)/kernel/oss\>,usr/lib/modules/\1/extramodules/oss,g' --

    chmod -R a+rX .  # FS#13815
    install -Dm755 "$srcdir/libflashsupport.so" \
            usr/lib/oss/lib/libflashsupport.so
    install -Dm644 "$srcdir/LICENSE" "usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/oss.service" usr/lib/systemd/system/oss.service
}
