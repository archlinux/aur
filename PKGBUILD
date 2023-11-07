# Maintainer: Christian Hesse <mail@eworm.de
# Contributor: Eric Bélanger <eric@archlinux.org> ([extra] package)

pkgname=putty-git
pkgver=0.79.r174.g7b10e34b
pkgrel=1
pkgdesc='A terminal integrated SSH/Telnet client - git checkout'
arch=('i686' 'x86_64')
url='https://www.chiark.greenend.org.uk/~sgtatham/putty/'
license=('MIT')
depends=('gtk3')
makedepends=('git' 'cmake')
conflicts=('putty')
provides=('putty')
source=('git://git.tartarus.org/simon/putty.git'
        'putty.desktop'
        'putty.png'
        'putty.xpm')
sha256sums=('SKIP'
            '4a8af81fe8ac702ad298606076088f237b83beed82cc089a32f314888b67cf2c'
            '621abf249dc6c6326faf259565546df84635b3afbe31893145a5056d8b114396'
            'd65139883171ed0119d9778ff4a89e6a8151a5ae97fcf8dc7cafb59df424377f')

pkgver() {
	cd putty/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

build() {
  cmake -B build -S putty \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -D -m0644 "${srcdir}"/putty/LICENCE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m0644 "${srcdir}"/putty.desktop "${pkgdir}"/usr/share/applications/putty.desktop
  install -D -m0644 "${srcdir}"/putty.png "${pkgdir}"/usr/share/pixmaps/putty.png
  install -D -m0644 "${srcdir}"/putty.xpm "${pkgdir}"/usr/share/pixmaps/putty.xpm
}
