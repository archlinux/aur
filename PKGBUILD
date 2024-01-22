# Maintainer: Evine Deng <evinedeng@hotmail.com>

pkgname="frp-panel"
pkgver=0.0.11
pkgrel=3
pkgdesc="A multi node frp webui and for frp server and client management"
arch=("any")
url="https://github.com/VaalaCat/${pkgname}"
backup=(
    "etc/${pkgname}/client.env"
    "etc/${pkgname}/master.env"
    "etc/${pkgname}/server.env"
)
license=("unkown")
depends=("glibc" "systemd")
makedepends=("gawk" "go" "grep" "npm" "sed")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.tmpfiles"
        "${pkgname}@.service")
sha256sums=('33bca8c3134299c59863f9a8901e7fffdad9abe89f10e3d394f1f716d79879b3'
            'd909eac5b51218404824363ce35886fcd2a8065773ffecde8f64855a107369a0'
            'a82a0d6fb9498a283137a90862a4bf65486368cfe88c25f7b901d4d914da7ca4')

prepare() {
    cd "${pkgname}-${pkgver}"

    local file_setting="conf/settings.go"
    local n1 n2 element
    for element in App Master Server DB; do
        n1=$(grep -nP "^\s${element} struct \{" "$file_setting" | awk -F: '{print $1}')
        n2=$(grep -nP "env-prefix:\"${element^^}_\"" "$file_setting" | awk -F: '{print $1}')
        awk -v n1="${n1}" -v n2="${n2}" -F '"' '{if(NR>n1 && NR<n2){print "##"$3" "$4","$5" "$6"\n#""'${element^^}_'"$2"=\"\"\n"}}' "$file_setting" >> ../master.env
    done

    for element in client server; do
        grep -C1 -P "#APP_SECRET=|#MASTER_RPC_HOST=|#MASTER_RPC_PORT=|#MASTER_API_PORT=" ../master.env > "../${element}.env"
        echo "## For ${element} nodes, need append clientSecret and clientID after start command, such as: " >> "../${element}.env"
        echo "#START_PARAMS=\"-s 'b16379b1-349c-421f-83b2-78c45b5c6de2' -i '${element}'\"" >> "../${element}.env"
        echo "START_PARAMS=\"\"" >> "../${element}.env"
        sed -i '/--/d' "../${element}.env"
    done
}

build() {
    cd "${pkgname}-${pkgver}"

    npm --prefix www install
    npm --prefix www run build

    go mod download

    local ldflags="-s -w -extldflags '${LDFLAGS}'"

    go build \
        -trimpath \
        -ldflags="$ldflags" \
        -o "${pkgname}" \
        ./cmd/*.go
    
    ./"${pkgname}" completion zsh > ../completion.zsh
    ./"${pkgname}" completion bash > ../completion.bash
    ./"${pkgname}" completion fish > ../completion.fish
}

package() {
    install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
    install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
    install -Dm644 -t "${pkgdir}/etc/${pkgname}" {master,server,client}.env

    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
