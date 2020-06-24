# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Faye Jackson <justalittleepsilon@gmail.com>
pkgname=pleroma
pkgver=2.0.7
pkgrel=1
_tagver="v$pkgver"
pkgdesc="The Pleroma Server (ActivityPub Compatible)"
arch=(x86_64 aarch64 armv7l)
license=('AGPL')
depends=(ncurses)
optdepends=('postgresql: Pleroma Database for storage')
makedepends=(unzip curl)
provides=(pleroma)
conflicts=(pleroma-git)

FLAVOUR=$(arch="$(uname -m)";if [ "$arch" = "x86_64" ];then arch="amd64";elif [ "$arch" = "armv7l" ];then arch="arm";elif [ "$arch" = "aarch64" ];then arch="arm64";else echo "Unsupported arch: $arch">&2;fi;if getconf GNU_LIBC_VERSION>/dev/null;then libc_postfix="";elif [ "$(ldd 2>&1|head -c 9)" = "musl libc" ];then libc_postfix="-musl";elif [ "$(find /lib/libc.musl*|wc -l)" ];then libc_postfix="-musl";else echo "Unsupported libc">&2;fi;echo "$arch$libc_postfix")

source=("pleroma.zip::https://git.pleroma.social/api/v4/projects/2/jobs/artifacts/stable/download?job=$FLAVOUR" "pleroma.sysusers")
md5sums=('SKIP' 'SKIP')
install=pleroma.install

prepare() {
	cd $srcdir
}

package() {
	cd $srcdir

	mkdir -p "${pkgdir}/opt/pleroma"
	cp -r release/* "${pkgdir}/opt/pleroma"
	install -Dm 644 pleroma.sysusers "${pkgdir}/usr/lib/sysusers.d/pleroma.conf"
}
