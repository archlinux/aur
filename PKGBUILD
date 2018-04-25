# Maintainer: Eden Rose <eenov1988 (at) gmail (dot) com>
# Maintainer(htop-git): Yardena Cohen <yardenack at gmail dot com>
# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Blair Bonnett <blair.bonnett at gmail dot com>


gitname=htop
pkgname=${gitname}-temperature-git
pkgver=1057.04cc193
pkgrel=1
pkgdesc="Interactive text-mode process viewer"
url="https://github.com/hishamhm/${gitname}"
license=('GPL')
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
depends=('ncurses' 'libnl' 'lm_sensors')
makedepends=('git' 'python2')
optdepends=('lsof: list open files for running process'
            'strace: attach to running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=("git+${url}.git"
"0001-fix-option-string.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0001-fix-option-string.patch?h=packages/htop"
"htop-temperature.patch::https://aur.archlinux.org/cgit/aur.git/plain/htop-temperature.patch?h=htop-temperature")
sha256sums=('SKIP'
			'SKIP'
			'a4c9dfbc3c2f7e08904656b53b9c08d19014cf6238fb75f1ed5ecbef2905964c')

pkgver() {
	 cd "${srcdir}/${gitname}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

prepare() {
	 cd "${srcdir}/${gitname}"
	 
	   patch -Np1 < "$srcdir"/0001-fix-option-string.patch

	# Add CPU temperature patch.
	   patch -Np1 < "$srcdir"/htop-temperature.patch

	CC="gcc"
	CXX="g++"
	
	 ./autogen.sh

	 ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
		--enable-cgroup \
		--enable-delayacct \
        --enable-unicode \
        --enable-openvz \
        --enable-vserver \
        --enable-cgroup
}

build() {
	 cd "${srcdir}/${gitname}"
	 make $MAKEFLAGS
}

package() {
	 cd "${srcdir}/${gitname}"
	 make DESTDIR="${pkgdir}" install
}
