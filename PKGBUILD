# Maintainer: Tom Himanen <tom.himanen@futuhima.ninja>
pkgname=vllama
pkgver=0.1.1
pkgrel=4
pkgdesc="vLLM + Ollama hybrid server - Fast inference with Ollama model management"
arch=('x86_64')
url="https://github.com/erkkimon/vllama"
license=('MIT')
depends=('python' 'ollama' 'python-pip' 'python-setuptools')
makedepends=('python-setuptools' 'git')
install=vllama.install

_commit=b31c3d1b128eeb4a8566d4e3204010889ebae580
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
    # Install main script
    install -Dm755 vllama.py "${pkgdir}/opt/vllama/vllama.py"

    # Copy venv
    cp -r venv312 "${pkgdir}/opt/vllama/"

    # Install systemd service
    install -Dm644 "${srcdir}/vllama.service" "${pkgdir}/usr/lib/systemd/system/vllama.service"
    install -Dm644 "${srcdir}/multiuser.conf" "${pkgdir}/etc/systemd/system/vllama.service.d/multiuser.conf"
}
sha256sums=('3d44dc6d049708f7f4fc53960e32938f098b8e956e51815ac8378ae57e561882'
            '32f30f302919e881bf3205320b9f8c5dc7720738223bb035a26f856cdc9cf882'
            '316d741d3c15533002b0607d88ac9231c72258e5e856bd470805a8ba1b9ee29f'
            '31f4c14151724ea11aa539510d91f793ded6a02ce871aa457e0d7acd854aa339')
