# Maintainer:
# Contributor: Ben Westover <kwestover.kw@gmail.com>

_pkgname="mtkclient"
pkgname="$_pkgname-git"
pkgver=2.1.2.r9.gb54c0c2
pkgrel=1
pkgdesc="Unofficial MTK reverse engineering and flash tool"
url="https://github.com/bkerler/mtkclient"
license=('GPL-3.0-only')
arch=('any')

depends=(
  pyside6
  python-capstone
  python-colorama
  python-fusepy # AUR
  python-keystone
  python-pycryptodomex
  python-pyserial
  python-pyusb
)
makedepends=(
  git
  python
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://github.com/bkerler/mtkclient.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  git tag 2.1.2 65d8c4aa8912e5f5d152466362c78ab1fbbfcd47 2> /dev/null || true
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  # specify python version to prevent untracked pyc files
  local _pyver_major _pyver_minor
  _pyver_major=$(python -c 'import sys; print(sys.version_info.major)')
  _pyver_minor=$(python -c 'import sys; print(sys.version_info.minor)')

  eval "depends+=(
    'python>=${_pyver_major}.${_pyver_minor}'
    'python<${_pyver_major}.$((_pyver_minor + 1))'
  )"

  # main files
  install -dm755 "$pkgdir/opt/$_pkgname"
  for i in mtk.py mtk_gui.py stage2.py examples mtkclient; do
    cp -a "$_pkgsrc/$i" "$pkgdir/opt/$_pkgname/"
  done

  # unwanted
  rm -rf "$pkgdir/opt/$_pkgname/mtkclient"/{Setup.Windows,build,src}

  # udev rules
  install -Dm644 /dev/stdin "$pkgdir"/usr/lib/udev/rules.d/52-mtk-edl.rules << END
# Qualcomm EDL
SUBSYSTEMS=="usb", ATTRS{idVendor}=="05c6", ATTRS{idProduct}=="9008", MODE="0660", GROUP="adbusers", TAG+="uaccess"

# Qualcomm Memory Debug
SUBSYSTEMS=="usb", ATTRS{idVendor}=="05c6", ATTRS{idProduct}=="9006", MODE="0660", GROUP="adbusers", TAG+="uaccess"

# Qualcomm Memory Debug
SUBSYSTEMS=="usb", ATTRS{idVendor}=="05c6", ATTRS{idProduct}=="900E", MODE="0660", GROUP="adbusers", TAG+="uaccess"

# LG Memory Debug
SUBSYSTEMS=="usb", ATTRS{idVendor}=="1004", ATTRS{idProduct}=="61a1", MODE="0660", GROUP="adbusers", TAG+="uaccess"

# Sierra Wireless
SUBSYSTEMS=="usb", ATTRS{idVendor}=="1199", ATTRS{idProduct}=="9071", MODE="0660", GROUP="adbusers", TAG+="uaccess"
END

  # scripts
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/mtk" << END
#!/usr/bin/env sh
exec python /opt/$_pkgname/mtk.py "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/mtk_gui" << END
#!/usr/bin/env sh
exec python /opt/$_pkgname/mtk_gui.py "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/stage2" << END
#!/usr/bin/env sh
exec python /opt/$_pkgname/stage2.py "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/brom_to_offs" << END
#!/usr/bin/env sh
exec python /opt/$_pkgname/mtkclient/Tools/brom_to_offs.py "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/da_parser" << END
#!/usr/bin/env sh
exec python /opt/$_pkgname/mtkclient/Tools/da_parser.py "\$@"
END

  # generate pyc files
  python -m compileall -o0 -o1 -f -p / -s "$pkgdir" "$pkgdir/"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
