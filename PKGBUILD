# Maintainer: Peter Blackman <peter at pblackman dot plus dot com>
# Make Arch package using OBS binaries
# 22-Feb-2022 
# See http://www.c-evo.org/
# https://build.opensuse.org/package/show/home:PeterBBB/c-evo

pkgname=c-evo-nh-bin
pkgbase=c-evo-bin
pkgver=1.3.0.420.1
pkgrel=1
pkgdesc="Empire Building Game, C-evo: New Horizons"
arch=('x86_64')
url="https://app.zdechov.net/c-evo"
license=('GPL2')
depends=('gtk2')
optdepends=('ffmpeg: Needed for sounds')
conflicts=('c-evo' 'c-evo-nh' 'c-evo-bin')
source=("$pkgname-$pkgver.data.deb::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_11/all/c-evo-data_1.3.0.420+dfsg-1_all.deb"
       "$pkgname-$pkgver.stdai.deb::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_11/amd64/c-evo-stdai_1.3.0.420+dfsg-1_amd64.deb"
        "$pkgname-$pkgver.gtk2.deb::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_11/amd64/c-evo-gtk2_1.3.0.420+dfsg-1_amd64.deb")
sha256sums=('49e39dbf3f29b0d10955652e1f78ee985b2305de0ba0bc137cbbe5ee4dcfea76'
            '88c9fe71a46cdee394c7ac7fb4cba86efdf1add8da4e8fed4200579f98bfa5ce'
            '53935cbd6c310ae895842d368e387d9aca3fdfe0ae6c885871dc23c3c9a597d9')

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
