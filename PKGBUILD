# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# For ISSUES, REQUESTS, and QUESTIONS:
# https://github.com/sudoforge/pkgbuilds

pkgname=copybara-git
pkgver=0.0.0.r2390.g44ca710c
pkgrel=1
pkgdesc='A tool for transforming and moving code between repositories'
arch=('x86_64')
url="https://github.com/google/${pkgname%-git}"
license=('Apache')
depends=(
  'java-environment'
  'git'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
_bazelisk_pkgver=1.8.1
source=(
  "bazelisk-bin-${_bazelisk_pkgver}::https://github.com/bazelbuild/bazelisk/releases/download/v${_bazelisk_pkgver}/bazelisk-linux-amd64"
  "git+${url}.git"
  "copybara.sh"
)
sha256sums=('4a7652ffe904ccb064aaa7db41c456e742e507e574f58a602edbbc32920ed79b'
            'SKIP'
            '53d9cd732ecf7267c883a5f5e304429548b6aa8ce8d1038966c5cf83929d52d1')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"

  # Get a count of all commits in HEAD
  _count=$(git rev-list --count HEAD)

  # Use the latest hash for versioning, formatting as 0.0.0.r<count>.g<hash>
  git log -1 --format='%h' | sed -e 's/\(.*\)/0.0.0.r'$_count'.g\1/'
}

prepare() {
  chmod +x "${srcdir}/${source[0]%%::*}"
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  # Build the "uberjar"
  "${srcdir}/${source[0]%%::*}" build //java/com/google/copybara:copybara_deploy.jar
  "${srcdir}/${source[0]%%::*}" shutdown
}

package() {
  # Install the wrapper script
  install -D -m 755 \
    "${srcdir}/${source[2]}" \
    "${pkgdir}/usr/bin/copybara"

  # Install the uberjar
  install -D -m 655 \
    "${srcdir}/${pkgname%-git}/bazel-bin/java/com/google/copybara/copybara_deploy.jar" \
    "${pkgdir}/usr/bin/copybara-real"

  # Install the license
  install -D -m 644 \
    "${srcdir}/${pkgname%-git}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
