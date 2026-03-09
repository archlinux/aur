# Maintainer: Dory <dory@dory.moe>
_pkgname=discord-ext-voice-recv
pkgname=python-discord-ext-voice-recv-git
pkgver=r180.ac04ea7 # This is a placeholder, pkgver() will update it
pkgrel=2
pkgdesc="Experimental voice receive extension for discord.py (Git version)"
arch=('any')
url="https://github.com/imayhaveborkedit/discord-ext-voice-recv"
license=('MIT')
depends=('python' 'python-discord>=2.5' 'python-pynacl')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=("python-discord-ext-voice-recv")
conflicts=("python-discord-ext-voice-recv")
source=("git+https://github.com/imayhaveborkedit/discord-ext-voice-recv.git"
        "fix-OpusError.patch"
        "support-dave-decryption.patch")
sha256sums=('SKIP'
            '5e30bc15ef31a184eaef08861585b32c1107a21a3cf13bc32710489572bab06f'
            '5c98787e3f61bd3bf1ae3a64d1db0fe933bfd1c8ff20cf343b731e4258471e1b')

pkgver() {
    cd "$_pkgname"
    # Try to generate version from tags
    if git describe --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    else
        # Fallback to commit count if no tags
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

prepare() {
    cd "$_pkgname"
    # Apply patch to fix OpusError
    patch -p1 -i "$srcdir/fix-OpusError.patch"
    patch -p1 -i "$srcdir/support-dave-decryption.patch"
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
