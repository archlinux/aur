_basepgkname=llamafile
pkgname="${_basepgkname}"
pkgver=0.8.13
pkgrel=1
pkgdesc="Distribute and run LLMs with a single file."
arch=('x86_64')
url="https://github.com/Mozilla-Ocho/llamafile"
license=('Apache-2.0')
optdepends=(
	'hip-runtime-amd: AMD GPU-Offloading Support'
  'hipblas: Used for static compiling with rocm'
  'rocminfo: Used for verifying existance of rocm'
	'cuda: Nvidia GPU-Offloading Support'
	)
source=(    "${pkgname}::https://github.com/Mozilla-Ocho/llamafile/releases/download/${pkgver}/llamafile-${pkgver}.zip"
       )

sha256sums=(
            '672f3661f2f4a2f7a6b692f04cd9b662cdf77a5193a62771c3432cb4d420dea7'
           )

provides=(  
            'llamafile'
            'llamafile-bench'
            'llamafile-imatrix'
            'llamafile-convert'
            'llamafile-perplexity'
            'llamafile-quantize'
            'llamafile-tokenize'
            'llava-quantize'
            'llamafile-upgrade-engine'
            'zipalign'
        )
conflicts=('llamafile-git' 'android-sdk-build-tools' 'zipalign')
options=(!strip)



package() {

  cd "${srcdir}"

  bin_dir="${_basepgkname}-${pkgver}/bin"

  pushd $bin_dir

  for binary in $(find . -type f); do
    binary_name=$(basename "$binary")
    install -Dm755 "$binary" "${pkgdir}/usr/bin/${binary_name}"
  done

  popd

  man_dir="${_basepgkname}-${pkgver}/share/man"

  pushd $man_dir
  for man_page in $(find . -type f); do
    man_page_name=$(basename "$man_page")
    install -Dm644 "$man_page" "${pkgdir}/usr/share/man/man1/${man_page_name%.*}.1"
  done
  popd
}
