# Maintainer: s3lph <account-arch-aur-gzxkqqna@kernelpanic.lol>
_name=pdf-diff
pkgname="${_name}-git"
pkgver=0.9.0.r55.f3a8e48
pkgrel=1
pkgdesc="Finds differences between two PDF documents"
arch=('any')
url="https://github.com/JoshData/pdf-diff/"
license=('custom:CC0')
groups=()
depends=('python-lxml' 'python-diff-match-patch' 'poppler')
makedepends=('git' 'python-setuptools')
provides=("${_name}")
conflicts=("${_name}")
replaces=()
backup=()
options=()
install=
source=('git://github.com/JoshData/pdf-diff'
        'pdf-diff.1')
noextract=()
md5sums=('SKIP'
         'SKIP')


prepare() {
    cd "$srcdir/${_name}"
    gzip < "$srcdir/${_name}.1" > "$srcdir/${_name}.1.gz"
    sed -re 's/diff_match_patch_python/diff-match-patch/g' -i setup.py
    python setup.py egg_info
}

pkgver() {
    cd "$srcdir/${_name}"
    printf "%s.r%s.%s" "$(grep '^Version:' ${_name/-/_}.egg-info/PKG-INFO | cut -d' ' -f2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_name}"
    python setup.py build
}

package() {
    cd "$srcdir/${_name}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/${_name}.1.gz" "$pkgdir/usr/share/man/man1/${_name}.1.gz"
}
