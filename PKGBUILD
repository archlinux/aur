pkgname=antimicro-git
_name=${pkgname%%-git}
pkgver=2.23.r14.gecec251
pkgrel=2

pkgdesc='Map keyboard and mouse actions to gamepad buttons, inspired by qjoypad.'
url='https://github.com/antimicro/antimicro'
arch=('i686' 'x86_64')
license=('GPL3')

depends=('libxtst' 'qt5-base' 'sdl2')
makedepends=('git' 'cmake' 'qt5-tools' 'itstool')

provides=( "$_name" )
conflicts=( "$_name" )

source=('git://github.com/antimicro/antimicro')
install='antimicro-git.install'

md5sums=('SKIP')

pkgver() {
	cd "$_name"
	git describe | sed 's/-/.r/; s/-/./'
}


prepare() {
	read -p '
Use fix suggested by rakuco via AUR'"'"'s frealgagu? (Do not call QT5_WRAP_CPP.)
>	See: https://github.com/AntiMicro/antimicro/pull/207/files
>	Fix: sed -i "/QT5_WRAP_CPP/d" "${srcdir}/${_name}/CMakeLists.txt"
[y/n]?
' C
	[[ "$C" =~ 'y' ]]	&&	{
		set -x;
		sed -i "/QT5_WRAP_CPP/d" "${srcdir}/${_name}/CMakeLists.txt";
		set +x;
	}	||	{
		echo "NOT sedding...";
	}
}


build() {
	cd "$_name"
	cmake -DCMAKE_INSTALL_PREFIX=/usr	\
		-DUSE_SDL_2=ON							\
		-DWITH_XTEST=ON						\
		-DWITH_UINPUT=ON						\
		-DAPPDATA=ON
	make
}

package() {
	cd "$_name"
	make DESTDIR="$pkgdir" install
}
