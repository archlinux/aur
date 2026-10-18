# Maintainer: Raul Dias <raul at dias dot com dot br>
# Contributor: Jan Alexander Steffens (heftig)
# Contributor: Tom Gundersen
# Contributor: Thomas Baechler
# Based on the Arch Linux libfprint PKGBUILD.

pkgname=libfprint-sigfm-0078
pkgver=1.94.100.r25.gf9c60a2
pkgrel=3
pkgdesc="Library for fingerprint readers, with the SIGFM matcher and the Synaptics 06cb:0078 driver"
url="https://github.com/rsd/fingerprint-06cb-0078"
arch=(x86_64)
# The libfprint fork is LGPL-2.1-or-later; this project's setup tool and Python
# package (synaptics0078) are MIT.
license=(LGPL-2.1-or-later MIT)
depends=(
  libgcc
  glib2
  glibc
  libgudev
  libgusb
  openssl
  pixman
  # SIGFM matcher, used by the synaptics0078 driver
  opencv
  libstdc++
  # synaptics0078-setup: the interpreter, USB access (calibration), download,
  # bsdtar (vendor archives) and setpriv (unprivileged extraction)
  python
  python-pyusb
  curl
  libarchive
  util-linux
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  python-cairo
  python-gobject
  systemd
)
checkdepends=(
  cairo
  umockdev
  python-pytest
)
# libfprint-git too: Omarchy's fingerprint setup checks `pacman -Q libfprint-git`
# and would otherwise replace this package with its own libfprint-git.
provides=(
  "libfprint=${pkgver%%.r*}"
  "libfprint-git=${pkgver%%.r*}"
  libfprint-2.so
)
conflicts=(libfprint libfprint-git)
groups=(fprint)
# The libfprint fork: upstream 1.94.100 master + the SIGFM series + the
# synaptics0078 driver, branch sigfm-0078, pinned by commit.
_repo=https://github.com/rsd/libfprint.git
_commit=f9c60a25c95b8fcf805812bae1ddb984e2e568d9
# This project (synaptics0078-setup and the synaptics0078 Python package),
# pinned by release tag.
_toolrepo=https://github.com/rsd/fingerprint-06cb-0078.git
_tooltag=v0.1.0
source=(
  "libfprint::git+${_repo}#commit=${_commit}"
  "fp0078::git+${_toolrepo}#tag=${_tooltag}"
)
# b2sums of `git archive` of each pin (makepkg verifies git sources pinned by
# commit or tag), so a moved tag fails the build.
b2sums=('040fb63356af23dd30d14cab7c29c02cd64d7b8089c99380875da9b1fa7ee290df09dd06bd9606d682ac8f9b6f4770c139f52d7ca518182d9f984be186653cb6'
        'b1392843542f4b7e8387f24c2449f02183e04d3e42d1fd80499a554d93c4db70e818e9c8464545f9720bc79f1db518faec83e162e67739abc142ca8f1517c00e')
install=libfprint-sigfm-0078.install

prepare() {
  local f
  for f in synaptics0078/__init__.py packaging/arch/libfprint-sigfm-0078/synaptics0078-setup LICENSE; do
    if [[ ! -f fp0078/$f ]]; then
      echo "fp0078 at ${_tooltag} has no $f" >&2
      return 1
    fi
  done
}

build() {
  local meson_options=(
    # Add virtual drivers for integration tests (e.g. in fprintd)
    -D drivers=all

    -D installed-tests=false

    # synaptics0078_data_dir stays at its default, /var/lib/fprint/synaptics0078,
    # where synaptics0078-setup installs the per-unit files.
  )

  arch-meson libfprint build "${meson_options[@]}"

  # Without OpenCV, meson silently drops the synaptics0078 driver from
  # drivers=all; that build must never ship.
  if ! grep -qx '#define HAVE_SIGFM 1' build/config.h; then
    echo "OpenCV not found: HAVE_SIGFM is unset, synaptics0078 would be missing" >&2
    return 1
  fi

  meson compile -C build
}

check() {
  # makepkg runs this under errexit: a failing step fails the build.
  _check_meson
  _check_python
}

_check_meson() {
  meson test -C build --print-errorlogs && return 0

  # egis_etu905 fails intermittently on unmodified upstream too (its umockdev
  # replay times out while cancelling). When it is the ONLY failure, it is
  # rerun alone, up to 3 times; every attempt stays in the log. Any other
  # failure, or egis_etu905 failing all 3 reruns, fails the build.
  local failed
  failed=$(python3 -c '
import json, sys
for line in open(sys.argv[1]):
    t = json.loads(line)
    if t["result"] not in ("OK", "SKIP", "EXPECTEDFAIL"):
        print(t["name"])
' build/meson-logs/testlog.json)
  if [[ $failed != *:egis_etu905 || $failed == *$'\n'* ]]; then
    return 1
  fi
  local i
  for i in 1 2 3; do
    echo "check: egis_etu905 was the only failure (known upstream flake); rerun $i of 3" >&2
    meson test -C build --print-errorlogs egis_etu905 && return 0
  done
  return 1
}

# The package and setup tests, from the pinned checkout, with the system
# interpreter. Tests that need local/b5 or the template skip there: a git
# checkout has no local/ or proto/data/.
_check_python() {
  cd fp0078
  PYTHONDONTWRITEBYTECODE=1 python -m pytest -q -p no:cacheprovider \
    synaptics0078/tests tools/test_synaptics0078_setup.py
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd fp0078
  install -Dm755 packaging/arch/libfprint-sigfm-0078/synaptics0078-setup \
    "$pkgdir/usr/bin/synaptics0078-setup"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-synaptics0078"

  # The Python package goes to a private dir (it survives Python minor upgrades,
  # which site-packages does not without a rebuild), without its tests.
  local _libdir=/usr/lib/synaptics0078 f
  while IFS= read -r -d '' f; do
    install -Dm644 "$f" "$pkgdir$_libdir/$f"
  done < <(find synaptics0078 -path synaptics0078/tests -prune -o -type f -name '*.py' -print0)
  # pyc at build time, so pacman owns them (the setup runs with -B). The recorded
  # source path is the installed one; checked-hash pycs stay valid whatever
  # mtime makepkg gives the files.
  python -m compileall -q -f --invalidation-mode checked-hash \
    -s "$pkgdir" -p / "$pkgdir$_libdir/synaptics0078"
}

# vim:set sw=2 sts=-1 et:
