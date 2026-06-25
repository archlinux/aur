# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: taotieren <admin@taotieren.com>

pkgbase=libusbsio
_name=${pkgbase}
pkgname=(
  libusbsio
  python-libusbsio
)
pkgver=2.2.1
pkgrel=1
pkgdesc="Library for USB-HID communication over SPI, I2C or GPIO"
arch=($CARCH)
url="https://www.nxp.com/design/software/development-software/library-for-windows-macos-and-ubuntu-linux:LIBUSBSIO"
license=(
  BSD-3-Clause
)
makedepends=(
  hidapi
  libusb
  python-build
  python-installer
  python-setuptools
  python-wheel
  systemd
)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('102d79911c99a17ca683ea6a5998021d8da3e8ffed0d37492f2dcfda6b553425bd87c8a57cf2255076a5958b3a5db9250591a87c3abe600642ae7b88f248dcb2')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package_libusbsio() {
  depends=(
    glibc
    systemd-libs
    libudev.so
  )

  cd "${srcdir}/${_name}-${pkgver}"
  install -vDm 755 ${_name}/bin/linux_$CARCH/$pkgbase.so -t "$pkgdir/usr/lib/"
}

package_python-libusbsio() {
  local _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

  pkgdesc+=" - Python bindings"
  depends=(
    glibc
    systemd-libs
    libusbsio=$pkgver
    python
  )

  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vdm 755 "$pkgdir/$_site_packages/$pkgbase/bin/linux_$CARCH"
  ln -fsv /usr/lib/$pkgbase.so "$pkgdir/$_site_packages/$pkgbase/bin/linux_$CARCH/$pkgbase.so"
  install -vDm 644 *.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 examples/*.py -t "$pkgdir/usr/share/doc/$pkgname/"
}
