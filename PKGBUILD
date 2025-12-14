# Maintainer:

# prevent 406 error
export DLAGENTS=("${DLAGENTS[@]/'/usr/bin/curl'/'/usr/bin/curl -A Mozilla'}")

pkgbase="otf-typodermic-free"
pkgname=(
  "otf-typodermic-free"
  "otf-typodermic-pd"
)
pkgver=2024.12
pkgrel=1
pkgdesc="Free Fonts from Typodermic"
url="https://typodermicfonts.com/downloads/"
arch=('any')

_file_free="typodermic-free-fonts-${pkgver%.*}d.zip"
_file_pd="typodermic-public-domain-${pkgver%.*}-${pkgver#*.}.zip"
noextract=(
  "$_file_free"
  "$_file_pd"
)
source=(
  "https://typodermicfonts.com/wp-content/uploads/${pkgver%.*}/${pkgver#*.}/$_file_free"
  "https://typodermicfonts.com/wp-content/uploads/${pkgver%.*}/${pkgver#*.}/$_file_pd"
)

sha256sums=(
  '1663e5e486557458f54dc2e5242798b2ea1cdef1017200c5d000cd7a9c488c10'
  '834518218043751906b9aba9d5fc30b952c8a3eaa18dca2c8fa07f7fafdf3b34'
)

prepare() {
  for i in "${noextract[@]}"; do
    mkdir -p "${i%.zip}"
    bsdtar -x -C "${i%.zip}" -f "$i"
  done
}

package_otf-typodermic-free() {
  license=('LicenseRef-Typodermic-EULA')

  cd "${_file_free%.zip}"
  install -Dm644 *.otf -t "$pkgdir/usr/share/fonts/${pkgname#*-}/"
  install -Dm644 "Typodermic Desktop EULA 2023.pdf" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_otf-typodermic-pd() {
  pkgdesc+=" - public domain"
  license=('CC0-1.0')

  cd "${_file_pd%.zip}"
  install -Dm644 "OpenType Fonts"/*.otf -t "$pkgdir/usr/share/fonts/${pkgname#*-}/"
  install -Dm644 "License.txt" "${pkgdir:?}/usr/share/licenses/$pkgname/LICENSE"
}
