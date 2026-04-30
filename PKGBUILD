# Maintainer: Mohammad Abu-Khader <mohammad.abukhader@hotmail.com>

_pkgname=arabizi-ibus
pkgname=arabizi-ibus-git
pkgver=0.1.1
pkgrel=1
pkgdesc="Linux-native IBus input method for real-time Arabizi-to-Arabic transliteration"
arch=('any')
url="https://github.com/xoity/arabizi-ibus"
license=('MIT')
depends=('ibus' 'python' 'python-gobject')
makedepends=('git')
provides=('arabizi-ibus')
conflicts=('arabizi-ibus')
install="${pkgname}.install"
source=("git+${url}.git")
sha256sums=('SKIP')

check() {
  cd "${srcdir}/${_pkgname}"
  python -m unittest discover -s tests -v
}

package() {
  cd "${srcdir}/${_pkgname}"

  local data_file
  for data_file in arabizi_ibus/*.py arabizi_ibus/*.json; do
    install -Dm644 "${data_file}" "${pkgdir}/usr/lib/ibus-arabizi/arabizi_ibus/$(basename "${data_file}")"
  done

  if [[ -f arabizi_ibus/common_words_1000.sqlite3 ]]; then
    install -Dm644 arabizi_ibus/common_words_1000.sqlite3 \
      "${pkgdir}/usr/lib/ibus-arabizi/arabizi_ibus/common_words_1000.sqlite3"
  fi

  install -Dm755 bin/arabizi-ibus-engine "${pkgdir}/usr/bin/arabizi-ibus-engine"
  install -Dm644 data/arabizi.xml "${pkgdir}/usr/share/ibus/component/arabizi.xml"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
