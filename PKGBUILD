# Maintainer: satcom886 <rostik.medved@gmail.com>

pkgname=controlloid-server-git
pkgver=r23.1137a81
pkgrel=3
pkgdesc="The server for the Android app Controlloid."
arch=('x86_64' 'i686' 'armv6' 'armv7' 'aarch64')
url="https://github.com/experiment322/controlloid-server"
license=('GPLv3')
groups=()
depends=('websocketd-git' 'iproute2')
makedepends=('make' 'git' 'gcc' 'cmake')
optdepends=()
install="controlloid-server.install"
provides=('controlloid-server')
source=("controlloid-server::git+https://github.com/experiment322/controlloid-server"
        "controlloid-server.sh"
        "controlloid-server.service"
        "controlloid.sysusers"
        "77-controlloid-uinput.rules"
        "controlloid-server.install")
md5sums=('SKIP'
        '533ff33f7024a3efbf27584e01a86c79'
        '32f432c01af51b24a5382a5a0718dc61'
        '75a9fb6c38015c6da123e7633a216ec5'
        '76b1380215f173064b7c89553394c372'
        '56f0cd8f1d8bec160e35bbbdb43ae543')

pkgver() {
	cd "$srcdir/controlloid-server"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake \
    -S "$srcdir/controlloid-server/src/linux/" \
    -B "$srcdir/controlloid-server/src/linux/cmake-build-release" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX="/usr/bin/controlloid"
	make "$srcdir/controlloid-server/src/linux/cmake-build-release"
}

package() {
    install -Dm 755 "${srcdir}/controlloid-server.sh" "${pkgdir}/usr/bin/controlloid-server"
    install -Dm 644 "${srcdir}/77-controlloid-uinput.rules" "${pkgdir}/usr/lib/udev/rules.d/77-controlloid-uinput.rules"
    install -Dm 644 "${srcdir}/controlloid.sysusers" "${pkgdir}/usr/lib/sysusers.d/controlloid-server.conf"
	install -Dm 644 "${srcdir}/controlloid-server.service" "${pkgdir}/usr/lib/systemd/user/controlloid-server.service"
    cd "$srcdir/controlloid-server/src/linux/cmake-build-release"
    make DESTDIR="$pkgdir/" install
}