# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: skydrome
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/

pkgname=spacefm-git
pkgver=1.0.6.r80.ge257d15
pkgrel=2
pkgdesc="Multi-panel tabbed file manager"
arch=(i686 x86_64)
url="https://ignorantguru.github.io/spacefm"
license=(GPL3)
conflicts=(spacefm)
provides=(spacefm)
makedepends=(intltool git gcc8)
depends=(gtk3 startup-notification ffmpegthumbnailer)
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
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/spacefm-glibc-2.28-compatibility.patch")
sha256sums=('SKIP'
            '12411055df994211d2968cb52746b6caefce6926aed1ed33b542bd70b571ce7e')

export CC=/usr/bin/gcc-8 CXX=/usr/bin/g++-8

pkgver() {
  cd "spacefm"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "spacefm"
  patch -Np1 -i ../spacefm-glibc-2.28-compatibility.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "spacefm"
  ./configure \
    --prefix=/usr \
    --with-gtk3
  make
}

package() {
  cd "spacefm"
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/bin/spacefm-installer
}
