# Maintainer: Tom Himanen <tom.himanen@futuhima.ninja>
pkgname=vllama
pkgver=0.1.1
pkgrel=5
pkgdesc="vLLM + Ollama hybrid server - Fast inference with Ollama model management"
arch=('x86_64')
url="https://github.com/erkkimon/vllama"
license=('MIT')
depends=('python' 'ollama' 'python-pip' 'python-setuptools')
makedepends=('python-setuptools' 'git')
install=vllama.install

_commit=4143fc1ac8b587641b2fdfcc67591a0605c4e078
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
sha256sums=('877c3fb69f1e24fc0b2856f9981cf51323a0dc5ed2ab3c02a5e3a70a67dd0a98'
            '32f30f302919e881bf3205320b9f8c5dc7720738223bb035a26f856cdc9cf882'
            '316d741d3c15533002b0607d88ac9231c72258e5e856bd470805a8ba1b9ee29f'
            '31f4c14151724ea11aa539510d91f793ded6a02ce871aa457e0d7acd854aa339')
