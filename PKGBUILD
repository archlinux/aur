# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: MioLovesTio < mishazai1997@gmail.com >
# Contributor: Janne Heß <jannehess@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/
# Contributor: ridikulus_rat <the.ridikulus.rat@gmail.com>

pkgname=spacefm-gtk2-git
pkgver=1.0.6.r80.ge257d15
pkgrel=1
pkgdesc='Multi-panel tabbed file manager'
arch=(i686 x86_64)
url="https://ignorantguru.github.io/spacefm/"
license=(GPL3)
depends=(gtk2 startup-notification ffmpegthumbnailer)
makedepends=(intltool git)
optdepends=('dbus: dbus integration'
            'util-linux: disk eject support'
            'lsof: device processes'
            'wget: plugin download'
            'gksu: perform as root functionality'
            'udevil: mount as non-root user and mount networks'
            'udisks2: mount as non-root user'
            'pmount: mount as non-root user'
            'curlftpfs: mount FTP shares'
            'jmtpfs: mount MTP devices'
            'gphotofs: mount cameras'
            'ifuse: mount your iPhone/iPod Touch'
            'fuseiso: mount ISO files')
source=("git+https://github.com/IgnorantGuru/spacefm.git#branch=alpha"
        "https://github.com/FabioLolix/AUR-artifacts/raw/master/spacefm-Fix-GCC-10-build.patch"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/spacefm-glibc-2.28-compatibility.patch")
sha256sums=('SKIP'
            '16622d0d56c40e87e846a81709d9c2c8303f189e53a783bf20ccdb57b8f9465f'
            '12411055df994211d2968cb52746b6caefce6926aed1ed33b542bd70b571ce7e')

pkgver() {
  cd "spacefm"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "spacefm"
  patch -Np1 -i ../spacefm-glibc-2.28-compatibility.patch
  patch -Np1 -i ../spacefm-Fix-GCC-10-build.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  CFLAGS+=" -Wno-error=incompatible-pointer-types"

  cd "spacefm"
  ./configure \
    --prefix=/usr \
    --with-gtk2
  make
}

package() {
  cd "spacefm"
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/bin/spacefm-installer
}
