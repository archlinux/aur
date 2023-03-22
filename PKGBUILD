# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
_pkgname=linux_media
_gitname=media_build
pkgname="tbs-$_pkgname-git"
pkgver=r1547.4fd7679_6.2.7_arch1_1
_updatedmodules="$(uname -r)/updates"
pkgrel=1
pkgdesc="TBS linux open source drivers"
arch=('x86_64')
url="https://github.com/tbsdtv/linux_media"
license=('GPL2')
depends=('tbs-firmware')
makedepends=('git' 'linux-headers' 'patchutils' 'perl-proc-processtable')
provides=("$_pkgname")
conflicts=('tbs-dvb-drivers')
source=('kernel6.patch')
sha256sums=('ad4dcfd9ae18d844d20db830e47935b3615b85426b0281e05046964a28c7a564')

prepare() {

	git clone https://github.com/tbsdtv/$_gitname.git
    git clone --depth=1 https://github.com/tbsdtv/$_pkgname.git -b latest "$srcdir/media"

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
