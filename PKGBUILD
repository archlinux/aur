# Maintainer:  Travis Collins <erbrecht at pobox dot com>
# Contributor: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

# Note: The upstream maintainer does not allow ANY modifications
# to the source code. Please refrain from doing so.
# https://lists.archlinux.org/pipermail/aur-general/2021-May/036230.html

pkgname=noisetorch
pkgver=0.12.2
pkgrel=1
pkgdesc='Real-time microphone noise suppression on Linux.'
arch=('x86_64')
url=https://github.com/noisetorch/NoiseTorch
license=('GPL3')
depends=('pulseaudio' 'polkit' 'hicolor-icon-theme')
makedepends=('go' 'cmake' 'git')
provides=('noisetorch')
install="${pkgname}.install"
source=(
    "$pkgname::git+https://github.com/noisetorch/NoiseTorch.git#tag=v${pkgver}"
    "git+https://github.com/noisetorch/c-ringbuf.git"
    "git+https://github.com/noisetorch/rnnoise.git"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP')


prepare() {
    cd "$pkgname"

    git submodule init
    git config submodule."c/c-ringbuf".url "${srcdir}/c-ringbuf"
    git config submodule."c/rnnoise".url "${srcdir}/rnnoise"
    git submodule update
}

build() {
    cd "$pkgname"

	export GOPATH="$srcdir/go"

    pushd "c/ladspa"
	make
    popd

	vendor_flags="-X main.version=${pkgver} -X main.distribution=archlinux"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go generate
	go build -ldflags "$vendor_flags -linkmode=external" -o bin/noisetorch
	go clean -modcache
}

package() {
	cd "$pkgname"

	install -D -m755 bin/noisetorch "${pkgdir}/usr/bin/noisetorch"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 assets/noisetorch.desktop "${pkgdir}/usr/share/applications/noisetorch.desktop"
	install -D -m644 assets/icon/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/icon-LICENSE"
	install -D -m644 assets/icon/noisetorch.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"
}
