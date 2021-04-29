# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

_pkgname=buildtools
pkgname=buildozer
pkgver=4.0.1
pkgrel=2
pkgdesc="A command line tool to rewrite Bazel BUILD files using standard conventions"
arch=('x86_64')
license=('Apache')
url="https://github.com/bazelbuild/buildtools"
makedepends=(
  'bazel'
  'git'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
  "0001-copy-buildozer-target-output.patch"
)
md5sums=('36b64ea6b3da3c8e16ecb2feb9bf467f'
         '478c43739dbc4e5bd882fb7879b990ae')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  for f in "${source[@]}"; do
    [[ "$f" =~ \.patch$ ]] && \
    ( \
      patch -p1 -i "${srcdir}/${f}" > /dev/null 2>&1 ||\
      ( \
        echo "failed to apply patch: $(basename ${f})" && \
        exit 1 \
      ) \
    )
  done
}


build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  bazel build "//${pkgname}:${pkgname}-linux"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Install the license file
  install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/buildozer/LICENSE"

  # Install the binary
  install -D -m 0755 \
    "./bazel-bin/${pkgname}/${pkgname}-linux_amd64" \
    "${pkgdir}/usr/bin/buildozer"
}
