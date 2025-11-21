# Maintainer: sim0n <aur.direction446@aleeas.com>
pkgname=sing-box-ref1nd-git
_pkgname=sing-box
pkgver=1.13.0.alpha.27.reF1nd.1
pkgrel=2

pkgdesc='The universal proxy platform.'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/reF1nd/sing-box/tree/reF1nd-dev'
license=('GPL3 with name use or association addition')

makedepends=('go' 'git')
provides=("$_pkgname")

source=("$_pkgname::git+https://github.com/reF1nd/sing-box.git#branch=reF1nd-dev")
sha256sums=(SKIP)


conflicts=("$_pkgname-git" "$_pkgname-alpha" "$_pkgname-beta" "$_pkgname-ref1nd")

backup=("etc/$_pkgname/config.json")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Get the latest tag that contains ref1nd and (beta or alpha)
  latest_tag=$(git tag --list | grep -i ref1nd | grep -E "(beta|alpha)" | sort -V | tail -1)
  if [ -z "$latest_tag" ]; then
    echo "No suitable tag found" >&2
    exit 1
  fi
  # Remove 'v' prefix and convert to pkgver format
  version=${latest_tag#v}
  echo "$version" | sed 's/-/./g'
}


_tags=with_utls,with_gvisor,with_quic,with_wireguard,with_clash_api,with_acme,with_dhcp,with_tailscale
build(){
    cd "$_pkgname"

    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export VERSION=$(go run ./cmd/internal/read_tag)

    go build \
        -v \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -tags "$_tags" \
        -ldflags "
            -X \"github.com/sagernet/sing-box/constant.Version=$VERSION\"
            -s -w -buildid= -linkmode=external" \
        ./cmd/sing-box

    sed -i "/^\[Service\]$/a StateDirectory=$_pkgname"    release/config/$_pkgname.service
    sed -i "/^\[Service\]$/a StateDirectory=$_pkgname-%i" release/config/$_pkgname@.service
    sed -i "/^\[Service\]$/a User=$_pkgname"              release/config/$_pkgname*.service

    echo "u $_pkgname - \"Sing-box Service\" - -" > "release/config/$_pkgname.sysusers"

    install -d completions
    go run ./cmd/sing-box completion bash   > completions/bash
    go run ./cmd/sing-box completion fish   > completions/fish
    go run ./cmd/sing-box completion zsh    > completions/zsh
}

package() {
    cd "$_pkgname"

    install -Dm644 LICENSE                            -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm755 "$_pkgname"                         -t "$pkgdir/usr/bin"
    install -Dm644 "release/config/config.json"       -t "$pkgdir/etc/$_pkgname"
    install -Dm644 "release/config/$_pkgname.service"  -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$_pkgname@.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$_pkgname.sysusers"    "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "release/config/sing-box.rules"       "$pkgdir/usr/share/polkit-1/rules.d/sing-box.rules"

    install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash"
    install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 completions/zsh  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
