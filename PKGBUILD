# Maintainer: meow <sosdjolfkhgsldjkfh@gmail.com>
# Contributor: cookie <coookieuniverse@gmail.com>
# Contributor: Stella <stellarinfinity@riseup.net>
# this is based off https://aur.archlinux.org/packages/danser-git

pkgname=danser-git-no-surprise
url="https://github.com/Wieku/danser-go"
pkgver=0.11.0.r0.g8331b0ff
pkgrel=2
pkgdesc="Dancing visualizer of osu! maps and custom osu! client written in Go (git version), now with the unfunny rick roll removed"
arch=('x86_64')
license=('GPL3')
source=("git+https://github.com/Wieku/danser-go.git"
        "remove_surprise.patch")
conflicts=('danser' 'danser-git')
sha256sums=('SKIP'
            '19cd3cc4ae7779370ef620b1e8ddb8d6169bb8104ffdac3ae3fb55605ccf7106')
depends=(
    'libyuv'
    'ffmpeg'
    'gtk3'
)
makedepends=(
    'xorg-server-devel'
    'libxi'
    'libxinerama'
    'libxrandr'
    'go>=1.17'
    'git'
    'gcc'
)

pkgver() {
    cd "${srcdir}/danser-go"
    git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/danser-go"
    git checkout dev
	
	echo "applying patches..."
	patch -uN --verbose "./app/app.go" "../remove_surprise.patch"
	echo "done applying patches!"
}

build() {
    cd "${srcdir}/danser-go"

    # build the library first for the gui and the hollowed out cli
    go build \
        -trimpath \
        -modcacherw \
        -mod=readonly \
        -ldflags "-s -w -X 'github.com/wieku/danser-go/build.VERSION=$pkgver'
            -X 'github.com/wieku/danser-go/build.Stream=Release'
            -X 'github.com/wieku/danser-go/build.DanserExec=danser'" \
        -buildmode=c-shared \
        -o danser-core.so \
        -v -x

    mv danser-core.so libdanser-core.so

    # build the CLI
    cc -o danser -I. cmain/main_danser.c -Wl,-rpath,. -Wl,-rpath,/usr/lib/danser -L. -ldanser-core
    # build the launcher
    cc -D LAUNCHER -o danser-launcher -I. cmain/main_danser.c -Wl,-rpath,. -Wl,-rpath,/usr/lib/danser -L. -ldanser-core

	# build assets.dpak
	go run tools/assets/assets.go ./
}

package() {
    cd "${srcdir}/danser-go"
    mkdir -p "${pkgdir}/usr/lib/danser" "${pkgdir}/usr/bin"

    install -Dm755 libdanser-core.so libbass.so libbass_fx.so libbassmix.so assets.dpak "${pkgdir}/usr/lib/danser"
    cp -r "assets" "${pkgdir}/usr/lib/danser/assets"
    chmod 755 "${pkgdir}/usr/lib/danser/assets"

    install -Dm755 danser "${pkgdir}/usr/lib/danser/danser"
    install -Dm755 danser-launcher "${pkgdir}/usr/lib/danser/danser-gui"

    ln -s "/usr/lib/danser/danser" "${pkgdir}/usr/bin/danser"
    ln -s "/usr/lib/danser/danser-gui" "${pkgdir}/usr/bin/danser-gui"
}
