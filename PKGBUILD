# Maintainer: Andrej Halveland (SnipeX_) <andrej.halv@gmail.com>

pkgname=zotify-git
_pkgname=zotify
pkgver=r78.ff527fe
pkgrel=3
pkgdesc="A fast and customizable music and podcast downloader."
arch=('x86_64')
url="https://zotify.xyz/zotify/zotify"
license=('custom')
depends=(
  'python'
  'python-librespot'
  'python-music-tag'
  'python-pillow'
  'python-protobuf'
  'python-tabulate'
  'python-tqdm'
  'python-ffmpy'
  'python-pwinput'
  'python-mutagen'
)
makedepends=(
  'git'
  'python-setuptools'
  'python-build'
  'python-wheel'
  'python-installer'
)
provides=('zotify')
conflicts=('zotify')
source=("${_pkgname}::git+https://zotify.xyz/zotify/zotify")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  mkdir -p "${pkgdir}/usr/bin"

  cat <<EOF >"${pkgdir}/usr/bin/zotify"
#!/bin/sh
python -m zotify \$@
EOF

  chmod +x "${pkgdir}/usr/bin/zotify"
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
