# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname=fastvideods-encoder-git
pkgdesc="Encoder for the FastVideoDS format"

pkgver=1.0.0
pkgrel=3

arch=(i686 x86_64)

url="https://github.com/Gericom/FastVideoDSEncoder"
license=("unknown")

depends=(dotnet-runtime ffmpeg-compat-59)
makedepends=(git dotnet-sdk)

provides=(FastVideoDSEncoder)

source=("git+https://github.com/Gericom/FastVideoDSEncoder.git" "fix-library-path.patch")
md5sums=("SKIP" "594a84df360613bbd562f4b77c743850")

prepare() {
	# move to the source directory
	cd "${srcdir}/FastVideoDSEncoder"

	# apply the patch
	patch --forward --strip 1 --input ../fix-library-path.patch
}

build() {
	# move to the source directory
	cd "${srcdir}/FastVideoDSEncoder"

	# build the project
	dotnet build FastVideoDS.sln --property:Configuration=Release --output Build/
}

package() {
	# move to the source directory
	cd "${srcdir}/FastVideoDSEncoder"

	# make the required directories
	mkdir -p "${pkgdir}/usr/share/fastvideods-encoder/"
	mkdir -p "${pkgdir}/usr/bin/"

	# copy the build files to the package directory
	install -Dm755 Build/* "${pkgdir}/usr/share/fastvideods-encoder/"

	# make a symlink to the executable
	ln -s /usr/share/fastvideods-encoder/FastVideoDSEncoder "${pkgdir}/usr/bin/FastVideoDSEncoder"
}