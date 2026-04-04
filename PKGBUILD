# Maintainer: Claude <noreply@anthropic.com>
# Packaging Repo: https://github.com/orange-guo/aur-packages

pkgname=cli-proxy-api-bin
_pkgname=cli-proxy-api
_repouser="router-for-me"
_reponame="CLIProxyAPI"
pkgver=6.9.14
pkgrel=1
pkgdesc="Proxy server providing OpenAI/Gemini/Claude compatible API interfaces (Binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/${_repouser}/${_reponame}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

# Disable stripping as the binary is pre-compiled and may lack symbols
options=('!strip')

install=cli-proxy-api-bin.install
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/${_repouser}/${_reponame}/releases/download/v${pkgver}/${_reponame}_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('662a21787ac927c76d2277259ed000ef792924f942f7e74b25fa6d2b7e7e8672')
sha256sums_aarch64=('0f26d0eeb0bbd002c1add0c58548e0266291657c6f5b57b2e7291489908aca44')

source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/${_repouser}/${_reponame}/releases/download/v${pkgver}/${_reponame}_${pkgver}_linux_arm64.tar.gz")

package() {
    # Binary name is cli-proxy-api inside the tarball
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Install example config
    install -Dm644 "${srcdir}/config.example.yaml" "${pkgdir}/usr/share/doc/${pkgname}/config.example.yaml"

    # Create systemd service file
    cat <<EOF > "${srcdir}/${_pkgname}.service"
[Unit]
Description=CLIProxyAPI Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/${_pkgname} --config %h/.cli-proxy-api/config.yaml
Restart=always
RestartSec=10

[Install]
WantedBy=default.target
EOF

    install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"

    # Install license if available
    if [ -f "${srcdir}/LICENSE" ]; then
        install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}

