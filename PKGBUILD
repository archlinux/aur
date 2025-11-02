# Maintainer: Tom Himanen <tom.himanen@example.com>
pkgname=vllama
pkgver=0.1.1
pkgrel=1
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
sha256sums=('3d44dc6d049708f7f4fc53960e32938f098b8e956e51815ac8378ae57e561882'
            '893c64bce6b1f96db758e407fa8a7703f749036de028b67a5b1a6e4438f59764'
            '316d741d3c15533002b0607d88ac9231c72258e5e856bd470805a8ba1b9ee29f'
            'c5053477faadca94e9d61beacff94cfe841776009e0b448a4fcf6f4507bbbce7')

build() {
    cd "${srcdir}/${pkgname}-${_commit}"
    # Create venv312 in package
    python3.12 -m venv venv312
    
    # Install dependencies in venv
    source venv312/bin/activate
    pip install --no-deps -r requirements.txt
    
    # We don't install vllama.py or install_venv.sh directly here,
    # they will be moved to pkgdir in the package() function.
    # This build step ensures they are present in srcdir from the tarball extraction.
}

package() {
    cd "${srcdir}/${pkgname}-${_commit}"
    
    # Install main script
    install -Dm755 vllama.py "${pkgdir}/opt/vllama/vllama.py"
    install -Dm755 install_venv.sh "${pkgdir}/usr/bin/vllama"

    # Install systemd service
    install -Dm644 "${srcdir}/vllama.service" "${pkgdir}/usr/lib/systemd/system/vllama.service"
    install -Dm644 "${srcdir}/multiuser.conf" "${pkgdir}/etc/systemd/system/vllama.service.d/multiuser.conf"
}
