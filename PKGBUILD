_UpstreamPkgName=VCEEnc
pkgname=${_UpstreamPkgName,,}
pkgver=9.13
pkgrel=1
pkgdesc="AMD Video Codec based command line encoder"
arch=('x86_64')
url="https://github.com/rigaya/$_UpstreamPkgName"
license=('MIT')
depends=('ffmpeg' 'libass' 'vapoursynth' 'libdovi' 'libhdr10plus-rs' 'amf-amdgpu-pro')
makedepends=('git' 'gcc' 'cargo-c' 'amf-headers' 'opencl-headers' 'vulkan-headers' 'meson' 'patch' 'cmake')
source=(git+${url}.git#tag=${pkgver}
        git+https://github.com/tplgy/cppcodec.git
        git+https://github.com/clMathLibraries/clRNG.git
        git+https://github.com/cubicdaiya/dtl
	0001-fix-Use-system-AMF-headers-instead-of-submodules.patch)
sha256sums=('33327a5c5cb8820d3cf8396a294459e4b63c1c824b8eb345921dda9bec02c687'
            'SKIP'
            'SKIP'
            'SKIP'
            'a65ed291ab67be8bf43ec8d525023fa98f97ec74b26559db5ec9785c663d6a31')

prepare() {
  cd $_UpstreamPkgName
  git rm AMF
  git submodule init
  git config --local submodule.cppcodec "$srcdir/cppcodec"
  git config --local submodule.clRNG "$srcdir/clRNG"
  git config --local submodule.dtl "$srcdir/dtl"
  git -c protocol.file.allow=always submodule update

  patch --forward --strip=1 --input="${srcdir}/0001-fix-Use-system-AMF-headers-instead-of-submodules.patch"

  meson setup ./build --buildtype=release --prefix=/usr -Dlibass_static=false
}

build() {
  cd $_UpstreamPkgName

  meson compile -C ./build
}

package() {
  cd $_UpstreamPkgName

  DESTDIR="${pkgdir}" meson install -C ./build

  # since it is MIT we need to install a license file
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${_UpstreamPkgName}_license.txt
  # install documentation
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" ${_UpstreamPkgName}C_Options.* Readme.*
}
