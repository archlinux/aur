# Maintainer: Tom Himanen <tom.himanen@example.com>
pkgname=vllama
pkgver=0.1.1
pkgrel=1
pkgdesc="vLLM + Ollama hybrid server - Fast inference with Ollama model management"
arch=('x86_64')
url="https://github.com/erkkimon/vllama"
license=('MIT')
depends=('python' 'ollama' 'python-pip' 'python-setuptools')
makedepends=('python-setuptools')
install=vllama.install

source=("vllama.py"
        "vllama.service"
        "multiuser.conf"
        "requirements.txt"
        "install_venv.sh"
        "vllama.install")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    # Create venv312 in package
    cd "$srcdir"
    python3.12 -m venv "$pkgdir/opt/vllama/venv312"
    
    # Install dependencies in venv
    source "$pkgdir/opt/vllama/venv312/bin/activate"
    pip install --no-deps -r requirements.txt
    
    # Install main script
    install -Dm755 vllama.py "$pkgdir/opt/vllama/vllama.py"
    install -Dm755 install_venv.sh "$pkgdir/usr/bin/vllama"
    
    # Install systemd service
    install -Dm644 vllama.service "$pkgdir/usr/lib/systemd/system/vllama.service"
    install -Dm644 multiuser.conf "$pkgdir/etc/systemd/system/vllama.service.d/multiuser.conf"
    

    
    # Make wrapper executable
    chmod +x "$pkgdir/usr/bin/vllama"
}