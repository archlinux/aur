# Maintainer: taotieren <admin@taotieren.com>

pkgname=gui.for.clash
_name=GUI.for.Clash
pkgver=1.25.3
pkgrel=1
pkgdesc="GUI.for.Clash Modern A GUI program developed by vue3 + wails."
arch=($CARCH)
url="https://github.com/GUI-for-Cores/GUI.for.Clash"
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
    'mihomo: Another Clash Kernel by MetaCubeX, formerly known as Clash.Meta'
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
sha256sums=('facbd26bfde951f28dae5d874067b074b3a97d8a45f7e85425eeb2968894bbed'
            'e24b2134498ae4b46b297b637684a66669cb18ed7f0600f7183e4c6d955f785d'
            '9282f9ebf164e1f7f2c312eb2d7eb6f53bb2ce52765a51bfc1999d05846cccf0'
            'adcad01703f4359470a14d2817303ce242fb1cc7d729cdd3da04df642b1ed501')

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
    install -dvm775 ${pkgdir}/var/lib/${pkgname}/data/{mihomo,locales,rolling-release,rulesets,subscribes,plugins,third} \
        ${pkgdir}/var/lib/${pkgname}/data/third/{node-configurator,node-convert,traffic-statistics} \
        ${pkgdir}/var/lib/${pkgname}/data/.cache/{imgs,icons}

    install -dvm755 ${pkgdir}/usr/bin
    ln -sf /var/lib/${pkgname}/${_name} ${pkgdir}/usr/bin/${_name}
    ln -sf /usr/bin/mihomo ${pkgdir}/var/lib/${pkgname}/data/mihomo/mihomo
}
