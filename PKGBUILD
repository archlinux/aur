_basepgkname=llamafile
pkgname="${_basepgkname}-bin"
pkgver=0.9.2
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
            '108a6052e803520e437960d199f79f7a9871278b2e93ebc2faf59a7155073154'
           )

provides=(  
            'llamafile'
            'llamafile-bench'
            'llamafile-convert'
            'llamafile-imatrix'
            'llamafile-perplexity'
            'llamafile-quantize'
            'llamafile-tokenize'
            'llamafile-upgrade-engine'
            'llamafiler'
            'llava-quantize'
            'localscore'
            'sdfile'
            'whisperfile'
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
    install -Dm600 "$man_page" "${pkgdir}/usr/share/man/man1/${man_page_name%.*}.1"
  done
  popd
  
  doc_dir="${_basepgkname}-${pkgver}/share/doc/llamafile"

  mkdir -p "${pkgdir}/usr/share/doc/llamafile"

  pushd $doc_dir
  for doc in $(find . -type f); do
      doc_file_name=$(basename "$doc")
      install -Dm600 "$doc" "${pkgdir}/usr/share/doc/llamafile/${doc_file_name}"
  done
  popd
}
