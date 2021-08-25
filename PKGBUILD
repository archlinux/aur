# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# Make Arch package using OBS binaries 
# See http://www.c-evo.org/

pkgname=c-evo-bin
pkgver=400.1.1
pkgrel=1
pkgdesc="Empire Building Game, C-evo: New Horizons"
arch=('x86_64')
url="https://app.zdechov.net/c-evo"
license=('GPL2')
depends=('gtk2')
optdepends=('ffmpeg: Needed for sounds')
conflicts=('c-evo')
source=("$pkgname-$pkgver.data.deb::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_11/all/c-evo-data_400+dfsg.1-1_all.deb"
       "$pkgname-$pkgver.stdai.deb::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_11/amd64/c-evo-stdai_400+dfsg.1-1_amd64.deb"
        "$pkgname-$pkgver.gtk2.deb::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_11/amd64/c-evo-gtk2_400+dfsg.1-1_amd64.deb")
sha256sums=('4e9bad355f379ece2244a140b7e26c05bcd059e45422b657c9f6127705df87f5'
            'cba2df6adadc057a5f6092433edf785b7c4978b6eb086a998c0e82a94c5a31d8'
            'be746e637defb6586130917f89952c828e90e30dce62cb53f7e16d13b357039c')

noextract=("$pkgname-$pkgver.data.deb"
	  "$pkgname-$pkgver.stdai.deb"
	  "$pkgname-$pkgver.gtk2.deb")

prepare() {
   cd "${srcdir}"
   ar -x "$pkgname-$pkgver.data.deb"  data.tar.xz
   mv data.tar.xz c-data.tar.xz
   ar -x "$pkgname-$pkgver.stdai.deb" data.tar.xz
   mv data.tar.xz c-stdai.tar.xz
   ar -x "$pkgname-$pkgver.gtk2.deb"  data.tar.xz
   mv data.tar.xz c-gtk2.tar.xz
   
   tar -xf c-stdai.tar.xz
   tar -xf c-data.tar.xz
   tar -xf c-gtk2.tar.xz
   
   # Remove unwanted
   rm -fr usr/share/doc-base
   rm -fr usr/share/lintian
   rm -fr usr/share/doc/c-evo-gtk2
   rm -fr usr/share/doc/c-evo-stdai
   
   # Arch does not use a games subfolder
   rm -fr usr/bin
   mv -T usr/games usr/bin
   rm -fr usr/share/c-evo
   mkdir usr/share/c-evo
   mv usr/share/games/c-evo/* usr/share/c-evo
   rm -r usr/share/games
   rm usr/share/c-evo/AI/StdAI/libstdai.so
   ln -srv usr/lib/c-evo/libstdai.so usr/share/c-evo/AI/StdAI/libstdai.so
   
   sed -i "s|share/games|share|"   usr/bin/c-evo-launch-gtk2
   sed -i "s|/usr/games|/usr/bin|" usr/bin/c-evo-launch-gtk2
 }


package() {
    cd $srcdir
    cp -Rf ./usr $pkgdir
}

