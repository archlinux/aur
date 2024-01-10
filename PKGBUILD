# Maintainer: Ralph Torres <mail at ralphptorr dot es>

_pkgname=pass-otp
pkgname=$_pkgname-age
pkgver=1.2.0
pkgrel=1
pkgdesc='A pass extension for managing one-time-password (OTP) tokens, with support for age backend'
arch=(any)
url=https://github.com/tadfisher/pass-otp
license=(GPL3)

conflicts=($pkgname)
provides=($pkgname)
depends=(passage oath-toolkit qrencode)
_commit=a364d2a71ad24158a009c266102ce0d91149de67
source=(
    $_pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz
    0001-support-age.patch::https://github.com/tadfisher/pass-otp/pull/178.patch
    0002-revert-24330b8.patch
    0003-revert-0aadd4c.patch
)
sha256sums=(
    02c6fa59b30ee009c62807b763c41df44cc9e4da3e137f1b5774e995ee18e2f6
    fc3282ded75cc0399b9f38e904856572bfe0e513a35a6a9d0777079d38682a70
    c46c46f61f9c66dc813990d63ac7e5cced6c1bfc563fbe1329071b02cc58c6df
    647f61e787f3193d889a82b89e9b3410b21b566e15be8edc7cb8861ce9c09bce
)

prepare() {
    cd "$srcdir"/$_pkgname-$_commit
    patch --forward --strip=1 --input="$srcdir"/0001-support-age.patch
    patch --forward --strip=1 --input="$srcdir"/0002-revert-24330b8.patch
    patch --forward --strip=1 --input="$srcdir"/0003-revert-0aadd4c.patch
    sed -i 's/password-store/passage/' Makefile
}

package() {
    cd "$srcdir"/$_pkgname-$_commit
    make DESTDIR="$pkgdir/" install
}
