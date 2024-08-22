# Maintainer: ssfdust <ssfdust@gmail.com>
pkgname=rbenv-vagrant-setup-git
pkgver=v0.1.0.20240822.2b83bc8
pkgrel=1
pkgdesc="A Python tool that automates the installation of Vagrant for Ruby environments managed by rbenv."
arch=(any)
url="https://gitlab.com/ssfdust/rbenv-vagrant-setup"
license=('MIT')
groups=()
depends=('python' 'python-requests' 'go' 'rbenv' 'curl' 'libarchive'
         'libssh2' 'libxml2' 'libxslt' 'rsync' 'xz' 'perl' 'ruby-build'
)
makedepends=('git' 'python-pip' 'python-installer' 'python-wheel')
optdepends=('dnsmasq: if using libvirt')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
source=("$pkgname::git+https://gitlab.com/ssfdust/rbenv-vagrant-setup.git")
md5sums=('SKIP')
noextract=()

pkgver() {
    (
        set -o pipefail
        cd "$srcdir/$pkgname"

        printf "v%s.%s.%s" \
            "$(grep -oP 'version\s*=\s*"\K[^"]+' pyproject.toml)" \
            "$(TZ=UTC git log -1 --pretty='%cd' --date=format-local:%Y%m%d)" \
            "$(git rev-parse --short HEAD)"
    )
}

build () {
    cd "$srcdir/$pkgname"
    pip wheel --no-deps -w "dists" .
}

package() {
    cd "$srcdir/$pkgname"
    /usr/bin/python -m installer --destdir="$pkgdir/" dists/*.whl
}

# vim:set ts=4 sw=4 et:
