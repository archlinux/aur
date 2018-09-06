# Maintainer: bb010g <me@bb010g.com>
pkgname=fediplay-git
pkgver=r56.1f18295
pkgrel=2
pkgdesc="A Mastodon client that automatically plays your friends' music (Git version)"
arch=(any)
url="https://github.com/zigg/${pkgname%-git}"
license=('MIT')
depends=(ffmpeg python
         python-{appdirs,click,cssselect,dotenv,keyring,lxml,mastodon}
         youtube-dl)
makedepends=(git python-setuptools)
source=("git+https://github.com/zigg/${pkgname%-git}"
        "LICENSE")
sha256sums=('SKIP'
            '37598db0448cfa858461cfa4d36a17b39dcb45ea7957e4dc81cdbddd0ef6cdc3')

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -i 's/py_modules=/packages=/' setup.py
}

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
