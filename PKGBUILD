# Maintainer    : Vincent Grande <shoober420@gmail.com>
# Contributor   : Eric Vidal <eric@obarun.org>
# Contributor   : Jean-Michel T.Dydak <jean-michel@obarun.org>
#----------------
# Website       : https://git.kernel.org/?p=utils/kernel/kmod/kmod.git;a=summary
#-----------------------------------------------------------------------------------------------

pkgname=lib32-kmod-minimal-git
pkgver=28
pkgrel=1
pkgdesc="Linux kernel module handling"
arch=('x86_64')
url="https://www.kernel.org/pub/linux/utils/kernel/kmod"
license=('GPL2')
source=("git+https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git")

options=('!libtool')

depends=(
    'lib32-zlib'
    'lib32-xz')

makedepends=(
    'lib32-gcc-libs'
    'gcc-multilib')

provides=(lib32-kmod)
conflicts=(lib32-kmod)
#-----------------------------------------------------------------------------------------------
pkgver() {
  cd kmod
  git describe --tags | sed 's/-/+/g'
}

build() {

    export CC="gcc -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    cd kmod

    ./autogen.sh
    ./configure \
        --libdir=/usr/lib32 \
        --sysconfdir=/etc \
        --disable-tools \
        --with-zlib \
        --with-xz \
	--disable-logging \
	--disable-debug \
	--disable-gtk-doc
    make
}

package() {

    cd kmod

    make DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}"/usr/{share,include,bin}
}

#-----------------------------------------------------------------------------------------------
#validpgpkeys=('EAB33C9690013C733916AC839BA2A5A630CBEA53' # Lucas DeMarchi

sha512sums=('SKIP')
