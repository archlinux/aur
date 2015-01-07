# Maintainer: James An <james@jamesan.ca>
# Contributor: Steven Allen <steven@stebalien.com>

_pkgname=jauth
pkgname="$_pkgname-git"
pkgver=r63.bbe0a11
pkgrel=1
pkgdesc='A reference desktop client for the google authenticator'
arch=('any')
url="https://github.com/mclamp/$_pkgname"
license=('unknown')
depends=('java-runtime' 'sh' 'jgoodies-forms')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/mclamp/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$_pkgname"

    JG_COMMON="/usr/share/java/jgoodies-common/*"
    JG_FORM="/usr/share/java/jgoodies-forms/*"
    CLASSPATH="$JG_COMMON:$JG_FORM:/usr/share/java/$_pkgname"

    javac -cp "$JG_FORM:." JAuth/AuthenticatorGUI.java
    printf "#%c/bin/sh\nexec /usr/bin/java -cp $CLASSPATH JAuth.AuthenticatorGUI \"\$@\"\n" ! > "$_pkgname"
}

package() {
    cd "$_pkgname"

    for FILE in JAuth/*.class JAuth/logo/* JAuth/fonts/*; do
        install -Dm644 "$FILE" "$pkgdir/usr/share/java/$_pkgname/$FILE"
    done

    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 README "$pkgdir/usr/share/licenses/$_pkgname/README"
    install -dm755 "$pkgdir/usr/share/doc/$_pkgname"
    ln -s "/usr/share/licenses/$_pkgname/README" "$pkgdir/usr/share/doc/$_pkgname/README"
}
