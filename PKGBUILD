# Maintainer: Raphael Emberger(raember) <raphael.emberger@hotmail.ch>
# Contributor: Hervé Bitteur <herve.bitteur@audiveris.com>

_pkgname=audiveris
pkgname="${_pkgname}-doc"
pkgver=5.11.0
_tag=5.11.0
_gitcommit=9e1e55cd2746037d059345881c53e6a6754bffbd
_name="${_pkgname}-${_tag/_/-}"
pkgrel=1
pkgdesc="Music score OMR engine docs"
arch=('any')
url="https://github.com/Audiveris/$_pkgname"
license=('AGPL3')
makedepends=(
  'java-environment>=25'
  'gradle'
)
optdepends=(
  'audiveris'
  'audiveris-git'
)
source=(
  "${_name}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz"
)
sha256sums=(
  'ef75203ab6cbe5d36c3bf9e0de6ac95c4bbb392f6046a23acd25bb4d5752d32b'
)

prepare() {
  # The source tarball is not a git repository, so the gradle task "getCommit"
  # (which runs `git log`) fails in a clean build environment. Replace the git
  # call with the static commit hash of this release (quickfix, as done for
  # the main package).
  sed -i "s|git log -n1 --pretty=%H -- :^../flatpak/flathub|echo ${_gitcommit}|" \
    "$srcdir/${_name}/app/build.gradle"
}

build() {
  cd "$srcdir/${_name}"
  # Only the javadoc of the app subproject is needed; this skips the test
  # suite and the distribution tasks entirely.
  gradle :app:javadoc
}

package() {
  # Installing JavaDoc
  install -dm755 "${pkgdir}/usr/share/doc"
  cp -r "$srcdir/${_name}/app/build/docs/javadoc" "${pkgdir}/usr/share/doc/$_pkgname"
}
