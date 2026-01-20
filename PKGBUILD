# Maintainer: jwty <janoosh@catgirls.party>
# Contributor: maz-1 <ohmygod19993@gmail.com>

pkgname=deadbeef-plugin-vu-meter-git
pkgver=r22.8bca8ad
pkgrel=1
pkgdesc="VU Meter Plugin for the DeaDBeeF audio player"
url="https://github.com/jwty/ddb_vu_meter"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
depends=('deadbeef')
makedepends=('git' 'pkg-config' 'gtk2' 'gtk3')

_gitname=ddb_vu_meter
_gitroot=https://github.com/jwty/${_gitname}

source=("git+$_gitroot"
	"arch.patch")

md5sums=('SKIP'
         'e59958177871b9c4868df0b3e4ab8dbc')

pkgver() {
	cd $_gitname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_gitname
	patch -p1 vumeter.c < "$srcdir/arch.patch"
}

build() {
	cd $_gitname
	local _SILENCEWARNINGS _CFLAGSADDITIONS _warning
	_SILENCEWARNINGS=(return-mismatch incompatible-pointer-types)
	_CFLAGSADDITIONS=''
	for _warning in "${_SILENCEWARNINGS[@]}"; do
	  _CFLAGSADDITIONS+=" -Wno-${_warning} -Wno-error=${_warning}"
	done
	CFLAGS+="${_CFLAGSADDITIONS}"
	export CFLAGS
	make -j1
}

package() {
	install -D -v -c $srcdir/$_gitname/gtk2/ddb_vis_vu_meter_GTK2.so $pkgdir/usr/lib/deadbeef/ddb_vis_vu_meter_GTK2.so
	install -D -v -c $srcdir/$_gitname/gtk3/ddb_vis_vu_meter_GTK3.so $pkgdir/usr/lib/deadbeef/ddb_vis_vu_meter_GTK3.so
	install -D -v -c $srcdir/$_gitname/vumeter.png $pkgdir/usr/lib/deadbeef/vumeter.png
}
