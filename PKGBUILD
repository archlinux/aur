# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# For ISSUES, REQUESTS, and QUESTIONS:
# https://github.com/sudoforge/pkgbuilds

_pkgname=buildtools
pkgname=buildozer
pkgver=4.2.2
pkgrel=2
pkgdesc='A command line tool to rewrite Bazel BUILD files using standard conventions'
arch=('x86_64')
license=('Apache')
url='https://github.com/bazelbuild/buildtools'
makedepends=('git')
_bazelisk_pkgver=1.8.1
source=(
  "bazelisk-bin-${_bazelisk_pkgver}::https://github.com/bazelbuild/bazelisk/releases/download/v${_bazelisk_pkgver}/bazelisk-linux-amd64"
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
  "0001-copy-buildozer-target-output.patch"
)
sha256sums=('4a7652ffe904ccb064aaa7db41c456e742e507e574f58a602edbbc32920ed79b'
            'ae34c344514e08c23e90da0e2d6cb700fcd28e80c02e23e4d5715dddcb42f7b3'
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
