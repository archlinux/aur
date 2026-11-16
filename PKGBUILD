# Maintainer: JasonLandbridge
# Contributor: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>

_pkgname=hadolint
pkgname=hadolint-git
pkgver=2.15.1.r51.g1d901b9
pkgrel=1
pkgdesc='Dockerfile linter, validate inline bash'
url='https://github.com/hadolint/hadolint'
license=('GPL-3.0-only')
_commit=1d901b9c0b0d0445d19b1a9128d89fa55bb4604e # renovate: datasource=git-refs depName=https://github.com/hadolint/hadolint branch=master
source=("git+https://github.com/hadolint/hadolint.git#commit=${_commit}"
        'stack.yaml')
sha256sums=('721beb549ea40cf9facddc6dc73110a53d328ccdb6a3a6627b25792bd70ef189'
            '25fb7ff50356d0e3d9b29c7b6c21bf3da8aa0c5f8b9b7ddddefdb597df531a15')
arch=('x86_64' 'aarch64')
depends=('glibc' 'gmp' 'libffi' 'zlib')
makedepends=('git' 'stack')
provides=('hadolint')
conflicts=('hadolint')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  [ ${PIPESTATUS[0]} -eq 0 ] || \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp "${srcdir}/stack.yaml" "${srcdir}/${_pkgname}/stack.yaml"
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Arch's GHC is older than upstream requires; Stack supplies the snapshot compiler.
  stack build hadolint:exe:hadolint
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 "$(stack path --local-install-root)/bin/hadolint" "${pkgdir}/usr/bin/hadolint"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
