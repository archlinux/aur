# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Sean Enck <enckse@gmail.com>

pkgname=python-pyxstitch
_name=${pkgname#python-}
pkgver=1.8.1
pkgrel=1
pkgdesc="takes source code files and produces syntax-highlighted patterns for cross stitching"
arch=("any")
url="https://github.com/enckse/$_name"
license=('MIT')
depends=('python' 'python-pillow' 'python-setuptools' 'python-pygments')
optdepends=("bash-completion: for bash completions")
_rawcontent="https://raw.githubusercontent.com/enckse/$_name/v$pkgver/"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "${_rawcontent}LICENSE"
        "${_rawcontent}resources/bash.completions"
        "${_rawcontent}resources/$_name.1")
sha256sums=('c2c2711b021678a250ac5b18ba20a6e1fa6c1f663f90ed2a03c418773baa6835'
            '3f2c149ada89dc7874788fc3aee58ba5a1849fb2f44ba722f6a0a314b401c31f'
            'e19458e5a751a1d496e681a0ff50b78f823fd18861fadc6f98982731a70aa773'
            '4aee529ee100590a9e97fa1b22239c90222fd7ae2cdd0c308d683c903e550723')


prepare() {
    sed -i "s/<Version>/$pkgver/g" pyxstitch.1
    rm -f *.gz
    gzip pyxstitch.1
}

build() {
    python setup.py build
}

package() {
    install -Dm644 pyxstitch.1.gz "$pkgdir/usr/share/man/man1/pyxstitch.1.gz"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm 644 bash.completions "$pkgdir/usr/share/bash-completion/completions/pyxstitch"
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
