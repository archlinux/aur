# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
_pkgname=linux_media
_gitname=media_build
pkgname="tbs-$_pkgname-git"
pkgver=r1540.575a119_6.2.7_arch1_1
_updatedmodules="$(uname -r)/updates"
pkgrel=1
pkgdesc="TBS linux open source drivers"
arch=('x86_64')
url="https://github.com/tbsdtv/linux_media"
license=('GPL2')
depends=('tbs-firmware')
makedepends=('git' 'linux-headers' 'patchutils' 'perl-proc-processtable' 'dos2unix')
provides=("$_pkgname")
conflicts=('tbs-dvb-drivers')
source=('kernel6.patch')
sha256sums=('6e1b9e1ac99ed240f7e38dbcd55510c2f5d2d40d215ee7ac61f79e600c01a81b')

prepare() {

	git clone https://github.com/tbsdtv/$_gitname.git
    git clone --depth=1 https://github.com/tbsdtv/$_pkgname.git -b latest "$srcdir/media"

    dos2unix "$srcdir/media/drivers/media/dvb-frontends/gx1503.c"
    dos2unix "$srcdir/media/drivers/media/tuners/mxl603.c"

	cd "$srcdir"
	patch -p0 -i ../kernel6.patch

}

pkgver() {

    cd "$srcdir/$_gitname"
    _gitver=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
    _kernel=$(uname -r | sed -r 's/-/_/g')
    echo "$_gitver"_"$_kernel"

}

build() {

    cd "$srcdir/$_gitname"

    make dir DIR=../media
    make allyesconfig
    make

}

package() {

    cd "$srcdir/$_gitname"

    mkdir -p "$pkgdir"/usr/lib/modules/"${_updatedmodules}"/tbs

    find "$srcdir/$_gitname" -name '*.ko' -exec cp "{}" "$pkgdir"/usr/lib/modules/"${_updatedmodules}"/tbs \;
    echo "Compressing modules, this will take awhile..."
    find "$pkgdir" -name '*.ko' -print0 | xargs -0 -P"$(nproc)" -n10 gzip -9

    chmod 0644 "$pkgdir"/usr/lib/modules/"${_updatedmodules}"/tbs/*.ko.gz

}
