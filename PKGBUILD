# Maintainer: sim0n <aur.direction446@aleeas.com>
pkgname=sing-box-ref1nd-git
_pkgname=sing-box
pkgver=1.14.0.alpha.18.reF1nd
pkgrel=1
options=(!lto)

pkgdesc='The universal proxy platform.'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/reF1nd/sing-box/tree/reF1nd-testing-next'
license=('GPL3 with name use or association addition')

makedepends=('go' 'git' 'lld')
provides=("$_pkgname")

source=("$_pkgname::git+https://github.com/reF1nd/sing-box.git")
sha256sums=('SKIP')

conflicts=("$_pkgname-git" "$_pkgname-alpha" "$_pkgname-beta" "$_pkgname-ref1nd")

backup=("etc/$_pkgname/config.json")

pkgver() {
  cd "${srcdir}/${_pkgname}"

  mapfile -t _tags < <(git tag --list "*[Rr][Ee][Ff]1[Nn][Dd]*")

  if [ ${#_tags[@]} -eq 0 ]; then
    echo "Error: No tags containing 'reF1nd' found." >&2
    exit 1
  fi

  _latest_tag="${_tags[0]}"
  for _t in "${_tags[@]}"; do
    _cur_v=$(echo "${_t#v}" | tr '-' '.')
    _max_v=$(echo "${_latest_tag#v}" | tr '-' '.')

    if [ "$(vercmp "$_cur_v" "$_max_v")" -gt 0 ]; then
      _latest_tag="$_t"
    fi
  done

  git checkout "$_latest_tag" --quiet

  echo "${_latest_tag#v}" | tr '-' '.'
}

_tags=with_utls,with_gvisor,with_quic,with_wireguard,with_clash_api,with_acme,with_dhcp,with_tailscale,with_naive_outbound
build(){
    cd "$_pkgname"

    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS -fuse-ld=lld"
    export CGO_ENABLED=1
    local _real_version="$pkgver"

    go build \
        -v \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -tags "$_tags" \
        -ldflags "
            -X \"github.com/sagernet/sing-box/constant.Version=$_real_version\"
            -s -w -buildid= -linkmode=external" \
        ./cmd/sing-box

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
