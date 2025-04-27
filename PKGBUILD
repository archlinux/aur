# Maintainer: devome <evinedeng@hotmail.com>

pkgname="frp-panel"
pkgver=0.1.10
pkgrel=1
pkgdesc="A multi node frp webui and for frp server and client management"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/VaalaCat/${pkgname}"
backup=("etc/${pkgname}/"{client,master,server}.env)
license=("GPL-3.0-or-later")
makedepends=("go" "pnpm" "unzip")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
        "${pkgname}.tmpfiles"
        "${pkgname}@.service")
sha256sums=('e03a00797d6206accdc89b111531bbfa1c64e54c91d9193906c717f6740badc9'
            'd909eac5b51218404824363ce35886fcd2a8065773ffecde8f64855a107369a0'
            '430b38fb5de8ea2bdd03ef65d376b5aae7acad88cfffd5031d05b45e8ae1040b')

prepare() {
    cd "${pkgname}-${pkgver}"

    local file_setting="conf/settings.go"
    local n1 n2 element
    for element in App Master Server DB Client; do
        n1=$(grep -nP "^\s${element} struct \{" "$file_setting" | awk -F: '{print $1}')
        n2=$(grep -nP "env-prefix:\"${element^^}_\"" "$file_setting" | awk -F: '{print $1}')
        awk -v n1="${n1}" -v n2="${n2}" -F '"' '{if(NR>n1 && NR<n2){print "##"$3" "$4","$5" "$6"\n#""'${element^^}_'"$2"=\"\"\n"}}' "$file_setting" >> ../master.env
    done
    sed -i 's|,`||' ../master.env

    for element in client server; do
        grep -C1 -P "#APP_SECRET=|#CLIENT_" ../master.env > "../${element}.env"
        sed -i '/--/d' "../${element}.env"
    done
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    
    cd "${pkgname}-${pkgver}"

    pnpm --prefix www install --no-frozen-lockfile
    pnpm --prefix www build

    go mod download

    local build_date="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"
    local git_commit="$(unzip -zq ../"${pkgname}-${pkgver}.zip" | cut -c1-7)"
    local conf_prefix="${url//https:\/\//}/conf"
    local ldflags=" \
        -s -w \
        -X '${conf_prefix}.buildDate=${build_date}' \
        -X '${conf_prefix}.gitCommit=${git_commit}'
        -X '${conf_prefix}.gitVersion=${pkgver}' \
        -extldflags '${LDFLAGS}'
    "

    go build \
        -trimpath \
        -ldflags="$ldflags" \
        -o "${pkgname}" \
        ./cmd/frpp/*.go
    
    ./"${pkgname}" completion zsh  > ../completion.zsh
    ./"${pkgname}" completion bash > ../completion.bash
    ./"${pkgname}" completion fish > ../completion.fish
}

package() {
    install -Dm644 completion.zsh        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
    install -Dm644 completion.bash       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 completion.fish       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
    install -Dm644 *.env              -t "${pkgdir}/etc/${pkgname}"

    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}"          "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README*.md         -t "${pkgdir}/usr/share/doc/${pkgname}"
}
