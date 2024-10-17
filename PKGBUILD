# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=meta-package-manager-git
_pkgname=${pkgname%-git}
pkgver=5.18.0.r31.g9a9b59d8
pkgrel=1
provides=($_pkgname)
conflicts=($_pkgname)
pkgdesc='A wrapper around all package managers (git version)'
url='https://kdeldycke.github.io/meta-package-manager/'
makedepends=(uv)
depends=(python python-boltons python-click-extra python-cyclonedx-lib python-packageurl python-spdx-tools python-tabulate python-tomli-w python-xmltodict)
checkdepends=(python-pytest python-pytest-cov python-pytest-randomly python-pytest-xdist)
optdepends=('apt: support for apt packages'
            'rust: support for Rust packages'
            'composer: support for PHP composer packages'
            'dnf: support for RPM packages'
            'portage: support for Gentoo packages'
            'flatpak: support for Flatpak packages'
            'rubygems: support for Ruby packages'
            'npm: support for Node.js packages'
            'opkg: support for OPKG packages'
            'pacaur: support for AUR packages'
            'pacman: support for Pacman packages'
            'paru: support for AUR packages'
            'python-pip: support for Python packages'
            'python-pipx: support for Python pipx packages'
            'snapd: support for Snap packages'
            'steamcmd: support for Steam games'
            'uv: support for Python packages'
            'code: support for VSCode extensions'
            'yarn: support for Node packages'
            'yay: support for AUR packages'
            'zypper: support for RPM packages')
license=('GPL2')
arch=('any')
source=("git+https://github.com/kdeldycke/meta-package-manager.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    uv build
}

package() {
    cd "$srcdir/$_pkgname"
    uv pip install --system --link-mode=copy --no-deps --prefix="$pkgdir/usr" dist/*.whl
    rm "$pkgdir/usr/.lock"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license
}
