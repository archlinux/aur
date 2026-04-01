# Maintainer: Daniel McGuire <danielmcguire2023@gmail.com>
pkgname=phasor-git
PACKAGER="Daniel McGuire <danielmcguire2023@gmail.com>"
pkgver=3.1.1.git
pkgrel=1
pkgdesc="Phasor Programming Language Toolchain"
arch=('x86_64')
url="https://github.com/DanielLMcGuire/Phasor"
license=('0BSD')
makedepends=('gcc' 'cmake' 'ninja' 'python' 'python-installer' 'python-build')
optdepends=('gcc: For building Phasor Native wrappers.' 'python: For manipulating bytecode' 'lief: For extracting native bytecode')
conflicts=('phasor' 'phasor-dev')
options=(strip !debug)
install=phasor.install
depends=()
source=("git+https://github.com/DanielLMcGuire/Phasor.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Phasor"
    tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "3.1.1")
    commits_since_tag=$(git rev-list "${tag}"..HEAD --count 2>/dev/null || echo 0)
    short_hash=$(git rev-parse --short HEAD 2>/dev/null || echo "")
    if [ "$commits_since_tag" -eq 0 ]; then
        echo "$tag.git"
    else
        echo "${tag}.r${commits_since_tag}.${short_hash}"
    fi
}

prepare() {
    git -C "$srcdir/Phasor" submodule update --init --recursive
}

build() {
    cd "$srcdir/Phasor"
    "/usr/bin/python" "$srcdir/Phasor/pmake-bootstrap.py" --native
    chmod +x "$srcdir/Phasor/pmake"
    "$srcdir/Phasor/pmake" linux-64-rel -s "$srcdir/Phasor" -b

    cd "$srcdir/Phasor/src/Extensions/py/phasor"
    "/usr/bin/python" -m build --wheel
}

package() {
    cd "$srcdir/Phasor"
    "$srcdir/Phasor/pmake" -i "$pkgdir/" 
    
    install -Dm644 "$srcdir/Phasor/src/Extensions/unix/phasor.magic" \
        "$pkgdir/usr/share/file/misc/magic/phasor"

    "/usr/bin/python" -m installer --destdir="$pkgdir" "$srcdir/Phasor/src/Extensions/py/phasor/dist/"*.whl
}
