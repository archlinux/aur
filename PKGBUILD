# Maintainer:  dreieck
# Contributor: orumin <dev@orum.in>

_pkgname=wacom-utility
pkgname="${_pkgname}-git"
pkgver=0.1.4+1.r10.20260307.f2b765d
pkgrel=1
pkgdesc="Graphical tablet configuration utility. Old software, does not support the new(est) hardware."
arch=('any')
url="https://github.com/ggveryhard/wacom-utility"
license=('GPL-2.0-or-later')
depends=(
  'glib2'
  'gtk4'
  'python>=3.10'
  'python-cairo'
  'python-evdev'
  'python-gobject'  # gi
)
optdepends=(
  "xf86-input-wacom:  For 'xsetwacom', for usage in X11."
  "ydotool:           For usage in Wayland."
  "sway:              For 'swaymsg', for output mapping in Wayland GUI."
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=(
  "${_pkgname}=${pkgver}"
  "python-wacum_utility=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "python-wacum_utility"
)
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> building ..."
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> installing ..."
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  install -Dvm644 -t "${pkgdir}/usr/lib/systemd/user/"  systemd/user/wacom-wayland-pad-daemon.service
  install -Dvm644 images/generic.png "${pkgdir}/usr/share/pixmaps/wacom-utility.png"
  install -Dvm644 packaging/rpm/wacom-utility.desktop "${pkgdir}/usr/share/applications/wacom-utility.desktop"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log PYTHON3_MIGRATION.md README.md README_UPGRADE.md RELEASE_CHECKLIST_0.1.1.md UPGRADE_CHECKLIST.md UPGRADE_REPORT.md keymap.txt 
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE
}
