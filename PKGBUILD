# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=q2pro-git
pkgver=r1713
pkgrel=1
pkgdesc="An enhanced Quake 2 client and server (Git/source build)"
arch=( 'i686' 'x86_64' )
url="http://skuller.net/q2pro/"
license=( 'GPL2' )
depends=( 'sdl' 'zlib' )
optdepends=('quake2: additional mods (symlink to ~/.q2pro)')
makedepends=('libpng12' 'libjpeg6-turbo' 'curl' 'openal')
_pkgname=q2pro
conflicts=('q2pro')
install=q2pro.install
changelog=
noextract=()
source=("q2pro::git+https://github.com/AndreyNazarov/q2pro.git")
# see https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git_Submodules if you require git submodules
sha512sums=('SKIP')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  # no tags, so number of revisions e.g. r1142.a17a017
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  printf "r%s" "$(git rev-list --count HEAD)"
  ## most recent annotated tag e.g. 2.0.r6.ga17a017
  #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  ## most recent un-annotated tag e.g. 0.71.r115.gd95ee07
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  ## or:
  ##git describe --long --tags | sed 's/-/.r/;s/-/./'
  ## project uses tags with prefix. e.g. v...
  #git describe --long | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
  ## both with fallback, e.g. 0.9.9.r27.g2b039da with tags, else r1581.2b039da
  #( set -o pipefail
  #  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  #  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #)
}
build() {
	cd "${srcdir}/${_pkgname}"
	make clean
        if [ ! -f VERSION ];
        then
                echo "${pkgver}" > VERSION
        fi
	# TODO: maybe just distribute a .config as part of the snapshot tarball?
	cp ${srcdir}/${_pkgname}/doc/examples/buildconfig ${srcdir}/${_pkgname}/.config
	# note: VARIABLE_SERVER_FPS is experimental
	for opt in PNG JPEG HTTP OPENAL DIRECT_SOUND DIRECT_INPUT X11 ANTICHEAT_SERVER MVD_SERVER MVD_CLIENT X86_GAME_ABI_HACK VARIABLE_SERVER_FPS PATH_HOME;
	do
		optname=CONFIG_${opt}
		sed -i -re "s/^[[:space:]]*#[[:space:]]*(${optname}[[:space:]]*=.*)/\1/g" ${srcdir}/${_pkgname}/.config
	done
	# Paths
	for pathname in DATA LIB;
	do
		pathname=CONFIG_PATH_${pathname}
		sed -i -re "s/^[[:space:]]*#[[:space:]]*(${pathname}[[:space:]]*=.*)/\1/g" ${srcdir}/${_pkgname}/.config
	done
	sed -i -re 's@/usr/local@/usr@g' ${srcdir}/${_pkgname}/.config
	sed -i -re 's@lib/games@lib@g' ${srcdir}/${_pkgname}/.config

        # TODO: see "Mouse input on Linux" in INSTALL.

        make
	make strip

}
package() {
	cd "${srcdir}/${_pkgname}"
	#make DESTDIR="${pkgdir}/" install
	install -D -m 0644 ${srcdir}/${_pkgname}/README.md ${pkgdir}/usr/share/doc/${_pkgname}/README.md
	install -D -m 0644 ${srcdir}/${_pkgname}/INSTALL.md ${pkgdir}/usr/share/doc/${_pkgname}/INSTALL.md
	cp -a ${srcdir}/${_pkgname}/doc/* ${pkgdir}/usr/share/doc/${_pkgname}/.
	install -d -m 0755 ${pkgdir}/usr/share/games/${_pkgname}/baseq2
	install -d -m 0755 ${pkgdir}/usr/lib/${_pkgname}/baseq2
	install -d -m 0755 ${pkgdir}/usr/bin
	# r1093 doesn't seem to honor manpage installation
	install -d -m 0755 ${pkgdir}/usr/share/man/man6
	gzip -c ${srcdir}/${_pkgname}/man/q2pro.6.txt > ${pkgdir}/usr/share/man/man6/q2pro.6.gz
	gzip -c ${srcdir}/${_pkgname}/man/q2proded.6.txt > ${pkgdir}/usr/share/man/man6/q2proded.6.gz
	install -D -m 0644 ${srcdir}/${_pkgname}/src/client/ui/q2pro.menu ${pkgdir}/usr/share/games/${_pkgname}/baseq2/q2pro.menu
	cp -a ${srcdir}/${_pkgname}/game*.so ${pkgdir}/usr/lib/${_pkgname}/baseq2/.
	cp -a ${srcdir}/${_pkgname}/${_pkgname}{,ded} ${pkgdir}/usr/bin/.
}
