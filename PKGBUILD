# Maintainer: shyam (shyamganesh01@gmail.com)

pkgname=ligolo
pkgver=0.8.2
_pkgver=20250111
pkgrel=1
pkgdesc="An advanced, yet simple, tunneling/pivoting tool that uses a TUN interface."
arch=(x86_64)
url="https://github.com/nicocha30/ligolo-ng"
source=("https://raw.githubusercontent.com/nicocha30/ligolo-ng/refs/heads/master/README.md")
makedepends=('git' 'github-cli')
conflicts=('ligolo-ng')
provides=('ligolo')

pkgver() {
    gh release view -R nicocha30/ligolo-ng --json tagName --jq '.tagName' -q '.[]' | sort -V | tail -n 1 | cut -d '-' -f 2 | cut -c 2-
}

prepare() {
    gh release download --pattern '*' -D release -R ${url} --clobber
    mv release/* .
    mkdir -p {linux,windows,darwin,freebsd,openbsd}/{agent,proxy}/{amd64,arm64,armv6,armv7}
    
    # Extract Linux files
    tar -xzf "${srcdir}/ligolo-ng_agent_${pkgver}_linux_amd64.tar.gz" -C linux/agent/amd64/
    tar -xzf "${srcdir}/ligolo-ng_agent_${pkgver}_linux_arm64.tar.gz" -C linux/agent/arm64/
    tar -xzf "${srcdir}/ligolo-ng_proxy_${pkgver}_linux_amd64.tar.gz" -C linux/proxy/amd64/
    tar -xzf "${srcdir}/ligolo-ng_proxy_${pkgver}_linux_arm64.tar.gz" -C linux/proxy/arm64/
    
    # Extract Windows files
    unzip -j -d windows/agent/amd64 "${srcdir}/ligolo-ng_agent_${pkgver}_windows_amd64.zip"
    unzip -j -d windows/agent/arm64 "${srcdir}/ligolo-ng_agent_${pkgver}_windows_arm64.zip"
    unzip -j -d windows/proxy/amd64 "${srcdir}/ligolo-ng_proxy_${pkgver}_windows_amd64.zip"
    unzip -j -d windows/proxy/arm64 "${srcdir}/ligolo-ng_proxy_${pkgver}_windows_arm64.zip"
   
}
package() {

    for platform in linux windows; do
            for type in agent proxy; do
                for arch in amd64 arm64; do
                    if [ -d "$platform/$type/$arch" ] && [ "$(ls -A $platform/$type/$arch)" ]; then
                        install -Dm755 $platform/$type/$arch/* -t "${pkgdir}/usr/share/${pkgname}/${platform}/${type}/${arch}"
                    fi
                done
            done
        done
    
    # Install documentation
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
sha256sums=('0fc57ac44faf7c2380396924c04c4c4fca863eace6560340640502c4133cbdb4')
