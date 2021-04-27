# Maintainer: dreieck

_pkgname=automirror
pkgname="${_pkgname}-git"
pkgdesc="An xrandr-wrapper that automatically configures the attached monitors in a mirror configuration that is optimized for the primary display and makes all other outputs scale to that."
url="https://github.com/schlomo/${_pkgname}"
arch=('any')
license=('GPL3')
epoch=0
pkgver=50_20170328.3b88aff
pkgrel=1
depends=(
  'bash'
  'sed'
  'xorg-xrandr'
)
makedepends=(
  'git'
  'ruby-ronn' # To generate manpage. Used in Makefile.
)
optdepends=(
  "libnotify: For displaying notification about the script's action."
  'zenity: For using a GUI in interactive mode.'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+git://github.com/schlomo/${_pkgname}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  printf '%s\n' "${url}" > "${srcdir}/upstream.url"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _date="$(git log -1 --format=%cd --date=format:%Y%m%d)"
  _hash="$(git rev-parse --short HEAD)"
  _ver="$(git rev-list HEAD --count --no-merges)"
  if [ -z ${_ver} ]; then
    error "Could not determine version."
    exit 1
  else
    printf '%s' "${_ver}_${_date}.${_hash}"
  fi
}

check() {
  cd "${srcdir}/${_pkgname}"
  make test
}

package() {
  # This actually also builds the manpage. But in the `Makefile` this is incorporated in the `install` target, so we have building of documentation in `package()`.
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install

  install -D -v -m644 "${srcdir}/upstream.url" "${pkgdir}/usr/share/doc/${_pkgname}/upstream.url"
  for _docfile in README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  install -d -v -m755 "${pkgdir}/usr/share/doc/${_pkgname}/tests"
  install -D -v -m755 runtests.sh "${pkgdir}/usr/share/doc/${_pkgname}/tests/runtests.sh"
  cp -rv testdata "${pkgdir}/usr/share/doc/${_pkgname}/tests/"
  ln -sv /usr/bin/automirror "${pkgdir}/usr/share/doc/${_pkgname}/tests/automirror.sh"

  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
