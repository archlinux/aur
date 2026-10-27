# Maintainer: taotieren <admin@taotieren.com>

pkgname=resd-mini
pkgver=3.1.3
pkgrel=3
pkgdesc="This is the mini version of a high-value, high-performance and diverse resource downloader called res-downloader."
arch=($CARCH)
url="https://github.com/putyy/resd-mini"
license=('Apache-2.0')
provides=(${pkgname})
conflicts=(${pkgname})
# replaces=(${pkgname})
depends=(
    glibc
    hicolor-icon-theme
)
makedepends=(
    pnpm
    git
    go
    nodejs
)
optdepends=(
    'motrix: A full-featured download manager (release version)'
    'gopeed-bin: High speed downloader that supports all platforms.(Prebuilt version)'
    'res-downloader: This is a high-value and high-performance and diverse resource downloader called res-downloader'
)
backup=()
options=(!debug !strip !lto)
install=${pkgname}.install
source=(
    "${pkgname}::git+${url}.git#tag=${pkgver}"
    ${pkgname}.install)
sha256sums=('b64fd88871ef9b61f7f6adab9a37063b57f367faebc8f314c060f7add364e562'
            '46feddf76850fb1a3991f8f82e5ee738b28070e34339e02dbc1f52c83dea5a73')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/web"
    rm -rf node_modules pnpm-lock.yaml
}

build() {
  cd "${srcdir}/${pkgname}/"

  export npm_config_allow_remote=all
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GO111MODULE=on
  export GOPROXY=https://goproxy.cn,direct

  pushd web 
  export CARGO_HOME="${srcdir}/.cargo"
  cat > .npmrc <<EOF
  link-workspace-packages=true
  fetch-retry-maxtimeout=10000
  cache-dir=${srcdir}/.pnpm_cache
  store-dir=${srcdir}/.pnpm_store
  shamefully-hoist=true
  virtual-store-dir-max-length=80
  dangerously-allow-all-builds=true
EOF

export VITE_DEVTOOLS=false
export NODE_ENV=production
  # pnpm install --force --config.dangerouslyAllowAllBuilds=true
  pnpm install --force --allow-build esbuild --allow-build @parcel/watcher --allow-build vue-demi
  pnpm run build-only
  popd
  #     wails build
  go build -o ${pkgname}
}

package() {
    cd "${srcdir}/${pkgname}/"

    install -Dvm755 ${pkgname} -t ${pkgdir}/usr/bin
    install -Dvm644 web/src/assets/image/logo.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
    #     install -Dvm644 build/linux/Arch/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dvm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname}.desktop <<EOF
[Desktop Entry]
Type=Application
Name=${pkgname}
Comment=${pkgdesc}
Exec=${pkgname}
Icon=${pkgname}.png
Terminal=false
Categories=Utility

EOF
}
