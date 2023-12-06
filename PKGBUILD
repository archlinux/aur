# Maintainer: pallxk <aur@pallxk.com>
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux

pkgname=azure-cli
pkgver=2.55.0
pkgrel=1
pkgdesc="Command-line tools for Azure."
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=("python")
conflicts=("python-azure-cli")
source=("install.py"
        "install.response"
        "az")
sha256sums=("10fbef43805ed5536aa08c166c5e7ee31e39d990c559387b316a33d96a8f32da"
            "7c05e9915a52fb72fa8d1c498b173c42457d669351313eaddccf43f86ed0e0ec"
            "990f70efec828c1e1f3f57748fc6e40f9705f2223dc96683e8e29d118daac116")
options=(!strip)

prepare() {
  rm -rf "$srcdir/azure-cli"

  # /usr/bin/python to ensure we use system python, rather than anaconda or something else.
  grep -v -E '^===>|^$' install.response | /usr/bin/python "$srcdir/install.py"

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
    "$pkgdir/usr/share/bash-completion/completions/az"
}
