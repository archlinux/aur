# Maintainer: Agil Mammadov <mammadovagil@proton.me>
# Maintainer: Kevin Deldycke <kevin at deldycke dot com>>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=meta-package-manager
_pkgname=${pkgname//-/_}
pkgver=8.3.0
pkgrel=2
pkgdesc='A wrapper around all package managers'
url='https://mpm.run/'
makedepends=(python-build python-installer python-uv-build)
depends=(python python-click-extra python-extra-platforms python-tomli-w)
checkdepends=(python-pytest python-pytest-cov python-pytest-randomly python-pytest-xdist python-yaml)
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
            'python-cyclonedx-lib: SBOM CycloneDX output (mpm sbom)'
            'python-spdx-tools: SBOM SPDX output (mpm sbom)'
            'python-packageurl: SBOM output (mpm sbom)'
            'snapd: support for Snap packages'
            'steamcmd: support for Steam games'
            'uv: support for Python packages'
            'code: support for VSCode extensions'
            'yarn: support for Node packages'
            'yay: support for AUR packages'
            'zypper: support for RPM packages')
license=('GPL-2.0-or-later')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('4436cf879b033e9bbc19b5021a33b9c6b02f6b10fb5658726e2e6cfedc9d7c41b7bfb7a35cd8bde0963e6e4147aee920b312c52b4115344db5a4d58c321cae47')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -m pytest -m "not integration"
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license
}
