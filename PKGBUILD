# Maintainer: taotieren <admin@taotieren.com>

pkgname=gui.for.singbox
_name=GUI.for.SingBox
pkgver=1.26.1
pkgrel=1
pkgdesc="GUI.for.SingBox A GUI program developed by vue3 + wails."
arch=($CARCH)
url="https://github.com/GUI-for-Cores/GUI.for.SingBox"
license=('GPL-3.0-or-later')
provides=(${pkgname} ${pkgname//./-})
conflicts=(${pkgname} ${pkgname//./-})
# replaces=(${pkgname})
depends=(
    gdk-pixbuf2
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    libsoup3
    webkit2gtk-4.1
)
makedepends=(
    pnpm
    git
    go
    wails
)
optdepends=(
    'sing-box: The universal proxy platform'
)
backup=()
options=(!debug !strip !lto emptydirs)
install=${pkgname}.install
source=(
    "${pkgname}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.tmpfiles"
    "${pkgname}.sysusers"
    "${pkgname}.install"
)
sha256sums=('7bf229a06dbe53f3eed11cfff28a8de698aa3c16efc67111ebfb9b6f3c49b8eb'
            'c89a7b9740039857f57d6294d28a39854067ddd8469c7f1b5efc62b91cdf772a'
            '8d51fea0925c08e33150be47b4100d145dee7998f241b02f5de42770cf5dfbb2'
            'feb47230c930ff09fc2fdebdf07aa0f76692bda24eeab32727b2286a93516671')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd ${srcdir}/${pkgname}/frontend
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >>npmrc
    pnpm install  --frozen-lockfile
}

build() {
    cd ${srcdir}/${pkgname}/frontend
    pnpm build

    cd "${srcdir}/${pkgname}/"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct

    wails build \
        -m -s -trimpath -skipbindings \
        -devtools \
        -tags webkit2_41 \
        -o ${_name}
}

package() {
    cd "${srcdir}/${pkgname}/"

    install -Dvm775 build/bin/${_name} -t ${pkgdir}/var/lib/${pkgname}/
    install -Dvm644 build/appicon.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_name}.png
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dvm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dvm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dvm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname//./-}.desktop <<EOF
[Desktop Entry]
Version=1.0
Name=${pkgname}
Comment=${pkgdesc}
StartupWMClass=${_name}
Exec=${_name}
Icon=${_name}.png
Terminal=false
Type=Application
Categories=Application;${_name};
StartupNotify=true

EOF
    install -dvm775 ${pkgdir}/var/lib/${pkgname}/data/{sing-box,locales,rolling-release,rulesets,subscribes,plugins,third} \
        ${pkgdir}/var/lib/${pkgname}/data/third/{node-configurator,node-convert,traffic-statistics} \
        ${pkgdir}/var/lib/${pkgname}/data/.cache/{imgs,icons}

    install -dvm755 ${pkgdir}/usr/bin
    ln -sf /var/lib/${pkgname}/${_name} ${pkgdir}/usr/bin/${_name}
    ln -sf /usr/bin/sing-box ${pkgdir}/var/lib/${pkgname}/data/sing-box/sing-box
}
