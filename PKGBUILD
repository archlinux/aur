# Maintainer: suzakuwcx <suzakuwcx@gmail.com>
pkgname=incubator-answer
pkgver=1.3.0
pkgrel=1
pkgdesc="A Q&A platform software for teams at any scales"
arch=('any')
url="https://answer.apache.org/"
license=('Apache-2.0')
makedepends=('pnpm' 'git' 'go')
source=("${pkgname}::git+https://github.com/apache/${pkgname}.git#tag=v$pkgver"
        "0001-change-default-config-location-from-data-to-var-lib-.patch"
        "answer.service"
        "answer-sysusers.conf"
        "answer-tmpfiles.conf")
sha256sums=('SKIP'
            '4953c50bd98f8f8be0d290b6dbf7b4a6508b698d9dcdf6abe54074e6edc9505a'
            '17d831a8d58ab63ca792c0fd5b4915545a76d7ce2fd7f4e0328a42dca48b7687'
            'a9e778c01f7272567b6701556708d0105b7c353f0aff5a41a9b8789edbe902ca'
            '2c28c20a19678a29770e7e4cda0f7ed4d5433fad739935eaaa166207a6a6e1f5')

prepare() {
    cd "$pkgname"
    patch -p1 -i "$srcdir/0001-change-default-config-location-from-data-to-var-lib-.patch"
}

build() {
    export GOPATH="$srcdir/gopath"
    export PATH="$srcdir/gopath/bin/:${PATH}"

    cd "$pkgname"
    make ui
    proxy-run make
}

package() {
    cd "$pkgname"
    install -Dm755 answer "$pkgdir/usr/bin/answer"

    install -Dm644 "$srcdir/answer.service" "$pkgdir/usr/lib/systemd/system/answer.service"

    # sysusers and tmpfiles files
    install -Dm0644 "$srcdir/answer-sysusers.conf" "$pkgdir"/usr/lib/sysusers.d/answer.conf
    install -Dm0644 "$srcdir/answer-tmpfiles.conf" "$pkgdir"/usr/lib/tmpfiles.d/answer.conf
}
