# Maintainer: Benjamin Hedrich <code at pagenotfound.de>

pkgname=gerbera-git
pkgver=3099.5200f0e2
pkgrel=1
pkgdesc="UPnP Media Server (Based on MediaTomb)"
arch=(i686 x86_64 armv7h)
url="https://github.com/v00d00/gerbera"
license=('GPL2')
depends=('taglib' 'curl' 'sqlite' 'file' 'gcc-libs' 'libupnp18' 'libmatroska'
	 'duktape' 'libexif' 'expat' 'libebml')
makedepends=('cmake')
install=gerbera.install
options=('emptydirs')
source=("$pkgname::git+https://github.com/v00d00/gerbera.git"
	gerbera.sysusers
        gerbera.tmpfiles)
conflicts=(gerbera)
provides=(gerbera)
sha256sums=('SKIP'
            'b3f956a6eaee8753cff7a04b51091b8b283dd0da054190ced13362a5b050d73f'
            '452f5d4b5661e0262cb4a48d62a54f5f26d53c6d3aebf502cde072214a8b30d8')

pkgver() {
    cd $pkgname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$pkgname"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr 
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install

    install -dm0755 "$pkgdir"/var/lib/gerbera
    install -dm0755 "${pkgdir}"/etc/gerbera   
    install -Dm0644 "$srcdir"/gerbera.sysusers "$pkgdir"/usr/lib/sysusers.d/gerbera.conf
    install -Dm0644 "$srcdir"/gerbera.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/${pkgname}.conf
}
