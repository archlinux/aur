# Maintainer: pallxk <aur@pallxk.com>
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux

pkgname=azure-cli
pkgver=2.8.0
pkgrel=1
pkgdesc="Command-line tools for Azure."
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=("python")
conflicts=("python-azure-cli")
source=("https://azurecliprod.blob.core.windows.net/install.py"
        "install.response"
        "az")
# SKIP checking sum for install.py as it's changed periodically without URL
# versioned, breaking helpers like yay or manual build without clean. And it's
# using https so we should be fine. If incompatible changes of the script occur
# in the future, the sum should get checked again.
sha256sums=("SKIP"  # "8835ac5023e292b9c3afa44f7e9a2c0058c56789114891fb921ee85fbc9c2002"
            "7c05e9915a52fb72fa8d1c498b173c42457d669351313eaddccf43f86ed0e0ec"
            "990f70efec828c1e1f3f57748fc6e40f9705f2223dc96683e8e29d118daac116")

prepare() {
  rm -rf "$srcdir/azure-cli"
  grep -v -E '^===>|^$' install.response | python "$srcdir/install.py"
  find "$srcdir/azure-cli/bin" -type f -print0 | xargs -0 sed -i -e "s|$srcdir|/opt|g"
}

pkgver() {
  "$srcdir/bin/az" --version 2> /dev/null | head -1 | tr -c -d 0-9.
}

package() {
  mkdir "$pkgdir/opt"
  cp -r azure-cli "$pkgdir/opt"

  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 az "$pkgdir/usr/bin"

  install -Dm644 "$pkgdir/opt/azure-cli/az.completion" \
    "$pkgdir/etc/bash_completion.d/azure-cli"
}
