# Maintainer: Yousef El-Darsh <yousef.eldarsh@gmail.com>

pkgname=python-fabric-git
reponame=fabric
pkgver=r161.ff02325
pkgrel=1
pkgdesc="next-gen framework for building desktop widgets using python"
arch=(any)
url="https://github.com/Fabric-Development/fabric"
license=("AGPL-3.0-or-later")
groups=()
depends=(
    gtk3
    cairo
    pkgconf
    libgirepository
    gobject-introspection
    gobject-introspection-runtime

	# those are extra run-time pacakges
	# but since they're used by most of the users
	# we're adding them to dependencies
    gtk-layer-shell
    libdbusmenu-gtk3
	cinnamon-desktop
    webkit2gtk-4.1

	# python specific packages
    python
    python-pip
    python-gobject
    python-cairo
    python-loguru
    python-click
)
makedepends=(
    python-setuptools
    python-installer
    python-build
    git
)
optdepends=(
    "python-psutil: for system stats, this package is a dependency of the bar example file"
)
provides=(
    python-fabric
)
conflicts=(
    python-fabric
)

source=(git+https://github.com/Fabric-Development/$reponame.git)
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/$reponame"
    ( set -o pipefail
      git describe --long --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
  cd "$srcdir/$reponame"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$reponame"
  python -m installer --destdir="$pkgdir/" dist/*.whl
}
