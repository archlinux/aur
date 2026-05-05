# Maintainer: RandomChugokujinIncluded
pkgname=eyewitness-git
pkgver=r1229.c3286fb
pkgrel=1
pkgdesc="Take screenshots of websites, provide server header info, and identify default credentials"
arch=('any')
url="https://github.com/RedSiege/EyeWitness"
license=('GPL3')
depends=('python' 'chromium' 'xorg-server-xvfb')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-virtualenv: for isolated virtual environment installation')
provides=('eyewitness')
conflicts=('eyewitness')
source=("${pkgname}::git+https://github.com/RedSiege/EyeWitness.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"
  # Optional: create virtual environment during build
  # python -m venv venv
}

build() {
  cd "${pkgname}"
  # The project uses a shell-based setup; no traditional build needed
}

package() {
  cd "${pkgname}"

  # Install main Python script and supporting files
  install -d "${pkgdir}/opt/eyewitness"
  cp -r Python "${pkgdir}/opt/eyewitness/"
  cp -r setup "${pkgdir}/opt/eyewitness/"
  cp -r Config "${pkgdir}/opt/eyewitness/" 2>/dev/null || true

  # Install Python dependencies
  install -d "${pkgdir}/opt/eyewitness/eyewitness-venv"
  python -m venv "${pkgdir}/opt/eyewitness/eyewitness-venv"

  # Upgrade pip and install dependencies
  "${pkgdir}/opt/eyewitness/eyewitness-venv/bin/pip" install --upgrade pip setuptools wheel
  "${pkgdir}/opt/eyewitness/eyewitness-venv/bin/pip" install \
    netaddr \
    psutil \
    selenium \
    rapidfuzz \
    pyvirtualdisplay \
    argcomplete \
    requests \
    urllib3

  # Create a wrapper script for easy execution
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/eyewitness" << 'EOF'
#!/bin/bash
source /opt/eyewitness/eyewitness-venv/bin/activate
python /opt/eyewitness/Python/EyeWitness.py "$@"
EOF
  chmod +x "${pkgdir}/usr/bin/eyewitness"

  # Install man page or documentation (optional)
  install -d "${pkgdir}/usr/share/doc/eyewitness"
  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
