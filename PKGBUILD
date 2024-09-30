# Maintainer: A Farzat <a@farzat.xyz>

pkgname=tg-archive-git
_pkgname=tg-archive
pkgver=1.2.1.r0.gec944d5
pkgrel=1
pkgdesc='A tool for exporting Telegram group chats into static websites to preserve chat history like mailing list archives.'
arch=(any)
url=https://github.com/knadh/tg-archive
license=('MIT')
depends=(python python-cryptg python-feedgen python-jinja python-pillow python-yaml python-telethon python-magic python-pytz)
makedepends=(git python-setuptools)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/knadh/tg-archive.git")
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cp "$srcdir/$_pkgname/LICENSE" "$srcdir"
    sed -i 's/telethon==1.29.3/telethon>=1.29.3/' "$srcdir/$_pkgname/requirements.txt"
    sed -i 's/cryptg==0.2.post2/cryptg>=0.2.post2/' "$srcdir/$_pkgname/requirements.txt"
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --optimize=1 --root="$pkgdir" --skip-build
    install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
