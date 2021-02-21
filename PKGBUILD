# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# Make Arch package using OBS binaries 
# See https://app.zdechov.net/c-evo
# See https://svn.zdechov.net/c-evo

pkgname=c-evo-bin
pkgver=285.6.3
pkgrel=1
pkgdesc="Empire Building Game"
arch=('x86_64')
url="http://www.c-evo.org/"
license=('GPL2')
depends=('gtk2')
optdepends=('ffmpeg: Needed for sounds')
conflicts=('c-evo')
source=("$pkgname-$pkgver.data.deb::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_10/all/c-evo-data_285+dfsg.6-3_all.deb"
       "$pkgname-$pkgver.stdai.deb::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_10/amd64/c-evo-stdai_285+dfsg.6-3_amd64.deb"
        "$pkgname-$pkgver.gtk2.deb::https://download.opensuse.org/repositories/home:/PeterBBB/Debian_10/amd64/c-evo-gtk2_285+dfsg.6-3_amd64.deb")
sha256sums=('afc232b8e80c94ef2c4986ce391f7bdd0c07b4f2a764b68e84491e0fb63add23'
            'bbf143d72286bd98a7f9c966e9874638fd9fc3f87666d4533f428b197dcd8839'
            '196c340b63e19907fc8c7818b8556955d11b4bb08ebec79b5e8dfbaeca74ba27')

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
   
   # Remove Debian stuff not needed here
   rm -fr usr/share/doc-base
   rm -fr usr/share/lintian
   rm -fr usr/share/doc/c-evo-gtk2
   rm -fr usr/share/doc/c-evo-stdai
   
   # Arch does not use a games folder
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

