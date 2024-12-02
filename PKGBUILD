# Maintainer:

_pkgname="das-keyboard-q"
pkgname="$_pkgname"
pkgver=4.2.1
pkgrel=2
pkgdesc="Software for Das Keyboard 5Q, 5Qs, 4Q"
url="https://www.daskeyboard.io/get-started/software/"
license=('Unknown')
arch=('x86_64')

options=('!debug')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="deb"
source=("$_pkgsrc.$_pkgext"::"https://das-keyboard-q-releases.s3.us-east-2.amazonaws.com/das-keyboard-q/linux/x64/das-keyboard-q_${pkgver}_amd64.$_pkgext")
sha256sums=('628793ebdb839d08d0b5eec867dceac25da4f4e20a2d35c1b06eb3ef8760ded0')

package() {
  depends+=(
    alsa-lib
    at-spi2-core
    bash
    cairo
    dbus
    expat
    glib2
    gtk3
    libcups
    libdrm
    libx11
    libxcb
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxkbcommon
    libxrandr
    mesa
    nspr
    nss
    pango
  )

  tar xf data.tar.xz -C "$pkgdir"
  rm -rf "$pkgdir"/usr/share/{doc,lintian}

  install -Dm644 /dev/stdin /usr/lib/udev/rules.d/70-daskeyboard.rules << END
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", TAG+="uaccess"
SUBSYSTEM=="usb", ATTRS{idVendor}=="24f0", MODE="0660", TAG+="uaccess"
SUBSYSTEM=="usb_device", ATTRS{idVendor}=="24f0", MODE="0660", TAG+="uaccess"
END

  chmod -R u+rwX,go+rX,go-ws,u-s "$pkgdir/"
}
