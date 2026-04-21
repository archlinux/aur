# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=korb
pkgver=0.4.7
pkgrel=6
pkgdesc='Unofficial grocery delivery CLI for German supermarket chain REWE'
arch=('x86_64')
url='https://github.com/yannick-cw/korb'
license=('BSD-3-Clause')
depends=(
  'bash'
  'curl'
  'haskell-aeson'
  'haskell-aeson-pretty'
  'haskell-base64-bytestring'
  'haskell-crypton'
  'haskell-file-embed'
  'haskell-memory'
  'haskell-optparse-applicative'
  'haskell-regex-tdfa'
  'haskell-req'
  'haskell-tls'
  'haskell-uuid'
  'libnotify'
  'zlib'
)
makedepends=('apkeep' 'ghc' 'jadx' 'jq' 'unzip' 'uusi' 'vim')
checkdepends=(
  'haskell-hedgehog'
  'haskell-hspec'
  'haskell-hspec-hedgehog'
)
optdepends=(
  'wl-clipboard: clipboard support on Wayland for the login flow'
  'xclip: clipboard support on X11 for the login flow'
  'xsel: clipboard support on X11 for the login flow'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/yannick-cw/korb/archive/v${pkgver}.tar.gz"
  'korb-auth-helper.desktop'
  'korb-auth-helper.sh'
  # Any recent version of the .xapk will do; we only need it for the backend credentials
  # Pinning the version anyway for reproducibility
  'de.rewe.app.mobile.xapk::xapk://de.rewe.app.mobile@5.11.0'
)

sha512sums=('cf900c35310ed9e13417e6c2b6a64a30f5121adfed5e0bdaff2bcc5b6a2074334f36425396859217db19fb9d04d9e63e449a7c02906e513f63fbeddd4fa5cc7b'
            'b25effa6e67591211f4e772ab5d39aad96c08beac70898ccefaaac99dc1bb14336393a24f5c228575bc75c5a6568772c3c03e8b86748023d4248084fcfb41ed5'
            '9ec299657ec5a3a4c584755f302c4bccea26daf1cefff2a3252edb46cb95bf7d66e133c01dfdbf6399fb1bedd47e664ca402e632b08f46cd87d216646759ed12'
            'SKIP')

# If `de.rewe.app.mobile.xapk` is not already present, use `apkeep` (AUR) to download it
#shellcheck disable=SC2016  # Not meant to be expanded at declaration time
DLAGENTS+=('xapk::/bin/sh -c ln\ -fs\ \$(basename\ "\$1").xapk\ "\$2"\ &&\ /usr/bin/apkeep\ --app\ \$(basename\ "\$1")\ . _ %u %o')

noextract=('de.rewe.app.mobile.xapk')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Fix compilation issue GHC-76037 ("Not in scope") introduced in
  # v0.4.7
  sed -i 's/TIO\.show \(\w*\)/TIO.pack (show \1)/' \
    src/HttpClient.hs test/Test/CLI.hs

  # Extract private key and certificate from the APK
  unzip -o -d xapk ../de.rewe.app.mobile.xapk de.rewe.app.mobile.apk
  unzip -p xapk/de.rewe.app.mobile.apk res/raw/mtls_prod.pfx \
    > mtls_prod.pfx
  unzip -o xapk/de.rewe.app.mobile.apk 'classes*.dex'
  jadx -r -d decompiled \
    --integer-format hexadecimal --output-format json \
    classes*.dex || true

  # A couple of `jq` invocations may error out, for example:
  #
  #     jq: parse error: Unmatched '}' at line 692470, column 4
  #     jq: error (at decompiled/sources/mapping.json:3460120): Cannot iterate over null (null)
  #
  # These errors are caused by upstream bugs in jadx’s JSON
  # serialization. They are harmless for our purposes and can be
  # safely ignored.
  read -r passphrase < <(
    find decompiled -name '*.json' -exec jq -r \
      '.methods[]
        | select(.signature == "<clinit>()V")
        | .lines[].code
        | select(startswith("Integer[] numArr = {"))' \
      '{}' + \
      | grep -oP '0x\K[0-9a-fA-F]+' \
      | xxd -r -p
  ) || true

  export passphrase
  mkdir -p certs/mobile-clients-api.rewe.de
  openssl pkcs12 -legacy -nokeys -in mtls_prod.pfx \
    -out certs/mobile-clients-api.rewe.de/private.pem \
    -passin env:passphrase
  openssl pkcs12 -legacy -nocerts -nodes -in mtls_prod.pfx \
    -out certs/mobile-clients-api.rewe.de/private.key \
    -passin env:passphrase

  # ghc v9.6.6 does not support the 2024 language edition.
  # Remove this patch once v9.10.1 or newer lands on extra.
  # See also: https://downloads.haskell.org/~ghc/9.10.1/docs/users_guide/exts/control.html#extension-GHC2024
  sed -i \
    -e 's/GHC2024/GHC2021/' \
    -e 's/^\(\s*\)\(ApplicativeDo\)/\1\2\n\1DataKinds\n\1DerivingStrategies/' \
    korb.cabal

  # `haskell-crypton` requires `haskell-memory`, whose symbols
  # conflict with `ram`, so replace our own dependency on `ram` with
  # `memory`
  sed -i 's/^\(\s*\)\(ram,\)/\1memory,/' korb.cabal

  gen-setup
}

build() {
  cd "${pkgname}-${pkgver}"

  runhaskell Setup configure -O --enable-shared --enable-debug-info \
    --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
    --datasubdir="${pkgname}" --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  #shellcheck disable=SC2086
  runhaskell Setup build $MAKEFLAGS
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd "${pkgname}-${pkgver}"

  # Exclude the differential round-trip test case, which would
  # require us to build a companion binary using Lean. However, that
  # test case is not even really useful at packaging time, so just
  # skip it instead.
  runhaskell Setup test --test-option='--skip=/Suggestion Lean DRT/'
}

package() {
  cd "${pkgname}-${pkgver}"
  install -D -m 755 ../korb-auth-helper.sh \
    "${pkgdir}/usr/lib/${pkgname}/bin/korb-auth-helper"
  install -D -m 644 ../korb-auth-helper.desktop -t "${pkgdir}/usr/share/applications"
  install -D -m 744 register.sh "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
  install -D -m 744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
  runhaskell Setup copy --destdir="${pkgdir}"
  install -D -m 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
