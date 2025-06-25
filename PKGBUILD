# Maintainer: bemxio <bemxiov at protonmail dot com>

_pkgname=fastvideods-encoder
pkgname="${_pkgname}-git"

pkgdesc="Encoder for the FastVideoDS format (git version)"

pkgver=r2.1a25c4f
pkgrel=5
epoch=1

arch=(i686 x86_64)

url="https://github.com/Gericom/FastVideoDSEncoder"
#license=("LicenseRef-unknown")

depends=(dotnet-runtime-6.0 ffmpeg5.1)
makedepends=(git dotnet-sdk)

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=("git+${url}.git")
md5sums=(SKIP)

pkgver() {
  	# move to the source directory
	cd FastVideoDSEncoder
  	
	# use the number of revisions since beginning of the history
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	# move to the source directory
	cd FastVideoDSEncoder

	# fix the FFmpeg library path
	sed -i "s|ffmpeg.RootPath = .*|ffmpeg.RootPath = \"/usr/lib\";|" FastVideoDSEncoder/FFMpegDecoder.cs
}

build() {
	# move to the source directory
	cd FastVideoDSEncoder

	# build the project
	dotnet publish FastVideoDS.sln --configuration Release --output Build/
}

package() {
	# move to the build directory
	cd FastVideoDSEncoder/Build

	# copy the binaries to the package directory
	find . -type f \
		-path './x64/*' -prune -or \
		-exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/{}" \;

	# create the directory for symlinks
	mkdir -p "${pkgdir}/usr/bin"

	# set correct permissions for the executables
	chmod +x "${pkgdir}/usr/share/${_pkgname}/FastVideoDSEncoder"
	chmod +x "${pkgdir}/usr/share/${_pkgname}/FastVideoDSInfo"

	# create a symlink to the executables
	ln -s "/usr/share/${_pkgname}/FastVideoDSEncoder" "${pkgdir}/usr/bin/FastVideoDSEncoder"
	ln -s "/usr/share/${_pkgname}/FastVideoDSInfo" "${pkgdir}/usr/bin/FastVideoDSInfo"

	# copy the readme file
	install -Dm644 ../readme.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
