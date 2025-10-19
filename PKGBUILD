# Maintainer: dreieck

_pythonvariant="python2" # Dowload and build a Python2 variant.
# _pythonvariant="python3" # Download and build a Python3 fork. (2025-11-19: Does not really work.)

_pkgname=keyboardlayouteditor
pkgname="${_pkgname}"-git
pkgver=1.1+r100.20190121.56726a3
pkgrel=1
epoch=1
pkgdesc="PyGTK programme that helps create or edit XKB keyboard layouts. ${_pythonvariant} variant."
arch=('any')
case "${_pythonvariant}" in
  'python2')
    # url="http://github.com/simos/keyboardlayouteditor" # Original repo.
    url="http://github.com/hupfdule/keyboardlayouteditor" # Fork with some fixes.
    _pythondepends=(
      'pygtk'
      'python2'
      #'python2-antlr3=3.1.2'
      'python2-antlr3-3.1.2'
      'python2-cairo'
      'python2-gobject2'
      'python2-lxml'
    )
    _pythonmakedepends=(
      #'antlr3=3.1.2'
      #'antlr3'
    )
  ;;
  'python3')
    url="https://github.com/dynga/keyboardlayouteditor" # _Partial_ python3 fork. As of 2025-11-19, I could not get it to work as python3 software.
    _pythondepends=(
      "python>=3" "python<4"
      #"python-cairo"
      #"python-gobject"
      #"python-lxml"
    )
    _pythonmakedepends=(
      'antlr3'
    )
  ;;
esac
license=('GPL3')
# To run the application, you need the python UI binding packages. For Ubuntu 14.04, the packages below are already pre-installed.
# * Cairo
# * Pango
# * GObject
# * lxml
depends=(
  "${_pythondepends[@]}"
)
makedepends=(
  'git'
  "${_pythonmakedepends[@]}"
)
optdepends=(
  'gucharmap: To open a character map and drag and drop characters.'
)
provides=(
  "${_pkgname}=${pkgver}"
)
source=(
  "${_pkgname}::git+${url}.git"
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

  echo "${_ver}+r${_rev}.${_date}.${_githash}"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

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

  case "${_pythonvariant}" in
    'python2')
      _patch_for_python2 *.py KeyboardLayoutEditor
    ;;
  esac


  _cmd cd utils
  _cmd antlr3 *.g

  case "${_pythonvariant}" in
    'python2')
      _patch_for_python2 *.py
    ;;
  esac
}

package() {
  _instbase="/opt/${_pkgname}"
  _instdir="${pkgdir}/${_instbase}"

  cd "${srcdir}/${_pkgname}"

  _cmd install -d -m755 "${_instdir}"

  _cmd cp -a * "${_instdir}/"
  _cmd rm -Rf "${_instdir}"/{.[a-zA-Z0-9_]*,utils/*.g,*.g,COPYING,README.md,TODO}

  _cmd install -D -m755 "${srcdir}/keyboardlayouteditor.sh" "${pkgdir}/usr/bin/keyboardlayouteditor"

  for _docfile in 'ChangeLog-git.txt' 'README.md' 'TODO' 'website.url'; do
    _cmd install -D -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  case "${_pythonvariant}" in
    'python2')
      for _docfile in 'screenshot.png'; do
        _cmd install -D -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
      done
    ;;
    'python3')
      true
    ;;
  esac

  _cmd install -D -m644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
