# Maintainer: Batou <batou at cryptolab dot net>
pkgname=tifig-git
pkgver=r73.7dea067
pkgrel=1
pkgdesc="A fast High Efficiency Image File Format (HEIF/HEIC) converter"
arch=('x86_64')
url="https://github.com/monostream/tifig"
license=('Apache')
depends=('ffmpeg' 'vips')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	'git+https://github.com/monostream/tifig.git'
	'git+https://github.com/monostream/heif.git'
	'git+https://github.com/jarro2783/cxxopts.git'
)
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  local submodules=(
    'lib/heif'
    'lib/cxxopts'
  )
  for submodule in "${submodules[@]}"; do
    git submodule init "$submodule"
    git config "submodule.$submodule.url" "$srcdir/${submodule##*/}"
    git submodule update "$submodule"
  done
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "build" && cd "build"
	cmake ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}
