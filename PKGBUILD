# Maintainer:
# Contributor: Ben Westover <kwestover.kw@gmail.com>

_pkgname="mtkclient"
pkgname="$_pkgname-git"
pkgver=2.0.1.r29.ge34fc91
pkgrel=1
pkgdesc="Unofficial MTK reverse engineering and flash tool"
url="https://github.com/bkerler/mtkclient"
license=('GPL-3.0-only')
arch=('any')

depends=(
  python
)
makedepends=(
  git
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!debug')

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://github.com/bkerler/mtkclient.git"
  "udev.patch"
)
sha256sums=(
  'SKIP'
  'd4b6d7967324e585f69c51257e4293f390291a9534e697eefc94568d169220bc'
)

pkgver() {
  cd mtkclient
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc/mtkclient"

  # Replace plugdev with uaccess and adbusers like upstream android-udev
  patch -Np1 -i "$srcdir/udev.patch"
}

package() {
  depends+=(
    libusb
    pyside6
    python-capstone
    python-colorama
    python-keystone
    python-pycryptodome
    python-pycryptodomex
    python-pyserial
    python-pyusb
    python-unicorn

    # AUR
    python-fusepy
    python-mock
  )

  # main files
  install -dm755 "$pkgdir/opt/$_pkgname"
  for i in mtk.py mtk_gui.py stage2.py examples mtkclient; do
    cp -a "$_pkgsrc/$i" "$pkgdir/opt/$_pkgname/"
  done

  # unwanted
  for i in build Setup src Windows; do
    rm -rf "$pkgdir/opt/$_pkgname/mtkclient/$i"
  done

  # udev rules
  install -Dm644 "$_pkgsrc"/mtkclient/Setup/Linux/51-edl.rules "$pkgdir"/usr/lib/udev/rules.d/52-mtk-edl.rules

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

  python -m compileall "$pkgdir/opt/$_pkgname/"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
