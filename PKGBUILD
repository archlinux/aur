# Maintainer: dreieck

_pymod=pyggle
_pkgname="${_pymod}"
pkgname="${_pkgname}-git"
epoch=1
pkgver=r70.20251128.961759d
pkgrel=1
pkgdesc='Python command line programme which generates a static HTML image gallery from filenames passed on the command line. It aims to do this one thing well and does not support anything else.'
url='https://finalrewind.org/projects/pyggle/'
license=(
  'BSD-2-Clause'
  #'CC0-1.0'  # This license file is present in the upstream source, but not mentioned in the python file.
  #'MIT'      # This license file is present in the upstream source, but not mentioned in the python file.
)
arch=('any')
depends=(
  'python>=3'
  'python-exifread'
  'python-pillow'
  'python-progress'
)
optdepends=(
  "python-geopy: To use 'nominatim' reverse geocoding."
)
makedepends=(
  'curl>8.7.1' # Because of https://bugs.gentoo.org/930633 / https://github.com/curl/curl/issues/13474
  'git'
)
checkdepends=()
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
options=('!emptydirs')
source=(
  "${_pymod}::git+https://git.finalrewind.org/${_pymod}"
  "patch_basedir_systemwide.patch"
)
sha256sums=(
  'SKIP'
  '2c678752c1a51496cc535f74e41752be09c911989f11dd539870ca26226d420d'
)

prepare() {
  cd "${srcdir}/${_pymod}"

  for _patch in "${srcdir}/patch_basedir_systemwide.patch"; do
    printf '%s\n' "   > Applying patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pymod}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  printf '%s\n' "r${_rev}.${_date}.${_hash}"
}

package() {
  cd "${srcdir}/${_pymod}"

  install -D -v -m755 -t "${pkgdir}/usr/bin"  bin/${_pymod}

  install -d -v -m755    "${pkgdir}/usr/lib/pyggle"
  cp -rv share "${pkgdir}/usr/lib/pyggle"/

  install -D -v -m644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log README.md
  install -D -v -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSES/BSD-2-Clause.txt
}
