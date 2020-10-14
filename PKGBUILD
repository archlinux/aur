# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=plocate
pkgver=1.0.2
pkgrel=1
pkgdesc="Alternative to locate, faster and compatible with mlocate's database."
arch=('x86_64' 'i686')
url="https://plocate.sesse.net/"
license=('GPL2')
depends=('zstd' 'liburing' 'mlocate')
makedepends=('meson')
install='plocate.install'
source=("https://${pkgname}.sesse.net/download/${pkgname}-${pkgver}.tar.gz"
        'plocate-build.service')
md5sums=('3712cf530d6eae385a5fc0683d8120aa'
         'ff46acd3de8480cc9c927c0d872553d4')

build() {
    arch-meson $pkgname-$pkgver build
    meson compile -C build

    # fix group info in cron script
    sed -i -e 's/grp mlocate/grp locate/' build/update-plocate.sh
}

package() {
    DESTDIR="$pkgdir" meson install -C build

    # fix permissions (match mlocate permissions)
    chgrp 21 "${pkgdir}/usr/bin/plocate"
    chmod 2755 "${pkgdir}/usr/bin/plocate"

    # not working, want bindto existing updatedb.service file, and use timer from
    # mlocate package. Further investigation is needed.
	#install -Dm644 ../plocate-build.service "${pkgdir}/usr/lib/systemd/system/plocate-build.service"
}
