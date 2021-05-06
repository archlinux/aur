# Maintainer: pallxk <aur@pallxk.com>
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux

pkgname=azure-cli
pkgver=2.23.0
pkgrel=1
pkgdesc="Command-line tools for Azure."
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=("python")
conflicts=("python-azure-cli")
source=("install-$pkgver.py::https://raw.githubusercontent.com/Azure/azure-cli/azure-cli-$pkgver/scripts/curl_install_pypi/install.py"
        "install.response"
        "az")
sha256sums=("c5107b96cfe881c46c8d8d9f401fcf931aab2b769a20fda58626b6e6e907219b"
            "7c05e9915a52fb72fa8d1c498b173c42457d669351313eaddccf43f86ed0e0ec"
            "990f70efec828c1e1f3f57748fc6e40f9705f2223dc96683e8e29d118daac116")
options=(!strip)

prepare() {
  rm -rf "$srcdir/azure-cli"
  grep -v -E '^===>|^$' install.response | python "$srcdir/install-$pkgver.py"
  find "$srcdir/azure-cli/bin" -type f -print0 | xargs -0 sed -i -e "s|$srcdir|/opt|g"
}

pkgver() {
  # Make sure we have a writable $HOME/.azure directory to run az
  HOME=$srcdir "$srcdir/bin/az" --version 2> /dev/null | head -1 | tr -c -d 0-9.
}

package() {
  mkdir "$pkgdir/opt"
  cp -r azure-cli "$pkgdir/opt"

  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 az "$pkgdir/usr/bin"

  install -Dm644 "$pkgdir/opt/azure-cli/az.completion" \
    "$pkgdir/etc/bash_completion.d/azure-cli"
}
