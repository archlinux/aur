# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC2034,SC2154,SC2164

_name=backports

pkgname=python-backports
pkgver=1.1
pkgrel=1
pkgdesc="Common namespace dependency for all python-backports.* packages"

arch=("any")
license=("MIT")
url="https://github.com/brandon-rhodes/backports"

# https://github.com/brandon-rhodes/backports/archive/refs/tags/v1.1.tar.gz
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8a2215a67bb9ead44ccd803a8fbf642ce5a114b7c2c83fb2aead493d3722fe424935cf498c415db94f0646b8a50bad30ab79009f54abb498a2278795f82037e8')

depends=("python")

prepare() {
    [ -d "$srcdir/$_name" ] && rm -rf "$srcdir/$_name";
    mv "$srcdir/$_name-$pkgver" "$srcdir/$_name"
    cd "$srcdir/$_name"

    # Inject __init__ file as per repository's README
    (cat << EOF
# A Python "namespace package" http://www.python.org/dev/peps/pep-0382/"
# This always goes inside of a namespace package's __init__.py"

from pkgutil import extend_path
__path__ = extend_path(__path__, __name__)
EOF
    ) > __init__.py
}

build() {
    cd "$srcdir/$_name"

    # Generates pyache files for __init__
    python -m compileall __init__.py
    python -m compileall -o1 __init__.py
    python -m compileall -o2 __init__.py
}

package() {
    cd "$srcdir/$_name"
    python_version="$(python --version | awk '{print $2}' | sed 's/\.[^.]\+$//')"
    installdir="$pkgdir/usr/lib/python$python_version/site-packages/backports"

    install -Dm644 __init__.py "$installdir/__init__.py"

    for file in __pycache__/*; do
        install -Dm644 "$file" "$installdir/$file"
    done

    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
