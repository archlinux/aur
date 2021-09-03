# Maintainer: Batou <batou at cryptolab dot net>
# Maintainer: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>
pkgname=tifig-git
pkgver=r83.60b920c
pkgrel=1
pkgdesc="A fast High Efficiency Image File Format (HEIF/HEIC) converter"
arch=('x86_64')
url="https://github.com/monostream/tifig"
license=('Apache')
depends=('ffmpeg>=3.1' 'libvips>=8.6')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	'01-limits.patch'
	'git+https://github.com/monostream/tifig.git'
	'git+https://github.com/monostream/heif.git'
	'git+https://github.com/jarro2783/cxxopts.git'
)
sha1sums=(
	'2e095817eca65e4957f15520ef2559481d552c8c'
	'SKIP'
	'SKIP'
	'SKIP'
)

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
  git apply --directory=lib/cxxopts/ "$srcdir/${source[0]}"
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "build" && cd "build"
	cmake .. \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_SKIP_RPATH=TRUE \
		-Wno-dev
	# printf "\ncd %s; cmake-gui ..\n\n" "$PWD"; return 1
	make # VERBOSE=1
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}
