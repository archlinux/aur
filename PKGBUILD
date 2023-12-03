# Contributor: Aleksander Mietinen <aleksander at mietinen dot net>
# Contributor: Hannes Eichblatt <aur@hanneseichblatt.de>
_base=SecLists
pkgname=${_base,,}
pkgver=2023.4
pkgrel=1
pkgdesc="A collection of multiple types of lists used during security assessments, collected in one place."
arch=(any)
url="https://github.com/danielmiessler/${_base}"
license=(MIT)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('21661fa2ee4380d4b73e6a677ab846ee447f3b30fda4681853d1945921efaf87807fd400905c18a0d93f4abdda9267b1fda388fecd96c4290ab16289ab000b88')

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
