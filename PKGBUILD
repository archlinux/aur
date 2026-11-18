# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=github-dorks-git
_pkgname=github-dorks
pkgver=0.1.r78.g16dc173
pkgrel=1
pkgdesc='Find leaked secrets with GitHub code search'
arch=('any')
url='https://github.com/techgaun/github-dorks'
license=('Apache-2.0')
depends=('python' 'python-feedparser' 'python-github3py' 'python-requests')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("$_pkgname")
conflicts=("$_pkgname")
# Upstream's only tag (0.1) is from 2016; the maintained code is on the default branch.
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    # The default dorks file is looked up at <prefix>/github-dorks/; keep it under /usr/share.
    sed -i "s|Path(prefix) / 'github-dorks' / 'github-dorks.txt'|Path(prefix) / 'share' / 'github-dorks' / 'github-dorks.txt'|" \
        github_dorks/dictionaries.py
    grep -q "'share' / 'github-dorks'" github_dorks/dictionaries.py ||
        { error 'default dorks path not patched; upstream changed find_dorks_file()'; return 1; }
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -d "$pkgdir/usr/share"
    mv "$pkgdir/usr/github-dorks" "$pkgdir/usr/share/github-dorks"
}
