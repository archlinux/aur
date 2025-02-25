# Maintainer:
# Contributor: mditto <michael.r.ditto@gmail.com>

_pkgname="paintstorm"
pkgname="$_pkgname"
pkgver=2.50
pkgrel=2
pkgdesc="Professional software for digital painting"
url="https://www.paintstormstudio.com"
license=('LicenseRef-Paintstorm')
arch=('x86_64')

depends=(
  'ftgl'
  'gtk2'
  'libcurl-gnutls'
  'libgl'
)
makedepends=(
  'html-xml-utils'
  'patchelf'
  'w3m'
)

options=('!strip' '!debug' 'emptydirs')

_glew_pkgver=1.13.0
_glew_pkgsrc="glew-$_glew_pkgver"

_filename="Paintstorm_linux_v${pkgver}.run"
_pkgext="tar.gz"
source=(
  "$_filename.$_pkgext"::"https://www.paintstormstudio.com/$_filename.$_pkgext"
  "$_glew_pkgsrc.$_pkgext"::"https://downloads.sourceforge.net/glew/$_glew_pkgsrc.tgz"
)
sha256sums=(
  'aaa581752027b3445578dfc9dc3e72048194f4908291eaf11c60b91947ac35c1'
  'aa25dc48ed84b0b64b8d41cdd42c8f40f149c37fa2ffa39cd97f42c78d128bc7'
)

_privacy_policy="privacy_policy"
_privacy_policy_url="https://www.paintstormstudio.com/help/privacy-policy/"
_terms_of_use="terms_of_use"
_terms_of_use_url="https://www.paintstormstudio.com/help/license-agreement/"

prepare() {
  # glew
  sed -i 's|lib64|lib|' "$_glew_pkgsrc"/config/Makefile.linux

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

  w3m -O UTF-8 -cols 80 -dump "$_privacy_policy-2.html" > "$_privacy_policy.txt"

  # terms of use
  curl --no-progress-meter \
    -o "$_terms_of_use-1.html" \
    "$_terms_of_use_url"

  hxnormalize -x "$_terms_of_use-1.html" \
    | hxselect article \
      1> "$_terms_of_use-2.html" \
      2> /dev/null

  w3m -O UTF-8 -cols 80 -dump "$_terms_of_use-2.html" > "$_terms_of_use.txt"
}

build() {
  cd "$_glew_pkgsrc"
  make
}

package() {
  # files
  install -dm755 "$pkgdir/usr"/{bin,share}
  mv PaintstormInstall/paintstorm "$pkgdir/usr/share/"

  # launcher
  install -Dm755 "PaintstormInstall/paintstorm.desktop" -t "$pkgdir/usr/share/applications/"

  # rpath
  patchelf --set-rpath '$ORIGIN' "$pkgdir/usr/share/paintstorm/Paintstorm"

  # symlink
  ln -srf "$pkgdir/usr/share/paintstorm/Paintstorm" "$pkgdir/usr/bin/paintstorm"

  # glew
  install -Dm644 "$_glew_pkgsrc"/lib/libGLEW.so* -t "$pkgdir/usr/share/paintstorm/"

  # prevent crash
  install -Dm644 /dev/null "$pkgdir/usr/share/fonts/opentype/.paintstorm"
  install -Dm644 /dev/null "$pkgdir/usr/share/fonts/truetype/.paintstorm"

  # license/eula
  install -Dm644 "$_privacy_policy.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$_terms_of_use.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
