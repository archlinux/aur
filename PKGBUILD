# Maintainer: skydrome
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/

GTK=3

pkgname=spacefm-git
pkgver=1.0.6.r80.ge257d15
pkgrel=1
pkgdesc="A multi-panel tabbed file manager - git branch"
arch=('i686' 'x86_64')
url="https://ignorantguru.github.io/spacefm"
license=('GPL3')
conflicts=("spacefm")
provides=("spacefm")
makedepends=('intltool' 'gettext')
depends=('startup-notification' 'ffmpegthumbnailer' 'hicolor-icon-theme' 'shared-mime-info' 'desktop-file-utils' 'cairo' 'pango' 'udevil' 'udisks2')
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

if [[ "$GTK" = 2 ]]; then
    depends+=('gtk2'); _opts='--with-gtk2'
else
    depends+=('gtk3'); _opts='--with-gtk3'
fi

source=("git+https://github.com/IgnorantGuru/spacefm.git#branch=alpha"
        "glibc_2.28.patch")
sha256sums=('SKIP'
            '12411055df994211d2968cb52746b6caefce6926aed1ed33b542bd70b571ce7e')

pkgver() {
    cd "spacefm"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "spacefm"
    patch -Np1 -i ../glibc_2.28.patch
    ./autogen.sh --prefix=/usr "$_opts"
}

build() {
    cd "spacefm"
    make
}

package() {
    cd "spacefm"
    make DESTDIR="$pkgdir" install
    rm -f "$pkgdir"/usr/bin/spacefm-installer
}
