# Maintainer: Brian Cooper <brian at brian-cooper dot com>
# Contributor: Westofer Raymond <westoferraymond@gmail.com>
pkgname=athens-git
_pkgname=athens
pkgver=v1.0.0.beta.64.r3.g98a1fca
pkgrel=1
pkgdesc="Athens is an open-source and local-first alternative to Roam Research. Athens lets you take notes... Master branch "
arch=('i686' 'x86_64')
url="https://github.com/athensresearch/athens"
license=('Eclipse Public License - v 1.0') #TODO
groups=()
depends=("electron")
makedepends=("git" "nodejs" "leiningen" "yarn" "jq")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=('athens::git+https://github.com/athensresearch/athens' 'athens.sh' 'athens.desktop')
noextract=()
md5sums=('SKIP'
         'a11ab00f8e3f2be1320a5e67dcded1d1'
         'dc18f4e2bdea985fff72911e868dfce9')

pkgver() {
    cd "$srcdir/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${_pkgname}"
    # electron builder enforces email and homepage
    jq '.author|={"name":"athensresearch" , "email":"athensresearch@gmail.com"}' package.json  > tmp.json && mv tmp.json package.json
    jq '.homepage="https://github.com/athensresearch/athens"' package.json > tmp.json && mv tmp.json package.json
    yarn upgrade electron@"$(</usr/lib/electron/version)"
}

build() {
    cd "$srcdir/${_pkgname}"
    local i686=ia32 x86_64=x64

    yarn --cache-folder "${srcdir}/yarn-cache"
    lein compile 

    yarn --cache-folder "${srcdir}/yarn-cache" run \
        electron-builder --linux --"${!CARCH}" --dir \
        -c.electronDist=/usr/lib/electron \
        -c.electronVersion="$(</usr/lib/electron/version)"
}


package() {
    # desktop file
    cd "$srcdir"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${_pkgname}.desktop"
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

    cd "$srcdir/${_pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
    install -Dm644 "build/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "dist/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${_pkgname}.asar"
}

