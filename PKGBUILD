# Maintainer: givani30 <givaniboek@hotmail.com>

pkgname=openvino-bin
pkgver=2025.4.0
_buildver=20398.8fdad55727d
pkgrel=1
pkgdesc="OpenVINO™ Toolkit (Pre-compiled Binary) - Includes Python Bindings"
arch=('x86_64')
url="https://software.intel.com/en-us/openvino-toolkit"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'pugixml' 'ocl-icd' 'ncurses')
optdepends=('intel-compute-runtime: for Intel GPU support'
            'intel-media-driver: for GPU media processing'
            'intel-npu-driver: for Intel NPU support'
            'python: for Python bindings')
provides=('openvino' 'openvino-intel-gpu-plugin' 'openvino-intel-npu-plugin' 'python-openvino')
conflicts=('openvino' 'openvino-intel-gpu-plugin' 'openvino-intel-npu-plugin' 'python-openvino' 'openvino-git')
source=("https://storage.openvinotoolkit.org/repositories/openvino/packages/2025.4/linux/openvino_toolkit_ubuntu24_${pkgver}.${_buildver}_x86_64.tgz")
sha256sums=('c57bc759a04bf316d66dc42d644433cf3bd590ad640933630a0616efb380a630')
install=openvino-bin.install

package() {
  cd "$srcdir/openvino_toolkit_ubuntu24_${pkgver}.${_buildver}_x86_64"

  # Install to /opt/intel/openvino
  install -d "$pkgdir/opt/intel/openvino"
  cp -r * "$pkgdir/opt/intel/openvino/"

  # Create ld.so.conf.d entry so libraries are found automatically
  install -d "$pkgdir/etc/ld.so.conf.d"
  echo "/opt/intel/openvino/runtime/lib/intel64" > "$pkgdir/etc/ld.so.conf.d/openvino.conf"
  echo "/opt/intel/openvino/runtime/3rdparty/tbb/lib" >> "$pkgdir/etc/ld.so.conf.d/openvino.conf"

  # Fix permissions
  chmod -R +r "$pkgdir/opt/intel/openvino"
  find "$pkgdir/opt/intel/openvino" -type d -exec chmod 755 {} +
  
  # Symlink the setupvars script to /usr/bin for easier access
  install -d "$pkgdir/usr/bin"
  ln -s /opt/intel/openvino/setupvars.sh "$pkgdir/usr/bin/openvino-setupvars"

  # Python Integration
  # Get system python version to install .pth file correctly
  local pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
  install -d "$pkgdir/usr/lib/python${pyver}/site-packages"
  echo "/opt/intel/openvino/python" > "$pkgdir/usr/lib/python${pyver}/site-packages/openvino-bin.pth"

  # Install License (Arch Guideline)
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 docs/licensing/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}