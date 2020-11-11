# Maintainer: Potato Hatsue <berberman@yandex.com>

pkgname=agda-categories
pkgver=0.1.4
_agdaver=2.6.1.2
pkgrel=1
pkgdesc="A new Categories library for Agda"
url="https://github.com/agda/agda-categories"
license=("MIT")
arch=('x86_64')
depends=("agda=$_agdaver" "agda-stdlib")
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/agda/agda-categories/archive/v$pkgver.tar.gz"
agda-categories.agda-lib.in)
sha512sums=('42597d207507cd77f033857079fb4d4d6f5b1771c26a4f9441c4a3968c2eedf4e12cb33ca91d0ecf5d49c965a79a8f5c6435caf97e26319fb389d765f11d63fe'
            'b5695a41517a58624caadfce121a57ed9cedc9570935bd84bc8b13fafc372c45e010239f7ea31ccd22ac6d605418f9160c7c62b5d43b9d8f76af9a264a7ff6cc')

prepare() {
    cd $pkgname-$pkgver
    rm agda-categories.agda-lib
}

build() {
    cd $pkgname-$pkgver

    find src/ -name '[^\.]*.agda' | sed -e 's|^src/[/]*|import |' -e 's|/|.|g' -e 's/.agda//' -e '/import Everything/d' | LC_COLLATE='C' sort > Everything.agda
    agda -i. -isrc Everything.agda
}

package() {
    install -Dm644 agda-categories.agda-lib.in "$pkgdir"/usr/share/agda/lib/agda-categories.agda-lib

    cd $pkgname-$pkgver

    cp -pr _build/$_agdaver/agda/src/* src
    install -dm755 "$pkgdir"/usr/share/agda/lib/categories
    cp -pr src/* "$pkgdir"/usr/share/agda/lib/categories/

    # Symlink to avoid writing to this place when agda-lib is present
    install -dm755 "$pkgdir"/usr/share/agda/lib/_build/$_agdaver/agda
    ln -s ../../../categories "$pkgdir"/usr/share/agda/lib/_build/$_agdaver/agda/

    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
