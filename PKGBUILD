# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# For ISSUES, REQUESTS, and QUESTIONS:
# https://github.com/sudoforge/pkgbuilds

_pkgname=buildtools
pkgname=buildozer
pkgver=4.2.5
pkgrel=1
pkgdesc='A command line tool to rewrite Bazel BUILD files using standard conventions'
arch=('x86_64')
license=('Apache')
url='https://github.com/bazelbuild/buildtools'
makedepends=('git')
_bazelisk_pkgver=1.11.0
source=(
  "bazelisk-bin-${_bazelisk_pkgver}::https://github.com/bazelbuild/bazelisk/releases/download/v${_bazelisk_pkgver}/bazelisk-linux-amd64"
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
  "0001-copy-buildozer-target-output.patch"
)
sha256sums=('231ec5ca8115e94c75a1f4fbada1a062b48822ca04f21f26e4cb1cd8973cd458'
            'd368c47bbfc055010f118efb2962987475418737e901f7782d2a966d1dc80296'
            '68ae2f6ec82afb45baf89c264438c86db35031368b061d8c92036c341f6eb3b1')

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

  chmod +x "${srcdir}/${source[0]%%::*}"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  "${srcdir}/${source[0]%%::*}" build "//${pkgname}:${pkgname}-linux"
  "${srcdir}/${source[0]%%::*}" shutdown
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
