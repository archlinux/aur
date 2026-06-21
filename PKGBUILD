# Maintainer: Vatteck <vatteck@gmail.com>
#
# Stable, versioned Atlas release — built from a tagged GitHub source tarball with a *pinned*
# sha256 (reproducible), unlike the bleeding-edge `atlas-pm-git` which tracks master HEAD.
#
# `pkgver` and `sha256sums` below are rewritten by linux_dist/arch/release.sh at release time
# (it tags the version, downloads the tarball, and pins its checksum). Edit deps / metadata /
# the package() layout here — but leave those two lines for the script to fill.
pkgname=atlas-pm
pkgver=0.14.0
pkgrel=1
pkgdesc="Arch-focused graphical package manager (Arch/AUR, Flatpak, AppImage)"
arch=('any')
url="https://github.com/Vatteck/Atlas"
license=('Zlib')
depends=(
    'python'
    'python-pywebview>=4.2'  # 4.2 added the `icon` start param used for the window icon
    'webkit2gtk-4.1'
    'gtk3'
    'python-gobject'
    'python-requests'
    'python-yaml'
    'python-dateutil'
    'python-colorama'
    'pacman'
)
optdepends=(
    'flatpak: manage Flatpak applications'
    'git: build packages from the AUR'
    'pacman-contrib: accurate repo update detection without root (checkupdates)'
    'timeshift: system snapshot before applying changes'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('atlas-pm-git')  # the two variants install the same files — pick one
# GitHub names the tarball's top dir after the tag's source -> Atlas-$pkgver/
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vatteck/Atlas/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('06be03096789621bcdc29a7968cf2e55c1b1ba2cda4148212553da276488e21d')

build() {
    cd "Atlas-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "Atlas-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # The whole identity is 'atlas-pm' (desktop filename, Icon, StartupWMClass, runtime app_id)
    # — NOT the bare 'atlas', which collides with a generic map icon several themes ship. Keep
    # this in lockstep with linux_dist/arch/PKGBUILD (the -git variant).
    install -Dm644 atlas/desktop/atlas-pm.desktop "$pkgdir/usr/share/applications/atlas-pm.desktop"
    install -Dm644 atlas/view/resources/img/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/atlas-pm.svg"
    install -Dm644 atlas/view/resources/img/logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/atlas-pm.png"
    install -Dm644 atlas/view/resources/img/logo.png "$pkgdir/usr/share/pixmaps/atlas-pm.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
