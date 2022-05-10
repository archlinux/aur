# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>
# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=solana-bin
_pkgname="${pkgname%-bin}"
pkgver=1.9.21
pkgrel=1
pkgdesc='Solana CLI tools'
arch=('x86_64')
url='https://solana.com'
license=('Apache')
depends=(
  'openssl'
  'systemd-libs'
)
optdepends=('bash-completion: for tab completion')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
source=(
  "$_pkgname-$pkgver.tar.bz2::https://github.com/$_pkgname-labs/$_pkgname/releases/download/v$pkgver/$_pkgname-release-x86_64-unknown-linux-gnu.tar.bz2"
  "$_pkgname.sysusers"
  "$_pkgname.tmpfiles"
  #"$_pkgname-sys-tuner.service"
  #"$_pkgname-test.service"
)
sha256sums=('94fde4a97b455ce7eb753804b117a1481d7a0c16ee5c6b58b4ac6d333aadf57f'
            '3e893948c70e514ee369253fe37cf1d7cb3f99d350656f3c9a777ea87f895ca6'
            '4a5a6060c734f0c85d4e13e5124ee30f6612a6a812642d043e0bff18790776f5')

package() {
  mkdir --parents \
    "$pkgdir/etc/profile.d" \
    "$pkgdir/opt" \
    "$pkgdir/usr/bin"
  mv "$_pkgname-release" "$pkgdir/opt"
  echo -e "# Set path to Solana directory\n\nappend_path '/opt/solana-release/bin'\n\nexport PATH" > "$pkgdir/etc/profile.d/$_pkgname.sh"
  echo -e "# Set path to Solana directory\n\nsetenv PATH \${PATH}:/opt/solana-release/bin" > "$pkgdir/etc/profile.d/$_pkgname.csh"
  for FILE in "$pkgdir/opt/solana-release/bin"/*; do
    if [ ! -d "$FILE" ]; then
      ln --symbolic --target-directory "$pkgdir/usr/bin" "${FILE#$pkgdir}"
    fi
  done
  install \
    -D \
    --mode 644 \
      "$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install \
    -D \
    --mode 644 \
      "$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  "$pkgdir/opt/solana-release/bin/$_pkgname" completion --shell bash | install -D --mode 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  "$pkgdir/opt/solana-release/bin/$_pkgname" completion --shell zsh | install -D --mode 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

  #install -Dm 644 "$_pkgname"-*.service -t "$pkgdir/usr/lib/systemd/system"
}

# vim: ts=2 sw=2 et:
