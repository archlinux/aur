#!/hint/bash
# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Freso <archlinux@freso.dk>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libreoffice-extension-writingtool-noai-git
_name=libreoffice-writingtool-noai
pkgver=26.1.r53.g4f3527c
pkgrel=1
pkgdesc='WritingTool-NoAI is a LibreOffice extension for LibreOffice that adds a writing assistant to text editing with no “AI”.'
arch=('any')
url="https://codeberg.org/Freso/${_name}"
license=('LGPL-2.1-only')
groups=('libreoffice-extensions')
depends=(
    'java-runtime>=17'
    'libreoffice'
    'python'
    'perl'
    'bash'
)
makedepends=(
    'git'
    'maven'
    'java-environment=17'
)
provides=("${pkgname%%-noai-git}")
conflicts=("${pkgname%%-noai-git}")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "$_name"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "$_name"
    export PATH=/usr/lib/jvm/java-17-openjdk/bin:$PATH
    mvn -X -Dmaven.wagon.http.ssl.insecure=true \
        -Dmaven.wagon.http.ssl.allowall=true \
        -Dmaven.wagon.http.ssl.ignore.validity.dates=true \
        -Dmaven.resolver.transport=wagon \
        package \
        -DskipTests
}

package() {
    cd "$_name"
    install -dm755 "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
    bsdtar -xf target/WritingTool-*-SNAPSHOT.zip -C "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
}
