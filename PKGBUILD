# Maintainer: TankMissile <alecfeldman@disroot.org>
# Contributor: Chris Cromer <chris@cromer.cl>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor Damian01w <damian01w@gmail.com>
# Contributor: Padfoot <padfoot@exemail.com.au>

_pkgname=plymouth
pkgname=$_pkgname-nosystemd
pkgver=0.9.4
pkgrel=1
pkgdesc="A graphical boot splash screen with kernel mode-setting support for non systemd setups."
url="http://www.freedesktop.org/wiki/Software/Plymouth"
arch=("i686" "x86_64")
license=("GPL")
depends=("libdrm" "pango" "elogind")
makedepends=("docbook-xsl")
optdepends=("ttf-dejavu")
provides=("plymouth")
conflicts=("plymouth" "plymouth-git")
replaces=("plymouth" "plymouth-git")
options=("!libtool" "!emptydirs")
backup=("etc/plymouth/plymouthd.conf")
source=("http://www.freedesktop.org/software/$_pkgname/releases/$_pkgname-$pkgver.tar.xz"
        "arch-logo.png"
        "plymouth-start.path"
        "plymouth.encrypt_hook"
        "plymouth.encrypt_install"
        "plymouth.initcpio_hook"
        "plymouth.initcpio_install"
        "plymouth-quit.service.in.patch"
        "plymouth-update-initrd.patch")
sha256sums=("4a197a4f1a05785d7453dd829b231352fb2d09171bd86c5ffaafbb2dd6791351"
            "9bac679d2494d9b60b288be87021f1d7b85a9503ebbdce93d6e37c0fc07568ae"
            "ce3d62f4c5a1b5c0ccadd15406c7430251d1a42b232721bfbfc747da1b13e3ff"
            "cbfb5bcb6897703e088eefdee9d578f75d987116becafecbb2018b283ba3865e"
            "544399d4f3454644f24ad11e504eaa7d622c73942728f52fb55bea054c756fa1"
            "2a80e2cad8de428358647677afa166219589d3338c5f94838146c804a29e2769"
            "3e8677cb2b5ae9e4842d0d9547696aa75f7ddc2828615f59e25c040ffd3647cb"
            "d7c567123e0b3db87d3998aed8571c6554cdb7c44840196d11a010c110016b63"
            "35b1db644cdd60ec44dc6a4e88f7c4fb2528f4fa83eb939566c725534badad3a")

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 -i $srcdir/plymouth-update-initrd.patch
  patch -p1 -i $srcdir/plymouth-quit.service.in.patch
}

build() {
  cd $_pkgname-$pkgver
  LDFLAGS="$LDFLAGS -ludev" ./configure \
    --prefix=/usr \
    --exec-prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --sbindir=/usr/bin \
    --enable-drm \
    --enable-tracing \
    --enable-pango \
    --enable-gtk=no \
    --with-release-file=/etc/os-release \
    --with-logo=/usr/share/plymouth/arch-logo.png \
    --with-background-color=0x000000 \
    --with-background-start-color-stop=0x000000 \
    --with-background-end-color-stop=0x4D4D4D \
    --without-rhgb-compat-link \
    --without-system-root-install \
    --disable-systemd-integration

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/arch-logo.png"             "$pkgdir/usr/share/plymouth/arch-logo.png"
  install -Dm644 "$srcdir/plymouth.encrypt_hook"     "$pkgdir/usr/lib/initcpio/hooks/plymouth-encrypt"
  install -Dm644 "$srcdir/plymouth.encrypt_install"  "$pkgdir/usr/lib/initcpio/install/plymouth-encrypt"
  install -Dm644 "$srcdir/plymouth.initcpio_hook"    "$pkgdir/usr/lib/initcpio/hooks/plymouth"
  install -Dm644 "$srcdir/plymouth.initcpio_install" "$pkgdir/usr/lib/initcpio/install/plymouth"
  install -Dm644 "$pkgdir/usr/share/plymouth/plymouthd.defaults" "$pkgdir/etc/plymouth/plymouthd.conf"
}
