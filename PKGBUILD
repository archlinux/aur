# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
# Contributor: Biginoz <biginoz _at_ free point fr>
# Contributor: andy123 < ajs AT online DOT de >
# Contributor: Deather <deather.jeuxlinux@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>

pkgname=unknown-horizons
pkgver=2019.1
pkgrel=4
pkgdesc="2D realtime strategy simulation with an emphasis on economy and city building."
arch=('any')
url="http://www.unknown-horizons.org/"
license=('GPL' 'CCPL')
changelog=.CHANGELOG
depends=('fife' 'python' 'python-pillow' 'python-yaml' 'python-future')
makedepends=('intltool' 'python-setuptools' 'python-distro')
conflicts=('unknown-horizons-git')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname-[PATCH]-replace-deprecated-to-distro-package-(#2910).patch::https://github.com/$pkgname/$pkgname/commit/2fdb225f62f66bf474e19d9b1bcfbaf691672c43.patch"
        "$pkgname-[PATCH]-SyntaxWarning:-\"is\"-with-a-literal.-(#2924).patch::https://github.com/$pkgname/$pkgname/commit/05267e0d7f1223ddd0517f4f02c4d8444668f559.patch")
sha512sums=('87ae37442ee0b80130c7a75c7eeb7c0ef6c50f3e6b2616db32e6381ace5068729ab7086edefc00eefd3b89e85f9a05fb6c4d05f2a2adc46fa928e5c2a29b72db'
            'c5f046b88921d39870bffc0d7883d9541026243d02031f371de155e375794af825e57f67b5ef39dc8a24e8f63d407d1e25ac2f99e7096a304d25acc94f01ea9e'
            '59d2508b67e304857d8f29cde2bd195ee2dd06270b84c1d2bddeb7cb4737bcfa4894f2493630e21b4ac63db76c206c94786a642a9ca4d077f914a8fa8658bbc3')

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-replace-deprecated-to-distro-package-(#2910).patch"
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-SyntaxWarning:-\"is\"-with-a-literal.-(#2924).patch"
}

# unknown-horizons build system misses a few files if the build step is seperated from the install
# step
build() {
    cd "$pkgname-$pkgver"
    # UH_USER_DIR="UH_USER_DIR" python setup.py build
    UH_USER_DIR="UH_USER_DIR" python horizons/engine/generate_atlases.py 2048
}

package() {
    cd "$pkgname-$pkgver"
    UH_USER_DIR="UH_USER_DIR" python setup.py install --root="$pkgdir/" --optimize=1 #--skip-build
}
