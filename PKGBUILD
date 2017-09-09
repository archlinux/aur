# Contributor: grimi <grimi at poczta dot fm>

_pkgname=omnibook-git
pkgname=omnibook-dkms-git
pkgver=20150227
pkgrel=5
pkgdesc="Kernel module for HP OmniBook,Pavilion,Toshiba and Compal ACL00 laptops"
arch=('any')
url="http://omnibook.sourceforge.net"
license=('GPL')
depends=('dkms' 'linux-headers')
makedepends=('git')
conflicts=('omnibook-git')
provides=('omnibook-git')
source=("$_pkgname::git://devoid-pointer.net/omnibook.git"
        "dkms.conf" "makefile.patch")
sha256sums=('SKIP'
            '1a97e1956ad80423eb3c3b09c679bb9449ea79b50866e8f9e9a0317afe38a63d'
            '224255d7c37ea4a6cd7ddc9164e901edd205d30c62c1f02f5c8bbb8563bcf904')


pkgver() {
   cd $_pkgname
   git log -1 --format="%cd" --date="short"|sed 's|-||g'
}

build() {
   cd $_pkgname
   install -m644 ../dkms.conf ./
   patch -Np0 -i ../makefile.patch
   # fix kernel >= 4.12
   sed -i 's|<asm/uaccess.h>|<linux/uaccess.h>|' init.c
}

package() {
   install -d "$pkgdir"/usr/src
   rm -rf $_pkgname/.git
   cp -r --no-preserve="mode,ownership" $_pkgname "$pkgdir"/usr/src/
}


