# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname=fastvideods-encoder-git

pkgver=1.0.0
pkgrel=1

pkgdesc="Encoder for the FastVideoDS format"
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
	cd FastVideoDSEncoder

	# apply the patch
	patch --forward --strip 1 --input ../fix-library-path.patch
}

build() {
	# move to the source directory
	cd FastVideoDSEncoder

	# build the project
	dotnet build FastVideoDS.sln --property:Configuration=Release --output Build/
}

package() {
	# move to the source directory
	cd FastVideoDSEncoder

	# make the required directories
	mkdir -p ${pkgdir}/usr/share/fastvideods-encoder/
	mkdir -p ${pkgdir}/usr/bin/

	# copy the build files to the package directory
	mv Build/* ${pkgdir}/usr/share/fastvideods-encoder/

	# make a symlink to the executable
	ln -s /usr/share/fastvideods-encoder/FastVideoDSEncoder ${pkgdir}/usr/bin/FastVideoDSEncoder
}