# Contributor: Aleksander Mietinen <aleksander at mietinen dot net>
# Contributor: Hannes Eichblatt <aur@hanneseichblatt.de>
_base=SecLists
pkgname=${_base,,}
pkgver=2022.2
pkgrel=1
pkgdesc="A collection of multiple types of lists used during security assessments, collected in one place."
arch=(any)
url="https://github.com/danielmiessler/${_base}"
license=(MIT)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('d5c4a6f4d62c3179754de046ab5b0a10ee1b089b0c7503f236ca92aef320eabf3bf13825e3b9d13098461563ba25945af5bea302677d517b8401a47f78c2f63f')

prepare() {
  cd ${_base}-${pkgver}
  find . -iname "rockyou*.tar.gz" -exec sh -c 'tar zxf {} -C $(dirname {}); rm {}' \;
}

package() {
  cd ${_base}-${pkgver}

  # Install to /usr/share/seclists
  find . \( ! -iname "*.md" -a ! -iname ".git*" -a ! -name "LICENSE" \) -type f \
    -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;

  # Install all *.md files to /usr/share/doc/seclists
  find . -iname "*.md" -type f \
    -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
