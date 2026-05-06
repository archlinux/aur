# Maintainer: RandomChugokujin <randomchugokujin@tutamail.com>
pkgname=eyewitness-git
pkgver=r1229.c3286fb
pkgrel=2
pkgdesc="Take screenshots of websites, provide server header info, and identify default credentials"
arch=('x86_64')
url="https://github.com/RedSiege/EyeWitness"
license=('GPL3')
depends=('python' 'chromium' 'xorg-server-xvfb')
makedepends=('git' 'python-pip')

provides=('eyewitness')
conflicts=('eyewitness')
source=("${pkgname}::git+https://github.com/RedSiege/EyeWitness.git")
sha256sums=('SKIP')

_pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
_pkgroot="/opt/eyewitness"
_pylib="${_pkgroot}/lib/python${_pyver}/site-packages"

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"

  install -d "${pkgdir}${_pkgroot}"
  cp -r Python setup Config "${pkgdir}${_pkgroot}/" 2>/dev/null || true

  install -d "${pkgdir}${_pylib}"

  # Install dependencies from upstream spec
  python -m pip install \
    --target="${pkgdir}${_pylib}" \
    --no-compile \
    -r setup/requirements.txt

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/eyewitness" << EOF
#!/bin/bash
export PYTHONPATH="${_pylib}:\$PYTHONPATH"
export PYTHONNOUSERSITE=1
exec python /opt/eyewitness/Python/EyeWitness.py "\$@"
EOF

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
