# Maintainer: Daniel McGuire <danielmcguire2023@gmail.com>
pkgname=phasor-git
PACKAGER="Daniel McGuire <danielmcguire2023@gmail.com>"
pkgver=3.1.0.git
pkgrel=1
pkgdesc="Phasor Programming Language Toolchain"
arch=('x86_64')
url="https://github.com/DanielLMcGuire/Phasor"
license=('0BSD')
makedepends=('git' 'gcc' 'cmake' 'ninja')
optdepends=('gcc: For building Phasor Native wrappers.')
conflicts=('phasor' 'phasor-dev')
options=(strip !debug)
install=phasor.install
depends=()
source=("git+https://github.com/DanielLMcGuire/Phasor.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Phasor"
    tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "3.1.0")
    commits_since_tag=$(git rev-list "${tag}"..HEAD --count 2>/dev/null || echo 0)
    short_hash=$(git rev-parse --short HEAD 2>/dev/null || echo "")
    if [ "$commits_since_tag" -eq 0 ]; then
        echo "$tag.git"
    else
        echo "${tag}.r${commits_since_tag}.${short_hash}"
    fi
}

build() {
    cd "$srcdir/Phasor"
    cmake -S . -B build -G Ninja --preset linux-64-rel
    cmake --build build
}

package() {
    cd "$srcdir/Phasor/build"
    cmake --install . --prefix "$pkgdir"
	
	install -Dm644 "$srcdir/Phasor/src/Extensions/unix/phasor.magic" \
        "$pkgdir/usr/share/file/magic/phasor"
}
