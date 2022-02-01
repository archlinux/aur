# Contributor: Aleksander Mietinen <aleksander at mietinen dot net>
# Contributor: Hannes Eichblatt <aur@hanneseichblatt.de>
_base=SecLists
pkgname=${_base,,}
pkgver=2022.1
pkgrel=1
pkgdesc="A collection of multiple types of lists used during security assessments, collected in one place."
arch=(any)
url="https://github.com/danielmiessler/${_base}"
license=(MIT)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('0532d2a3179d5c7e82f4a6aaecbecb8071655c8639b4c4243b5b8aa79c0762828c576c935be42148c9ad813a8ac11ea2a208c23afcb6925a398ea21e9378b5c7')

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
