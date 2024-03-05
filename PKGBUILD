# Maintainer:
# Contributor: mditto <michael.r.ditto@gmail.com>

_pkgname="paintstorm"
pkgname="$_pkgname"
pkgver=2.50
pkgrel=1
pkgdesc="Professional software for digital painting"
url="https://www.paintstormstudio.com"
license=('LicenseRef-Paintstorm')
arch=('x86_64')

makedepends=(
  'html-xml-utils'
  'pandoc'
)

options=(!strip !debug emptydirs)

_filename="Paintstorm_linux_v${pkgver}.run"
_pkgext="tar.gz"
source=(
  "$_filename.$_pkgext"::"https://www.paintstormstudio.com/$_filename.$_pkgext"
)
sha256sums=(
  'aaa581752027b3445578dfc9dc3e72048194f4908291eaf11c60b91947ac35c1'
)

_privacy_policy="privacy_policy"
_privacy_policy_url="https://www.paintstormstudio.com/help/privacy-policy/"
_terms_of_use="terms_of_use"
_terms_of_use_url="https://www.paintstormstudio.com/help/license-agreement/"

prepare() {
  # extract files
  sh "$_filename" --noexec

  # delete junk .* files
  find "$srcdir/PaintstormInstall/paintstorm" -type f -name '.*' -delete
  find "$srcdir/PaintstormInstall/paintstorm" -type f -iname '~*' -delete

  # privacy policy
  curl --no-progress-meter \
    -o "$_privacy_policy-1.html" \
    "$_privacy_policy_url"

  hxnormalize -x "$_privacy_policy-1.html" \
    | hxselect article \
    1> "$_privacy_policy-2.html" \
    2> /dev/null

  pandoc --quiet -t plain -o "$_privacy_policy.txt" "$_privacy_policy-2.html"

  # terms of use 
  curl --no-progress-meter \
    -o "$_terms_of_use-1.html" \
    "$_terms_of_use_url"

  hxnormalize -x "$_terms_of_use-1.html" \
    | hxselect article \
    1> "$_terms_of_use-2.html" \
    2> /dev/null

  pandoc --quiet -t plain -o "$_terms_of_use.txt" "$_terms_of_use-2.html"
}

package() {
  depends=(
    'ftgl'
    'gtk2'
    'libcurl-gnutls'

    # AUR
    'glew1.13'
  )

  # move files
  install -dm755 "$pkgdir/usr"/{bin,share}
  mv PaintstormInstall/paintstorm "$pkgdir/usr/share/"

  install -Dm755 "PaintstormInstall/paintstorm.desktop" -t "$pkgdir/usr/share/applications/"

  ln -s "/usr/share/paintstorm/Paintstorm" "$pkgdir/usr/bin/paintstorm"

  # prevent crash
  install -dm755 "$pkgdir/usr/share/fonts"/{opentype,truetype}

  # license/eula
  install -Dm644 "$_privacy_policy.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$_terms_of_use.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
