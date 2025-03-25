# Maintainer: oldkingOK <oldkingok.creeper@gmail.com>
pkgname=jbytemod-git
_pkgname="${pkgname%-git}"
pkgver=r168.f944765
pkgrel=1
pkgdesc="Modern Java ByteCode Editor, supporting jars and apks"
arch=('any')
license=('MIT')
depends=('jre21-openjdk')
makedepends=('jdk21-openjdk')
provides=(jbytemod)
conflicts=(jbytemod)
_repo_name="JByteMod-Remastered"
url="https://github.com/apkreader/${_repo_name}"
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_repo_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_repo_name}"
    mvn package
}

package() {
    cd "${srcdir}/${_repo_name}"
    local _latest_tag="$(git describe --abbrev=0 --tags)" 
    local _jar_main="JByteMod-Remastered-${_latest_tag}.jar"

    install -Dm644 "${srcdir}/${_repo_name}/target/${_jar_main}" "${pkgdir}/usr/share/${_pkgname}/${_jar_main}"
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" << END
#!/usr/bin/env sh
exec java -jar /usr/share/${_pkgname}/${_jar_main} "\$@"
END
}
