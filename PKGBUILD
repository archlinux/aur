# Maintainer: Peter Blackman <peter at pblackman dot plus dot com>
# Make Arch package using OBS binaries
# 11-Jan-2022 
# See http://www.c-evo.org/
# https://build.opensuse.org/package/show/home:PeterBBB/c-evo

pkgname=c-evo-nh-bin
pkgbase=c-evo-bin
pkgver=1.3.0.418.1
pkgrel=1
pkgdesc="Empire Building Game, C-evo: New Horizons"
arch=('x86_64')
url="https://app.zdechov.net/c-evo"
license=('GPL2')
depends=('gtk2')
optdepends=('ffmpeg: Needed for sounds')
conflicts=('c-evo' 'c-evo-nh' 'c-evo-bin')
source=("$pkgname-$pkgver.data.deb::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_11/all/c-evo-data_1.3.0.418+dfsg-1_all.deb"
       "$pkgname-$pkgver.stdai.deb::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_11/amd64/c-evo-stdai_1.3.0.418+dfsg-1_amd64.deb"
        "$pkgname-$pkgver.gtk2.deb::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_11/amd64/c-evo-gtk2_1.3.0.418+dfsg-1_amd64.deb")
sha256sums=('f164f5370b334fc5afd6cf73a665db61697d80cc80c64edadb9acf8cde637fdb'
            'f9d884b9cb6e6dc6a0af378d6aa2d6fc4a20210906f58b3fda7387e9f375e767'
            '00f604183f9eb3e8a5172287783365220fa5b8cba31a3b3f46bdffe54483bb30')

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
