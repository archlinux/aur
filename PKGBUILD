# Maintainer: kasish <kasishgadadhasu9950@gmail.com>
pkgname=unirun-git
pkgver=0.3
pkgrel=1
pkgdesc="An intelligent abstraction runtime orchestration layer for cross-platform apps"
arch=('any')
url="https://github.com/KasishStar/UniRun"
license=('MIT')
depends=('python')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KasishStar/UniRun/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    # Dynamically locate the source repository root directory regardless of its name
    local src_root=$(find "${srcdir}" -maxdepth 2 -name "unirun.py" -exec dirname {} \;)
    
    if [ -z "${src_root}" ] || [ ! -d "${src_root}" ]; then
        echo "ERROR: Could not locate the root project folder containing unirun.py!"
        exit 1
    fi

    cd "${src_root}"

    # Build shared data structures cleanly
    install -d "${pkgdir}/usr/share/unirun"
    
    # Check if directories exist before copying to prevent stat errors
    [ -d cli ] && cp -r cli "${pkgdir}/usr/share/unirun/"
    [ -d core ] && cp -r core "${pkgdir}/usr/share/unirun/"
    [ -d runtimes ] && cp -r runtimes "${pkgdir}/usr/share/unirun/"
    [ -f requirements.txt ] && cp requirements.txt "${pkgdir}/usr/share/unirun/"
    
    install -Dm755 unirun.py "${pkgdir}/usr/share/unirun/unirun.py"

    # Provision system executable path entry
    install -d "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/unirun"
#!/bin/sh
exec python3 /usr/share/unirun/unirun.py "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/unirun"
}
