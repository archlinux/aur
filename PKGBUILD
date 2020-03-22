# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# For ISSUES, REQUESTS, and QUESTIONS:
# https://github.com/sudoforge/pkgbuilds

pkgname=copybara-git
pkgver=0.0.0.bf7649f9
pkgrel=2
pkgdesc="A tool for transforming and moving code between repositories"
arch=('x86_64')
url="https://github.com/google/${pkgname%-git}"
license=('Apache')
depends=(
  'java-environment'
  'git'
)
makedepends=(
  'bazel'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "git+${url}.git"
  "copybara.sh"
)
sha256sums=('SKIP'
            '53d9cd732ecf7267c883a5f5e304429548b6aa8ce8d1038966c5cf83929d52d1')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"

  # Use the latest hash for versioning, formatting as 0.0.0.<hash>
  git log -1 --format='%h' | sed -e 's/\(.*\)/0.0.0.\1/'
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  # Build the "uberjar"
  bazel build //java/com/google/copybara:copybara_deploy.jar
}

package() {
  # Install the wrapper script
  install -D -m 755 \
     "${srcdir}/copybara.sh" \
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
