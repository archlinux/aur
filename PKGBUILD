# Maintainer: Benjamin Hedrich <code at pagenotfound.de>

pkgname=gerbera-git
pkgver=3099.5200f0e2
pkgrel=1
pkgdesc="UPnP Media Server (Based on MediaTomb)"
arch=(i686 x86_64 armv7h)
url="https://github.com/v00d00/gerbera"
license=('GPL2')
depends=('taglib' 'curl' 'sqlite' 'file' 'libmariadbclient' 'gcc-libs' 'libupnp18' 'libmatroska'
	 'duktape' 'libexif' 'expat' 'libebml')
makedepends=('cmake')
install=gerbera.install
options=('emptydirs')
source=("$pkgname::git+https://github.com/v00d00/gerbera.git"
	gerbera-mysql.service
	gerbera.service
	gerbera.sysusers)
conflicts=(gerbera)
provides=(gerbera)
sha256sums=('SKIP'
            'f8abf002308fabb8327f3bff0fd100357360921fcbfde61795f044af96ab9257'
            '766383ece7e5fc308b52d8c9df3924e31c65e0ac0a954033248c7d80a8c40140'
            'b3f956a6eaee8753cff7a04b51091b8b283dd0da054190ced13362a5b050d73f')

pkgver() {
    cd $pkgname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$pkgname"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install

    install -dm0755 "$pkgdir"/var/lib/gerbera
    install -Dm0644 "$srcdir"/gerbera.sysusers "$pkgdir"/usr/lib/sysusers.d/gerbera.conf
    install -Dm0644 "$srcdir"/gerbera-mysql.service "$pkgdir"/usr/lib/systemd/system/gerbera-mysql.service
    install -Dm0644 "$srcdir"/gerbera.service "$pkgdir"/usr/lib/systemd/system/gerbera.service
}
