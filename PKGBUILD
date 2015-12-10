# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=qfc-git
_gitname=qfc
pkgver=r36.736bd2c
pkgrel=1
pkgdesc="Quick command-line file completion"
arch=(any)
url=https://github.com/pindexis/qfc
license=(custom:MIT)
depends=(python)
optdepends=(
    "zsh: use qfc in Zsh"
    "bash: use qfc in Bash"
)
makedepends=(
    git
    python
)
provides=(qfc)
conflicts=(qfc)
source=(git+https://github.com/pindexis/qfc)
md5sums=(SKIP)
install=qfc.install


pkgver() {
    cd "$_gitname"
    # No tagged commits. ヽ(´ー｀)ノ
    commit=$(git rev-list --count master)
    hash=$(git rev-parse --short HEAD)
    echo "r$commit.$hash"
}


package() {
    cd "$srcdir/$_gitname"

    python -m compileall qfc/*.py

    local _bin_dir="$pkgdir"/usr/bin
    local _share_dir="$pkgdir"/usr/share/qfc
    local _doc_dir="$pkgdir"/usr/share/doc/qfc
    local _license_dir="$pkgdir"/usr/share/licenses/"$pkgname"
    local _py_site_pkg="$(python -c 'import site; print(site.getsitepackages()[0])')"
    local _py_dir="$pkgdir"/"$_py_site_pkg"/qfc

    install -dm755 "$_py_dir"/{,__pycache__}
    install -m644 qfc/*.py "$_py_dir"
    install -m644 qfc/__pycache__/*.pyc "$_py_dir"/__pycache__
    install -Dm755 bin/qfc "$_bin_dir"/qfc
    install -Dm644 bin/qfc.sh "$_share_dir"/qfc.sh
    install -Dm644 LICENSE "$_license_dir"/LICENSE
    install -Dm644 README.md "$_doc_dir"/README.md
}
