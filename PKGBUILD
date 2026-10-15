# Maintainer: sunnysab <i@sunnysab.cn>
pkgname=intel-xpu-smi-bin
pkgver=2.3.0
pkgrel=2
# The build version part from the filename
_buildver=1.24.04
pkgdesc="Intel XPU SMI - CLI tool for Intel XPU Manager (Binary, Daemon-less)"
arch=('x86_64')
url="https://github.com/intel/xpumanager"
license=('MIT')

# Everything the binary links against, plus the Level Zero driver that
# level-zero-loader resolves at runtime.
depends=(
    'intel-compute-runtime'
    'level-zero-loader'
    'hwloc'
    'libpciaccess'
    'systemd-libs'
)

# Conflicts with the daemon-based manager as per Intel documentation
conflicts=('intel-xpumanager' 'intel-xpumanager-bin' 'intel-xpu-smi')
provides=('intel-xpu-smi')

source=("https://github.com/intel/xpumanager/releases/download/v${pkgver}/xpu-smi_${pkgver}-${_buildver}_amd64.deb")
sha256sums=('eb30a37967b404c83b4b2ddd76b6a927ef8c25961d672e1ff0c0bc4633f795f0')

package() {
    msg2 "Extracting data.tar.zst..."
    # The deb holds a single self-contained binary and its resource files:
    # 2.3.0 links libigsc and libmetee in statically and ships no libraries,
    # so there is nothing to move or relink.
    bsdtar -O -xf "${srcdir}/xpu-smi_${pkgver}-${_buildver}_amd64.deb" data.tar.zst | bsdtar -C "${pkgdir}" -xvf -
}
