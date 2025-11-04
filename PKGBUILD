# Maintainer: Tom Himanen <tom.himanen@futuhima.ninja>
pkgname=vllama
pkgver=0.2.0
pkgrel=5
pkgdesc="vLLM + Ollama hybrid server - Fast inference with Ollama model management"
arch=('x86_64')
url="https://github.com/erkkimon/vllama"
license=('MIT')
depends=('python' 'ollama' 'python-pip' 'python-setuptools')
makedepends=('python-setuptools' 'git')
install=vllama.install

_commit=40602f1e70f3ca4fd98f7f7ff77deddeeda3040b
source=("${pkgname}-${_commit}.tar.gz::https://github.com/erkkimon/vllama/archive/${_commit}.tar.gz"
        "vllama.service"
        "multiuser.conf"
        "vllama.install")

build() {
    cd "${srcdir}/${pkgname}-${_commit}"
    # Create venv312 in package
    python3.12 -m venv venv312
    
    # Install dependencies in venv
    venv312/bin/pip install -r requirements.txt
}

package() {
    cd "${srcdir}/${pkgname}-${_commit}"
    
    # Install main script
    install -Dm755 vllama.py "${pkgdir}/opt/vllama/vllama.py"

    # Copy venv
    cp -r venv312 "${pkgdir}/opt/vllama/"

    # Install systemd service
    install -Dm644 "${srcdir}/vllama.service" "${pkgdir}/usr/lib/systemd/system/vllama.service"
    install -Dm644 "${srcdir}/multiuser.conf" "${pkgdir}/etc/systemd/system/vllama.service.d/multiuser.conf"
}

sha256sums=('7664ce171d46ae02e7c61e0217c7cc73b2e13b570cb536c69826dcdd5e2b5de0'
            '32f30f302919e881bf3205320b9f8c5dc7720738223bb035a26f856cdc9cf882'
            '316d741d3c15533002b0607d88ac9231c72258e5e856bd470805a8ba1b9ee29f'
            '1d84cd4dab610669264163810c15a0101750a5764ccdd37f13aab061094f23bf')
