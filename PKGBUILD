# Maintainer: Arthur Skowronek (0x5a17ed) <0x5a17ed at tuta dot io>

_pkgname=display-switch
pkgname=$_pkgname-git
pkgver=0.3.0.r28.5f5ee6e
pkgrel=2
pkgdesc="Switching monitor inputs via DDC/CI based on USB device connect/disconnect events."
url="https://github.com/haimgel/display-switch"
arch=('i686' 'x86_64')
provides=('display-switch')
conflicts=('display-switch')
license=('MIT')
depends=('libusb' 'systemd-libs')
makedepends=('cargo' 'git')
backup=('etc/conf.d/display-switch/display-switch.ini')
source=("$_pkgname::git+https://github.com/haimgel/display-switch"
        'display-switch.ini'
        'display_switch.service'
        'sysusers.conf'
        'udev.rules')
sha256sums=('SKIP'
            'c05761988d4e2184f3c5c93e1a3ac581c82e718f8ccbc4c29d3a4ac0035b4cdb'
            'f61bd6b888612a1019cda81546af8e232389dd9880294c4b3962d5f0a473b9fc'
            'd74e3706c7fc751c4e231589b75097412b82de4d8701c096ca22503a5599569a'
            'eba76d15a3295c60d020e9beb56f3c852665a2c23d1760cad04293413a359b61')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "${srcdir}/${_pkgname}"
  cargo test --release --locked --target-dir=target
}

package() {
  install -Dt "${pkgdir}/usr/bin" \
    -m0755 "${_pkgname}/target/release/display_switch"
  install -Dt "${pkgdir}/usr/share/doc/$pkgname" \
    -m0644 "${_pkgname}/README.md"
  install -Dt "${pkgdir}/usr/share/licenses/$pkgname" \
    -m0644 "${_pkgname}/LICENSE"

  install -Dt "${pkgdir}/etc/conf.d/display-switch" \
    -m0644 "display-switch.ini"

  # systemd integration
  install -D -m0644 "${srcdir}/display_switch.service" \
    "${pkgdir}/usr/lib/systemd/system/${_pkgname//-/_}.service"

  install -D -m0644 "${srcdir}/udev.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/90-${_pkgname//-/_}.rules"

  install -D -m0644 "${srcdir}/sysusers.conf" \
     "${pkgdir}/usr/lib/sysusers.d/${_pkgname//-/_}.conf"
}
