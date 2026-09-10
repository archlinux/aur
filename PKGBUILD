# Maintainer: Vassili Tchersky <vt+arch@vbcy.org>
# Maintainer: Fermin Olaiz <ferminolaiz@gmail.com>
# Contributor: SahibBommelig <sahib@online.de>

_pkgname=rmlint
pkgbase="${_pkgname}-git"
pkgname=('rmlint-git' 'rmlint-shredder-git')
pkgver=2.10.3.r497.gd3781546
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/sahib/rmlint"
license=('GPL-3.0-or-later')
_cli_makedepends=(
  'git'
  'scons'
  'pkgconf'
  'glib2-devel'
  'json-glib'
  'gettext'
  'libelf'
  'util-linux-libs'
  'python-sphinx' # manpage
)
_gui_makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
makedepends=("${_cli_makedepends[@]}" "${_gui_makedepends[@]}")

_cli_checkdepends=(
  'python-pytest'
  'python-psutil'
  'python-xattr'
  'python-xxhash'
  'python-blake3' # AUR
  'python-py-cpuinfo'
  'dash'
)
_gui_checkdepends='xorg-server-xvfb'
checkdepends=("${_cli_checkdepends[@]}" "$_gui_checkdepends")

_gui_depends=(
  'gtksourceview4'
  'hicolor-icon-theme'
  'python'
  'python-cairo'
  'python-colorlog'
  'python-gobject'
  'python-parsedatetime'
)

source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  # XXX: rename rc to pr to make 2.11.0.pr.1 < 2.11.0.r0
  git describe --long --match 'v[0-9]*.[0-9]*.[0-9]*' \
    | sed 's/^v//;s/-rc\./-pr./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_scons() {
  export
  local symbols=0
  # XXX: from pacman's scripts/libmakepkg/util/option.sh.in
  # It violates "Do not use makepkg subroutines", but I don't
  # see a simple way to do it otherwise.
  check_option debug y && symbols=1

  scons PREFIX=/usr SYMBOLS=$symbols "$@"
}

build() {
  cd "$srcdir/$_pkgname"
  _scons
}

check() {
  cd "$srcdir/$_pkgname"
  _scons test PYTEST_ARGS="-m 'not slow and not manpage' --ignore=tests/test_gui"

  # GUI tests:

  local pkg gui=0
  for pkg in "${pkgname[@]}"; do
    if [[ $pkg == 'rmlint-shredder-git' ]]; then
      gui=1
      break
    fi
  done
  (( gui )) || return 0

  local missing
  if ! missing=$(pacman -T "${_gui_depends[@]}"); then
    printf 'skipping the GUI tests, missing deps: %s\n' "${missing//$'\n'/ }" >&2
    return 0
  fi

  xvfb-run -a pytest tests/test_gui
}

package_rmlint-git() {
  pkgdesc="Tool to remove duplicates and other lint, being much faster than fdupes"
  depends=(
    'glib2'
    'json-glib'
    'libelf'
    'util-linux-libs'
  )
  provides=("$_pkgname=$pkgver")
  conflicts=("$_pkgname")

  cd "$srcdir/$_pkgname"
  _scons DESTDIR="$pkgdir" install-cli
}

package_rmlint-shredder-git() {
  arch=('any')
  pkgdesc="Graphical user interface for rmlint"
  depends=("${_gui_depends[@]}" "rmlint-git=$pkgver")
  optdepends=(
    'polkit: lint/delete files that are not self-owned'
    'librsvg: render the application icon'
    'xdg-utils: open files in your preferred application'
  )
  provides=("rmlint-shredder=$pkgver")
  conflicts=('rmlint-shredder')

  cd "$srcdir/$_pkgname"
  _scons DESTDIR="$pkgdir" install-gui
}
