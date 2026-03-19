_basepgkname=llamafile
pkgname="${_basepgkname}-bin"
pkgver=0.10.0
pkgrel=1
pkgdesc="Distribute and run LLMs with a single file."
arch=('x86_64')
url="https://github.com/mozilla-ai/llamafile"
license=('Apache-2.0')
optdepends=(
	'hip-runtime-amd: AMD GPU-Offloading Support'
  'hipblas: Used for static compiling with rocm'
  'rocminfo: Used for verifying existance of rocm'
	'cuda: Nvidia GPU-Offloading Support'
	)
source=(    "${pkgname}::https://github.com/mozilla-ai/llamafile/releases/download/${pkgver}/llamafile-${pkgver}.zip"
       )

sha256sums=(
            '0e0376bcf2efe76c74ed5dc27e4f5e29e31a14162ca9e04c4c9e34645c65f6f7'
           )

provides=(  
            'llamafile'
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
