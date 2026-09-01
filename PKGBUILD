# Maintainer: zitro <0 at zitro dot id>

# The Python bindings for ckdl, a KDL document language parser written in C.
# Upstream carries the library and both its bindings in one repository, and
# `ckdl-git` builds the C and C++ halves of it; this builds the Python one.
#
# It depends on `ckdl-git` for nothing. Upstream's `pyproject.toml` compiles the
# library into the extension, so `_ckdl.*.so` links `libc` and `libm` and
# nothing else -- verified with `ldd`, and worth stating because a reader who
# knows the C package is here will reasonably expect a link that is not there.
# Installing both is fine; neither owns a path the other does.

_pkgname='python-ckdl'
_upstream='ckdl'
pkgname="${_pkgname}-git"
pkgver=1.0.r11.gc9c33fe
pkgrel=1

pkgdesc="Python bindings for ckdl, a KDL document language parser written in C (git version)"
# A compiled extension rather than pure Python, so not `any`.
arch=('i686' 'x86_64')
url='https://github.com/tjol/ckdl'
license=('MIT')
depends=('python' 'glibc')

# What upstream's `[build-system]` asks for, each already in the repositories.
# `ninja` is the generator scikit-build reaches for off Windows, and `cython`
# compiles the binding -- which is what the C compiler is busy with during a
# build, rather than the KDL library itself.
makedepends=(
  'git'
  'cmake'
  'cython'
  'ninja'
  'python-build'
  'python-installer'
  'python-scikit-build'
  'python-setuptools'
  'python-wheel'
)

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=("${_upstream}::git+${url}.git")
md5sums=('SKIP')
# Upstream signs its tags, and this still does not use `?signed`, for the same
# reason as my other `-git` packages: many AUR helpers carry a `devel` feature
# that refreshes the source repo without re-reading the PKGBUILD, and pulling a
# signature would break that the moment a key or a tag moved.


pkgver() {
  cd "${srcdir}/${_upstream}";

  git describe --long --tags | sed -re 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g';
}

build() {
  cd "${srcdir}/${_upstream}";

  # Upstream's root `pyproject.toml` builds the Python bindings alone, driving
  # CMake through scikit-build. The C and C++ sources `ckdl-git` installs as
  # libraries are compiled again here, into the extension, and are not installed
  # separately.
  #
  # Isolation is off because every build requirement is a system package, and a
  # sandboxed build would fetch them from PyPI instead.
  #
  # The dependency check goes with it. Upstream names `cmake` and `ninja` in
  # `[build-system] requires`, where they are PyPI wrappers around the binaries;
  # `build` looks for installed Python distributions of those names and finds
  # neither, however present `/usr/bin/cmake` and `/usr/bin/ninja` are. Skipping
  # the check is what lets the system tools serve, and `makedepends` above is
  # then the statement of what a build needs.
  python -m build --wheel --no-isolation --skip-dependency-check;
}

check() {
  cd "${srcdir}/${_upstream}";

  # Run against the built wheel and never against the source tree: the extension
  # exists only once built, so importing from `bindings/python/src` would find
  # no module to test.
  local -- staged;
  staged="$(mktemp -d)";
  trap 'rm -rf "${staged}"' RETURN;

  python -m installer --destdir="${staged}" dist/*.whl;

  local -- sitedir;
  sitedir="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')";

  PYTHONPATH="${staged}${sitedir}" python -c 'import ckdl; print(ckdl.parse("node 1"))';
}

package() {
  cd "${srcdir}/${_upstream}";

  python -m installer --destdir="${pkgdir}" dist/*.whl;

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING";
}
