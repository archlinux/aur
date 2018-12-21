# Maintainer: dreieck

_pkgname=keyboardlayouteditor
pkgname="${_pkgname}"-git
pkgver=1.1+r84.d20181009.g742101b
pkgrel=1
epoch=1
pkgdesc="PyGTK programme that helps create or edit XKB keyboard layouts."
arch=('any')
url="http://github.com/simos/keyboardlayouteditor"
license=('GPL3')
# To run the application, you need the python UI binding packages. For Ubuntu 14.04, the packages below are already pre-installed.
# * Cairo
# * Pango
# * GObject
# * lxml
depends=(
  'gucharmap'
  'pygtk'
  'python2'
  'python2-antlr3=3.1.2'
  'python2-cairo'
  'python2-gobject2'
  'python2-lxml'
)
makedepends=(
  'antlr3=3.1.2'
  'git'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
source=(
  "${_pkgname}::git+git://github.com/simos/${_pkgname}.git"
  "keyboardlayouteditor.sh"
)
sha256sums=(
  "SKIP"
  "349b12f237a19f76af16082d58bf443892190faa5f741aced92e10f6e79d8761"
)

_cmd() {
  # Prints out what to be run to stdout, and then executes it.
  # The command and it's arguments is passed as argument(s).

  printf '%s' '> '; cat <<< "$@"
  "$@"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(grep '__version__' KeyboardLayoutEditor | tail -n 1 | awk -F '=' '{print $2}' | tr -d "[[:space:]]'\"")"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  _rev="$(git rev-list --count HEAD)"
  _githash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    msg2 "Error in 'pkgver()': Could not determine version."
    return 11
  fi
  if [ -z "${_date}" ]; then
    msg2 "Error in 'pkgver()': Could not determine latest commit date."
    return 11
  fi
  if [ -z "${_rev}" ]; then
    msg2 "Error in 'pkgver()': Could not determine commit count."
    return 12
  fi
  if [ -z "${_githash}" ]; then
    msg2 "Error in 'pkgver()': Could not determine git commit hash."
    return 13
  fi

  echo "${_ver}+r${_rev}.d${_date}.g${_githash}"
}

prepare() {
  cd "${srcdir}"

  msg2 "Creating 'website.url' documentation file ..."
  cat <<< "${url}" > website.url

  msg2 "Creating git commit changelog ..."
  git log --date=iso > ChangeLog-git.txt
}

build() {

  _patch_for_python2() {
    # Arguments: Tiles to check if the shabeng line needs patching.
    # It patches the shabeng-line from 'python' to 'python2', if not already done.

    ls -1 "$@" | while read _f; do
      if head -n1 "${_f}" | grep -Eq '^#!.*python[[:space:]]*$'; then
        _cmd sed -E '1s|python[[:space:]]*$|python2|' -i "${_f}"
      fi
    done
  }

  cd "${srcdir}/${_pkgname}"

  _cmd antlr3 *.g
  # _cmd java -classpath /usr/share/java/antlr-3.1.2.jar org.antlr.Tool *.g

  ### This takes too long, since each call of 'antlr3' starts a java environment. Use the 'antlr3 *.g'-call instead.
  # ls -1 *.g | while read _g; do
  #   _cmd antlr3 "${_g}"
  # done

  _patch_for_python2 *.py KeyboardLayoutEditor


  _cmd cd utils
  _cmd antlr3 *.g

  _patch_for_python2 *.py
}

package() {
  _instbase="/opt/${_pkgname}"
  _instdir="${pkgdir}/${_instbase}"

  cd "${srcdir}/${_pkgname}"

  _cmd install -d -m755 "${_instdir}"

  _cmd cp -a * "${_instdir}/"
  _cmd rm -Rf "${_instdir}"/{.[a-zA-Z0-9_]*,utils/*.g,*.g,COPYING,README.md,TODO}

  _cmd install -D -m755 "${srcdir}/keyboardlayouteditor.sh" "${pkgdir}/usr/bin/keyboardlayouteditor"

  for _docfile in 'README.md' 'TODO'; do
    _cmd install -D -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  _cmd install -D -m644 "${srcdir}/ChangeLog-git.txt" "${pkgdir}/usr/share/doc/${_pkgname}/ChangeLog-git.txt"
  _cmd install -D -m644 "${srcdir}/website.url" "${pkgdir}/usr/share/doc/${_pkgname}/website.url"

  _cmd install -D -m644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
