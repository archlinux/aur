# Maintainer: Amro Emad <korialo001 at gmail dot com>

pkgname=python-khali-git
_pkgname=khali
pkgver=1.0.0.r31.f6ff732
pkgrel=2
pkgdesc="Uses khal, vdirsyncer and at to sync calendars and set alarms."
arch=('any')
url="https://codeberg.org/dhruva_sambrani/khali"
depends=(
  'python-dateutil'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)

source=("git+${url}.git")
license=('LicenseRef-None')
sha256sums=('SKIP')

prepare() {
    cd "${_pkgname}"
    # the script hardcod(ed) to the user's .local/bin undo that.
    sed -ir '$ s/\(%h\/.local\)/\/usr/' ${_pkgname}.service
}

build() {
    cd "${_pkgname}"
    python -m build --wheel --no-isolation 
}

pkgver() {
    cd "${_pkgname}"
    # combine both version from pyproject.toml to git revisions for a temporary versionning
    printf "%s.r%s.%s" $(grep version pyproject.toml | head -n 1 | sed 's/version = "\(.*\)"/\1/') "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    depends=(
      'khal'
      'vdirsyncer'
      'at'
	  'libnotify')
    
    cd "${_pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
    install -Dm0644 ${_pkgname}.{service,timer} -t "$pkgdir/usr/lib/systemd/user"
}
