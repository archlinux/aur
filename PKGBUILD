# Maintainer: Guillaume Koehl <opengk@protonmail.com>
# Contributor: ivanich
pkgname=kodi-addon-inputstream-ffmpegdirect-git
pkgver=21.2.0.Omega.r6.g57fe4ac
pkgrel=1
pkgdesc="Inputstream ffmpegdirect kodi plugin - Omega version"
arch=('any')
url="https://github.com/xbmc/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'git' 'autoconf' 'automake' 'patch' 'nasm' 'pkgconf')
provides=('kodi-addon-inputstream-ffmpegdirect-git')
depends=('kodi-git')
#options=('lto')
source=("$_gitname-$_kodiver-$_kodiname::git+https://github.com/xbmc/inputstream.ffmpegdirect.git#branch=$_kodiname"
	"xbmc-$_kodiname-$_kodiver::git+https://github.com/xbmc/xbmc.git#tag=$_kodiver-$_kodiname")
sha256sums=('SKIP'
	    'SKIP')
_kodiname=Omega
_gitname=inputstream.ffmpegdirect
_kodiver=21.0b2

pkgver() {

    cd "$_gitname-$_kodiver-$_kodiname" || exit
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    echo -e "Targeting \"$CARCH\" architecture..."
    if [[ $CARCH == 'aarch64' ]]; then
	echo -e "\e[0;31mLink Time Optimization (LTO) is required for $CARCH architecture!"
	echo -e " => https://github.com/xbmc/inputstream.ffmpegdirect/issues/89 \033[0m"
	local _lto_pkgbuild_optio="$(\grep -E '^options=' ../PKGBUILD | \grep -c 'lto')"
	local _lto_makepkg_cflags="$(\grep -vE '^#' /etc/makepkg.conf | \grep -cE '\-flto[^=]')"
	local _lto_makepkg_option="$(\grep -vE '^#' /etc/makepkg.conf | \grep 'OPTIONS=' | \grep -c ' lto)')"
	[[ "$_lto_pkgbuild_optio" -ne 0 ]] && echo -e " => LTO flag seems to be set in PKGBUILD as options=('lto')"
	[[ "$_lto_makepkg_cflags" -ne 0 ]] && echo -e " => LTO flag seems to be set in /etc/makepkg.conf CFLAGS=..."
	[[ "$_lto_makepkg_option" -ne 0 ]] && echo -e " => LTO flag seems to be set in /etc/makepkg.conf OPTIONS=(...)"
	if [[ "$_lto_pkgbuild_optio" -ne 0 || "$_lto_makepkg_cflags" -ne 0 || "$_lto_makepkg_option" -ne 0 ]]; then
	    echo -e " => The build should be okay as lto is active.\n"
	else
	    echo -e "\e[0;31m => Warning, architecture is $CARCH and lto is not set!"
	    echo -e " => The build will break. Choose one of the following options to fix it:"
	    echo -e "	* Uncomment options=('lto') in the PKGBUILD"
	    echo -e "	* Edit /etc/makepkg.conf to add -flto CFLAG"
	    echo -e "	* Edit /etc/makepkg.conf to uncomment lto in OPTIONS\n\033[0m"
	    sleep 1
	    exit
	fi
    else
	echo -e "\nArchitecture is not aarch64, but $CARCH. No worries during built !\n"
    fi
    [[ -d "$_gitname-$_kodiver-$_kodiname/build" ]] && rm -r "$_gitname-$_kodiver-$_kodiname/build"
    echo -e "Creating build directory..."
    mkdir -v -p "$_gitname-$_kodiver-$_kodiname/build"
}

build() {
    cd "$_gitname-$_kodiver-$_kodiname/build" || exit

    cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=1 \
    -DADDONS_TO_BUILD=${_gitname} \
    -DADDONS_SRC_PREFIX=../.. \
    ../../xbmc-${_kodiname}-${_kodiver}/cmake/addons
    make
}

package() {
    cd "$_gitname-$_kodiver-$_kodiname/build" || exit
    install -d "$pkgdir/usr"
    mv .install/lib "$pkgdir/usr/"
    mv .install/share "$pkgdir/usr/"
}
