# Maintainer:  vitor_hideyoshi <vitor.h.n.batista at gmail dot com>
# Contributor: Ilias Stamatis <stamatis.iliass at gmail dot com>, Saren Arterius <saren at wtako dot net>
# Contributor: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=snapper-gui-git
pkgver=0.1+8.r132.20220626.1915750
pkgrel=1
pkgdesc="Gui for snapper, a tool of managing snapshots of Btrfs subvolumes and LVM volumes"
arch=(any)
url="https://github.com/ricardomv/snapper-gui"
license=('GPL2')
depends=(
    'python3'
    'gtk3'
    'python-dbus'
    'python-gobject'
    'python-setuptools'
    'gtksourceview3'
    'snapper'
)
optdepends=(
    'gksu: Access snapper-gui from application menu under GTK-base DE'
    'kdesu: Access snapper-gui from application menu under KDE'
)
makedepends=('git')
provides=('snapper-gui')
conflicts=('snapper-gui')
install=snapper-gui.install
source=(
    "${pkgname}::git+https://github.com/ricardomv/snapper-gui.git"
    "python3.11-diff-fix.patch::https://patch-diff.githubusercontent.com/raw/ricardomv/snapper-gui/pull/59.patch"
)
sha256sums=(
    'SKIP'
    '2770d1ef054c1e089af72d3779e65fcaa33b7fab54eab57e31cfd3ebab6b96e9'    
)

prepare() {
  cd "$pkgname"

  for _patch in "${srcdir}/python3.11-diff-fix.patch"; do
    msg2 "Applying patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done
}

pkgver() {
    cd "$pkgname"

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

package() {
    cd "$pkgname"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
