# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
# Contributor: Biginoz <biginoz _at_ free point fr>
# Contributor: andy123 < ajs AT online DOT de >
# Contributor: Deather <deather.jeuxlinux@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=unknown-horizons
pkgver=2019.1
pkgrel=6
pkgdesc="2D realtime strategy simulation with an emphasis on economy and city building."
arch=('any')
url="https://unknown-horizons.org/"
license=('GPL' 'CCPL')
changelog=.CHANGELOG
depends=('fife' 'python' 'python-pillow' 'python-yaml' 'python-future')
makedepends=('intltool' 'python-setuptools' 'python-distro')
conflicts=('unknown-horizons-git')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname-[PATCH]-replace-deprecated-to-distro-package-(#2910).patch::https://github.com/$pkgname/$pkgname/commit/2fdb225f62f66bf474e19d9b1bcfbaf691672c43.patch"
        "$pkgname-[PATCH]-SyntaxWarning:-\"is\"-with-a-literal.-(#2924).patch::https://github.com/$pkgname/$pkgname/commit/05267e0d7f1223ddd0517f4f02c4d8444668f559.patch"
        "$pkgname-[PATCH]-fixs-for-Phyton-3.9-(#2955).patch::https://github.com/$pkgname/$pkgname/commit/7f6f613826aef9810999c1599c8354e8a78fbdb4.patch"
        "$pkgname-[PATCH]-Python-Pillow-10-compatibility-(#2962)::https://github.com/$pkgname/$pkgname/commit/d543cd4d57afcf8dc24b2bac4b124b4a2a8cc658.patch")
sha512sums=('87ae37442ee0b80130c7a75c7eeb7c0ef6c50f3e6b2616db32e6381ace5068729ab7086edefc00eefd3b89e85f9a05fb6c4d05f2a2adc46fa928e5c2a29b72db'
            'd9d9fece7f7f18590027d1094ab7b86241ea17870414f5e56205e269d2084f0ee7a31f050412135a678cbc15e57e5ec618afb1b89c13b7a3fe4f858b69e01dde'
            '0c131311eab19d4f5a45726187f4e87dd1a1af25e75559078df1836f2c13d013bfdfd32a8c57cfe1e571a4a2109730865dcd32f19ed618892e44a3377c6ade1b'
            'fe47ea81f353fa26987f609c05a77729369b234a12903f9f977614eaa7dabeb720fa369901e8898ce094e36ecb350773aca48ba3addc6617a34c913cb3b895b0'
            '2503710df7dcec1ba1e399cbe724f1fbe650515961f0bb940957ce2358b99746876b0818f4c4052fcd81b34c9c964b0d3f9319287388b531495af41a5fade573')

prepare() {
    cd "$pkgname-$pkgver" || exit
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-replace-deprecated-to-distro-package-(#2910).patch"
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-SyntaxWarning:-\"is\"-with-a-literal.-(#2924).patch"
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-fixs-for-Phyton-3.9-(#2955).patch"
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-Python-Pillow-10-compatibility-(#2962)"
}

# unknown-horizons build system misses a few files if the build step is seperated from the install step
build() {
    cd "$pkgname-$pkgver" || exit
    # UH_USER_DIR="UH_USER_DIR" python setup.py build
    UH_USER_DIR="UH_USER_DIR" python horizons/engine/generate_atlases.py 2048
}

package() {
    cd "$pkgname-$pkgver" || exit
    UH_USER_DIR="UH_USER_DIR" python setup.py install --root="$pkgdir/" --optimize=1 #--skip-build
}
