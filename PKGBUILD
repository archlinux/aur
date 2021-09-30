# Contributor: Bailey Fox <bfox200012@gmail.com>
# Contributor: ajs124 < aur AT ajs124 DOT de >
# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Thomas Hebb <tommyhebb@gmail.com>
# Contributor: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>

pkgname=abootimg
pkgver=0.6
pkgrel=1
pkgdesc="A tool to read/write/update old android boot images"
arch=('i686' 'x86_64' 'arm' 'armv7h')
url="https://github.com/ggrandou/abootimg"
license=('GPL')
depends=('util-linux' 'cpio')
makedepends=('git')
provides=('abootimg')
source=("http://http.debian.net/debian/pool/main/a/abootimg/abootimg_${pkgver}.orig.tar.gz"
        "http://http.debian.net/debian/pool/main/a/abootimg/abootimg_${pkgver}-1.diff.gz"
        'no-initrd.patch')
sha512sums=('b96be8abe9bccfb7694c1d8f30b3a5dcc0e411b73fc78eb15f1488207032aa4737286be776b78e41bc14216e8d78ec768bbb2f91f0fe53192f08df8b6497d28f'
            '66884cf42c7c2121065cec6e974f3c6d301e058231b910db8e4816ed5274d7e6eb6045d1649b059c468e6760b16046ae7ef58756c810967e47e6214e0fc0612f'
            'SKIP')

prepare() {
  cd "${srcdir}/abootimg-${pkgver}"
  patch -p0 --binary < ../no-initrd.patch
  patch -p1 --binary < ../abootimg_0.6-1.diff
}

build() {
  cd "${srcdir}/abootimg-${pkgver}"

  make
  gzip -f debian/abootimg.1
}

package() {
  cd "${srcdir}/abootimg-${pkgver}"

  install                      -d "${pkgdir}/usr/bin"
  install                      -d "${pkgdir}/usr/share/man/man1/"
  install abootimg             -t "${pkgdir}/usr/bin"
  install pack-initrd             "${pkgdir}/usr/bin/abootimg-pack-initrd"
  install unpack-initrd           "${pkgdir}/usr/bin/abootimg-unpack-initrd"
  install debian/abootimg.1.gz -t "${pkgdir}/usr/share/man/man1/"
}
