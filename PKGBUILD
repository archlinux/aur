# Maintainer: Rockykln <contact@rockykln.com>

pkgname=refrain
pkgver=0.5.4
pkgrel=1
pkgdesc="Discord Rich Presence for Apple Music on Linux"
arch=('any')
url="https://github.com/Rockykln/refrain"
license=('LicenseRef-RefrainUseOnly')
depends=(
    'python>=3.11'
    'python-pypresence>=4.6.2'
    'python-dbus'
    'pyside6'
)
optdepends=(
    'python-gobject: enables MPRIS-server publication so Plasma media controls reach Refrain'
    'libnotify: desktop notifications for track changes via notify-send'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)
# Built from the signed git tag rather than the GitHub archive tarball: GitHub
# regenerates archive/*.tar.gz on its own schedule, which has silently changed
# the sha256 of otherwise-identical release tarballs before. The tag itself is
# what the release workflow builds from and never changes.
# Key: fetchable via `gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys`.
source=("$pkgname::git+https://github.com/Rockykln/refrain.git#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('92767CDB8C782F3E8584413FA7B8C833C5AF124E')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 src/refrain/assets/refrain.desktop \
        "$pkgdir/usr/share/applications/refrain.desktop"
    install -Dm644 src/refrain/assets/icons/refrain.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/refrain.svg"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
