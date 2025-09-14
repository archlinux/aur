_UpstreamPkgName=VCEEnc
pkgname=${_UpstreamPkgName,,}
pkgver=9.00
pkgrel=1
pkgdesc="AMD Video Codec based command line encoder"
arch=('x86_64')
url="https://github.com/rigaya/$_UpstreamPkgName"
license=('MIT')
depends=('ffmpeg' 'libass' 'vapoursynth' 'libdovi' 'libhdr10plus-rs')
makedepends=('git' 'gcc' 'cargo-c' 'amf-headers' 'opencl-headers' 'vulkan-headers')
source=(git+${url}.git#tag=${pkgver}
        git+https://github.com/tplgy/cppcodec.git
        git+https://github.com/clMathLibraries/clRNG.git
        git+https://github.com/cubicdaiya/dtl
        ldflags-adjustments.patch
        fix-finding-hdr10plus.patch
        use-system-AMF-headers.patch
        fix-build-with-opencl-headers-2025.07.22.patch)
sha256sums=('1945d5c69811f5b96ff9c950f91dd0adeabb66a3ad4377d48b9eb1d879dc79e3'
            'SKIP'
            'SKIP'
            'SKIP'
            '8e6a15e88584bf1bdaa931d010c877b627c706086e449da141dedde95efc8aa4'
            '58d3b689ef7fa067d5023c44793774661bf12d65514e69136dfc79fc102bd771'
            '6a220c869f96750231b87c82faa485a38a715055b09a1de427e8b216e316390f'
            '70cdf3cc97e953ddda1010aceca52afeee4ae970b3b7c09f7275810e7ead8d93')

prepare() {
  cd $_UpstreamPkgName
  git rm AMF
  git submodule init
  git config --local submodule.cppcodec "$srcdir/cppcodec"
  git config --local submodule.clRNG "$srcdir/clRNG"
  git config --local submodule.dtl "$srcdir/dtl"
  git -c protocol.file.allow=always submodule update

  patch --forward --strip=1 --input="${srcdir}/ldflags-adjustments.patch"
  patch --forward --strip=1 --input="${srcdir}/fix-finding-hdr10plus.patch"
  patch --forward --strip=1 --input="${srcdir}/use-system-AMF-headers.patch"
  patch --forward --strip=1 --input="${srcdir}/fix-build-with-opencl-headers-2025.07.22.patch"
}

build() {
  cd $_UpstreamPkgName

  ./configure --prefix=/usr \
    --enable-lto
  make
}

package() {
  cd $_UpstreamPkgName
  make PREFIX="$pkgdir/usr" install
  # since it is MIT we need to install a license file
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${_UpstreamPkgName}_license.txt
  # install documentation
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" ${_UpstreamPkgName}C_Options.* Readme.*
}
