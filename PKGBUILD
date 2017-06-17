# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
_pkgname=linux_media
_gitname=media_build
pkgname="tbs-$_pkgname-git"
pkgver=r762.af5f7c7_4.11.5_1_ARCH
_extramodules=extramodules-4.11-ARCH
pkgrel=1
pkgdesc="TBS linux open source drivers + proprietary firmware"
arch=('i686' 'x86_64')
url="https://github.com/tbsdtv/linux_media"
license=('GPL2, custom:firmware')
makedepends=('git' 'linux-headers' 'linux-firmware' 'patchutils' 'perl-proc-processtable')
provides=("$_pkgname")
conflicts=('tbs-dvb-drivers')
source=("http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v1.0.tar.bz2")
sha256sums=('4a9e2f55396fdfc4d952949fa5bf5dc7b4134831e9f84a8fc79c0926aa1605b6')
install=tbs-linux_media-git.install

prepare() {

    git clone https://github.com/tbsdtv/$_gitname.git
    git clone --depth=1 https://github.com/tbsdtv/$_pkgname.git -b latest "$srcdir/media"

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
    make distclean
    make

}

package() {

    cd "$srcdir/$_gitname"

    mkdir -p "$pkgdir"/usr/lib/modules/"${_extramodules}"/tbs
    mkdir -p "$pkgdir"/usr/lib/firmware

    install -m0644 "$srcdir/$_gitname"/linux/firmware/*.fw  "$pkgdir"/usr/lib/firmware
    install -m0644 "$srcdir"/*.fw  "$pkgdir"/usr/lib/firmware

    cd "${pkgdir:?}"/usr/lib/firmware && rm -f $(basename -a \"$(pacman -Qlq linux-firmware)\")

    find "$srcdir/$_gitname" -name '*.ko' -exec cp "{}" "$pkgdir"/usr/lib/modules/"${_extramodules}"/tbs \;
    msg "Compressing modules, this will take awhile..."
    find "$pkgdir" -name '*.ko' -print0 | xargs -0 -P"$(nproc)" -n10 gzip -9

    chmod 0644 "$pkgdir"/usr/lib/modules/"${_extramodules}"/tbs/*.ko.gz

}
