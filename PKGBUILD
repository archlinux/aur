# Maintainer: TankMissile <alecfeldman@disroot.org>
# Contributor: Chris Cromer <chris@cromer.cl>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor Damian01w <damian01w@gmail.com>
# Contributor: Padfoot <padfoot@exemail.com.au>

_pkgname=plymouth
pkgname=${_pkgname}-nosystemd
pkgver=22.02.122
pkgrel=1
pkgdesc="A graphical boot splash screen with kernel mode-setting support for non-systemd setups"
url="http://www.freedesktop.org/wiki/Software/Plymouth"
arch=('i686' 'x86_64')
license=('GPL')

depends=('libdrm' 'pango' 'elogind')
makedepends=('docbook-xsl')
optdepends=('ttf-dejavu: For true type font support'
        'xf86-video-fbdev: Support special graphic cards on early startup'
        'cantarell-fonts: True Type support for BGRT theme')
provides=('plymouth')
conflicts=('plymouth')
backup=('etc/plymouth/plymouthd.conf')

options=('!libtool' '!emptydirs')

source=("https://gitlab.freedesktop.org/${_pkgname}/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
       'artix-logo.png'
       'plymouth.encrypt_hook'
       'plymouth.encrypt_install'
       'plymouth.initcpio_hook'
       'plymouth.initcpio_install'
       'plymouth-update-initrd.patch'
       'plymouthd.conf.patch'
)

sha256sums=('8921cd61a9f32f5f8903ceffb9ab0defaef8326253e1549ef85587c19b7f2ab6'
            '2a218ad4f7c202f0164eeccf02263b88b6c93c21301f346270e8bdd40463132c'
            '748e0cfa0e10ab781bc202fceeed46e765ed788784f1b85945187b0f29eafad7'
            '373ec20fe4c47e693a0c45cc06dd906e35dd1d70a85546bd1d571391de11763a'
            '2a80e2cad8de428358647677afa166219589d3338c5f94838146c804a29e2769'
            'b72713969814dce5d1cd9f7fd75ed91ea06c72558602e22b16848e2e907e19ad'
            '74908ba59cea53c6a9ab67bb6dec1de1616f3851a0fd89bb3c157a1c54e6633a'
            '71d34351b4313da01e1ceeb082d9776599974ce143c87e93f0a465f342a74fd2'
)

prepare() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  patch -p1 -i $srcdir/plymouth-update-initrd.patch
# systemd
# patch -p1 -i $srcdir/plymouth-quit.service.in.patch
  patch -p1 -i $srcdir/plymouthd.conf.patch
}

build() {
  cd "$srcdir"/${_pkgname}-${pkgver}

  LDFLAGS="$LDFLAGS -ludev" ./autogen.sh \
    --prefix=/usr \
    --exec-prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --sbindir=/usr/bin \
    --disable-systemd-integration \
    --enable-drm \
    --enable-tracing \
    --enable-pango \
    --enable-gtk=no \
    --with-release-file=/etc/os-release \
    --with-logo=/usr/share/plymouth/artix-logo.png \
    --with-background-color=0x000000 \
    --with-background-start-color-stop=0x000000 \
    --with-background-end-color-stop=0x4D4D4D \
    --without-rhgb-compat-link \
    --without-system-root-install

  make
}

package() {
  cd "$srcdir"/${_pkgname}-${pkgver}

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/artix-logo.png" "$pkgdir/usr/share/plymouth/artix-logo.png"

  install -Dm644 "$srcdir/plymouth.encrypt_hook" "$pkgdir/usr/lib/initcpio/hooks/plymouth-encrypt"
  install -Dm644 "$srcdir/plymouth.encrypt_install" "$pkgdir/usr/lib/initcpio/install/plymouth-encrypt"
  install -Dm644 "$srcdir/plymouth.initcpio_hook" "$pkgdir/usr/lib/initcpio/hooks/plymouth"
  install -Dm644 "$srcdir/plymouth.initcpio_install" "$pkgdir/usr/lib/initcpio/install/plymouth"

  install -Dm644 "$pkgdir/usr/share/plymouth/plymouthd.defaults" "$pkgdir/etc/plymouth/plymouthd.conf"
}
